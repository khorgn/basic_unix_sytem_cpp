import Data.Monoid (Sum(..), (<>))
import Control.Monad.Writer ( Writer(..)
                            , writer
                            , runWriter
                            , tell
                            )
-- == Without Writer == --

-- sometimes you want to keep trace of what is happening or tracks of something during multiple computations

isBig :: Int -> Bool
isBig x = x > 9

-- a simple way is to return a tuple
isBigTrace :: Int -> (Bool, String)
isBigTrace x = (x > 9, "Compared number to 9.")

-- we need a function to handle these tuples through like bind 
bindLogString :: (a, String) -> (a -> (b, String)) -> (b, String)
bindLogString (x, log) f = let (y, newLog) = f x in (y, log ++ newLog)
-- it works similar to bindMaybe and >>=

-- we could improve it by making the log more general
bindLogList :: (a, [l]) -> (a -> (b, [l])) -> (b, [l])
bindLogList (x, logs) f = let (y, newLogs) = f x in (y, logs ++ newLogs)

-- We could make it even more general with monoids

-- == With Monoids == --
-- monoids offer us the default log when nothing has happened yet and the function to process to logs together
-- we or not limited to logging anymore, but can also use Sum or Product to track other values
bindLogMonoid :: (Monoid m) => (a, m) -> (a -> (b, m)) -> (b, m)
bindLogMonoid (x, log) f = let (y, newLog) = f x in (y, log `mappend` newLog)


type Food = String
type Price = Sum Int
addDrink :: Food -> (Food, Price)
addDrink "beans" = ("milk", Sum 25)
addDrink "jerky" = ("whiskey", Sum 99)
addDrink _ = ("beer", Sum 30)

exampleMonoid1 = ( ("bread", Sum 5) `bindLogMonoid` addDrink `bindLogMonoid` addDrink ) == ("beer",Sum {getSum=65})


-- == The Writer Type == --
-- Writer is approximativaly implemented as thus
newtype MyWriter w a = MyWriter { runMyWriter :: (a, w) }

instance Functor (MyWriter w) where
  fmap f (MyWriter (a, w)) = MyWriter (f a, w)
instance Monoid w => Applicative (MyWriter w) where
  pure a = MyWriter (a, mempty)
  MyWriter (f, w) <*> MyWriter (a, w') = MyWriter (f a, w <> w')
instance Monoid w => Monad (MyWriter w) where
  return = pure
  MyWriter (a, w) >>= f = let (b, w') = runMyWriter (f a) in MyWriter (b, w <> w')


-- example use
exampleWriter1 = runWriter (return 3 :: Writer String Int)
exampleWriter2 = runWriter (return 3 :: Writer (Sum Int) Int)

-- == Using do notations with Writer == --

exampleDo1 = runWriter multWithLog == (15, ["Got number: 3", "Got number: 5", "Gonna multiply these two"])
  where
  logNumber :: Int -> Writer [String] Int
  logNumber x = writer (x, ["Got number: " ++ show x])
  multWithLog :: Writer [String] Int
  multWithLog = do
    a <- logNumber 3
    b <- logNumber 5
    tell ["Gonna multiply these two"]
    return (a*b)


-- == Adding logging to programs == --

