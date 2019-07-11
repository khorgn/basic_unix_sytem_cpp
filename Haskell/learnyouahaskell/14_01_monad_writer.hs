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
-- example: euclids greatest common divisor (exists as gcd in haskell) (and lcm for least common multiple)
gcd' :: Int -> Int -> Int
gcd' a b
  | b == 0 = a
  | otherwise = gcd' b (a `mod` b)

-- we want to log this function
gcdLog' :: Int -> Int -> Writer [String] Int
gcdLog' a b
  | b == 0 = do
          tell ["Finished with " ++ show a]
          return a
  | otherwise = do
          tell [show a ++ " mod " ++ show b ++ " = " ++ show (a `mod` b)]
          gcdLog' b (a `mod` b)

exampleLogging = mapM_ putStrLn $ snd $ runWriter $ gcdLog' 8 3
-- reminder for mapM_ :: (Foldable t, Monad m) => (a -> m b) -> t a -> m ()
-- a mapper that disregard the result, (mainly usefull for IOs)
-- sequence is with foldable of monads being transformed into one monad



-- == inefficient list construction == --
-- when doing frequent appends, lists can become very slow with the need to always go through the first list
-- in gcdLog' the logging is fast because the appending is done like this: a ++ (b ++ (c ++ d ++ (e ++ f)))
-- lists are constructed from left to right, and with this way each part of the list is only passed through once (a is constructed, then b is construct, then c ...
-- if the list is constructed this way instead: ((((a ++ b) ++ c) ++ d) ++ e) ++ f the left part need to be reconstructed at each step

gcdLogR :: Int -> Int -> Writer [String] Int
gcdLogR a b
  | b == 0 = do
          tell ["Finished with " ++ show a]
          return a
  | otherwise = do
          -- this gcd does the recursion before doing the log, so this log will be after the log of lower recursions
          -- ++ is associated to the left instead of to the right, so it is inefficient
          result <- gcdLogR b (a `mod` b)
          tell [show a ++ "mod " ++ show b ++ " = " ++ show (a `mod` b)]
          return result

exampleLogR = mapM_ putStrLn $ snd $ runWriter (gcdLogR 8 3)


-- == Difference lists == --
-- a difference is a list representation through functions
-- a dlist is a function that takes a list and prepend another list to it
-- [1, 2, 3]
exampleDiffList1 xs = [1, 2, 3] ++ xs
-- []
exampleDiffList2 = ([]++)
-- chain appending become a composition of functions, which helps resolution
append :: (b -> c) -> (a -> b) -> a -> c
f `append` g = \xs -> f (g xs)
-- equivalent to \xs -> [1,2,3] ++ ([4,5,6] ++ xs)
exampleDiffList3 = exampleAppend [] == [1, 2, 3, 4, 5, 6]
  where
  exampleAppend = ([1, 2, 3]++) `append` ([4, 5, 6]++)

-- = implementing the DiffList = --
-- we define a difflist as a function that takes a list and return a list
newtype DiffList a = DiffList { getDiffList :: [a] -> [a] }
-- to create a difflist we make a function that takes the list and prepend it
toDiffList :: [a] -> DiffList a
toDiffList xs = DiffList(xs++)
-- to recover the list we apply this function to an empty list
fromDiffList :: DiffList a -> [a]
fromDiffList (DiffList f) = f []

instance Monoid (DiffList a) where
  mempty = DiffList (\xs -> [] ++ xs)
  (DiffList f) `mappend` (DiffList g) = DiffList (\xs -> (f . g) xs) -- same as f (g xs)

exampleDiffList4 = ( fromDiffList $ (toDiffList [1,2,3] `mappend` toDiffList [4,5,6]) ) == [1,2,3,4,5,6]

gcdLogR' :: Int -> Int -> Writer (DiffList String) Int
gcdLogR' a b
  | b == 0 = do
            tell (toDiffList ["Finished with " ++ show a])
            return a
  | otherwise = do
            result <- gcdLogR' b (a `mod` b)
            tell (toDiffList [show a ++ " mod " ++ show b ++ " = " ++ show (a `mod` b)])
            return result


exampleGcdLogR' = mapM_ putStrLn . fromDiffList . snd . runWriter $ gcdLogR' 110 34

-- == Comparing performances == --
-- comparing performances between list and difflist
finalCountDownL :: Int -> Writer [String] ()
finalCountDownL 0 = do
      tell ["0"]
finalCountDownL x = do
      finalCountDownL (x-1)
      tell [show x]

finalCountDownDL :: Int -> Writer (DiffList String) ()
finalCountDownDL 0 = do
      tell (toDiffList ["0"])
finalCountDownDL x = do
      finalCountDownDL (x-1)
      tell (toDiffList [show x])

finalCountDownRL :: Int -> Writer [String] ()
finalCountDownRL 0 = do
      tell ["0"]
finalCountDownRL x = do
      finalCountDownRL (x-1)
      tell [show x]

finalCountDownRDL :: Int -> Writer (DiffList String) ()
finalCountDownRDL 0 = do
      tell (toDiffList ["0"])
finalCountDownRDL x = do
      finalCountDownRDL (x-1)
      tell (toDiffList [show x])

compareL = mapM_ putStrLn . snd . runWriter $ finalCountDownL 10000 -- 7.41s; 4,350,599,640b
compareDL = mapM_ putStrLn . fromDiffList . snd . runWriter $ finalCountDownDL 10000 -- 0.50s; 54,731,152b
compareRL = mapM_ putStrLn . snd . runWriter $ finalCountDownRL 10000 -- 6.86s; 4,350,593,384b
compareRDL = mapM_ putStrLn . fromDiffList . snd . runWriter $ finalCountDownRDL 10000 -- 0.45s; 54,727,432b

