-- when used as applicative functors, lists repsents non-deterministic values
-- it is the same for monads

import Control.Monad (MonadPlus(..), guard)

reminderApplicative = ( (*) <$> [1, 2, 3] <*> [10, 100, 1000] ) == [10, 100, 1000, 20, 200, 2000, 30, 300, 3000]

class Applicative m => MyMonad m where
  myReturn :: a -> m a
  myReturn = pure
  (~>>~) :: m a -> m b -> m b
  x ~>>~ y = x ~>>=~ \_ -> y
  myFail :: String -> m a
  myFail s = error s
  (~>>=~) :: m a -> (a -> m b) -> m b

instance MyMonad [] where
  myFail _ = []
  xs ~>>=~ f = concat (map f xs) -- [y | x <- xs, y <- f x]
  

exampleMonad1 = routine == [3, -3, 4, -4, 5, -5]
  where routine = [3, 4, 5] >>= \x -> [x, -x]
        hiddenRoutine = fmap (\x -> [x, -x]) [3, 4, 5] == [[3, -3], [4, -4], [5, -5]]

exampleMonad2 = routine == [(1, 'a'), (1, 'b'), (2, 'a'), (2, 'b')]
  where routine = [1, 2] >>= \n -> ['a', 'b'] >>= \ch -> return (n, ch)
        equivalentTo = do
          n <- [1, 2]
          ch <- ['a', 'b']
          return (n, ch)
        equivalentTo' = [(n, ch) | n <- [1, 2], ch <- ['a', 'b']]
        kindaEquivalentTo = (,) <$> [1, 2] <*> ['a', 'b'] -- doesn't pass by [[(1,'a')],[(1,'n')],[(2,'a')],[(2,'b')]]

exampleMonad3 = routine == [7, 17, 27, 37, 47]
  where routine = [x | x <- [1..50], '7' `elem` show x]
        equivalentTo = do
          x <- [1..50]
          guard ('7' `elem` show x)
          return x
        equivalentTo' = [1..50] >>= \x -> guard ('7' `elem` show x) >> return x

myGuard :: (MonadPlus m) => Bool -> m()
myGuard True = return ()
myGuard False = mzero

exampleGuard1 = routine == Just ()
  where routine = guard (5 > 2) :: Maybe ()

exampleGuard1' = routine == Nothing
  where routine = guard (1 > 2) :: Maybe ()

exampleGuard2 = routine == [()]
  where routine = guard (5 > 2) :: [()]

exampleGuard2' = routine == []
  where routine = guard (1 > 2) :: [()]


