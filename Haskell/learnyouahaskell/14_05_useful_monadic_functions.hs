import Control.Applicative ( liftA, liftA2, liftA3
                           )
import Control.Monad ( liftM, liftM2, liftM3, liftM4, liftM5
                     , ap
                     , join
                     , filterM
                     , (>=>), (<=<)
                     , foldM
                     )

import Control.Monad.Writer ( Writer(..), runWriter, writer, tell)
import Control.Monad.State ( State(..), runState, state)


-- == liftA/liftM and ap == --
-- lift functions allow to convert a function so it uses and returns APplicative/Monadic values

myLiftA :: (Applicative f) => (a -> b) -> ( f a -> f b )
myLiftA f a = pure f <*> a

myLiftA2 :: (Applicative f) => (a -> b -> c) -> ( f a -> f b -> f c )
myLiftA2 f x y  = fmap f x <*> y


-- the one parameter version of liftA and liftM can as easily be replaced by fmap
exampleLiftM1 = (outputliftM == outputfmap) && (outputliftM == Just 24)
  where
  outputliftM = liftM (*3) (Just 8)
  outputfmap = fmap (*3) (Just 8)

exampleLiftM2 = (outputliftM == outputfmap) && (outputliftM == (False, "abc"))
  where
  outputliftM = runWriter $ liftM not $ writer (True, "abc") 
  outputfmap = runWriter $ fmap not $ writer (True, "abc")

-- ap is a function equivalent to (<*>), but only for monads

exampleAp = (outputapM == outputapA) && (outputapM == [11,12,13,12,13,14])
  where 
  outputapM = [(+1),(+2),(+3)] `ap` [10,11]
  outputapA = [(+1),(+2),(+3)] <*> [10,11]

-- == join == --
-- Join is here to flatten a monadic value in a monadic value when the same monad is used

myJoin :: (Monad m) => m (m a) -> m a
-- we apply x to the id function
myJoin x = x >>= id

exampleJoin1 = ( join (Just (Just 9)) ) == Just 9
exampleJoin2 = ( join (Just (Nothing)) :: Maybe Int ) == Nothing
exampleJoin3 = join [[1,2,3],[4,5,6]] == [1,2,3,4,5,6]
exampleJoin4 = ( runWriter $ join (writer (writer (1, "aaa"), "bbb")) ) == (1, "bbbaaa")

exampleJoin5 = (outputjoin == outputapply) && (outputjoin == Just 10)
  where
  outputjoin = join (fmap (\x -> Just (x+1)) (Just 9))
  outputapply = Just 9 >>= \x -> Just (x+1)


-- == filterM == --
reminderFilter :: (a -> Bool) -> [a] -> [a]
reminderFilter _pred [] = []
reminderFilter pred (x:xs)
  | pred x              = x : reminderFilter pred xs
  | otherwise           = reminderFilter pred xs

exampleFilter = filter (\x -> x < 4) [9,1,5,2,10,3] == [1,2,3]

-- allows us to filter using a predicate with context
-- the result has a general context
myFilterM :: (Applicative m) => (a -> m Bool) -> [a] -> m [a]
-- liftA2 takes a binary function and lifts it in its applicative context
-- the lambda takes one argument and return a function, or to append x to something or to return the something (filter)
-- this lambda is lifted to take a contextual argument
-- its flag is the application of p on x (a contextual result), x is the element, the reason why the inner lambda returns a function is to apply it to the accumulator not binded
-- the initial version of the foldr is a contextual empty list
-- the filtered list is not binded
myFilterM p = foldr (\x -> liftA2 (\flg -> if flg then (x:) else id) (p x)) (pure [])

exampleFilterM1 = ( snd $ runWriter $ filterM keepSmall [9,1,5,2,10,3] ) == ["9 is too large, throwing it away","Keeping 1","5 is too large, throwing it away","Keeping 2","10 is too large, throwing it away","Keeping 3"]
  where
  keepSmall :: Int -> Writer [String]Bool
  keepSmall x
    | x < 4 = do
      tell ["Keeping " ++ show x]
      return True
    | otherwise = do
      tell [show x ++ " is too large, throwing it away"]
      return False
  printResults = mapM_ putStrLn $ snd $ runWriter $ filterM keepSmall [9,1,5,2,10,3]


exampleFilterM2 = powerset [1,2,3] == [[1,2,3],[1,2],[1,3],[1],[2,3],[2],[3],[]]
  where
  -- a powerset is the set of all subset of a set
  powerset :: [a] -> [[a]]
  -- each element is both True and False
  powerset xs = filterM (\x -> [True, False]) xs


-- == foldM == --
reminderFoldl :: (a -> b -> a) -> a -> [b] -> a
reminderFoldl _f acc [] = acc
reminderFoldl f acc (x:xs) = reminderFoldl f (f acc x) xs

-- allows us to use accumulator function with context
-- the accumulate result also has a context
myFoldM :: (Foldable t, Monad m) => (a -> b -> m a) -> a -> t b -> m a
-- return is the starting state
-- after the foldr, the resulting function is applied to z0
myFoldM f z0 xs = foldr f' return xs z0
  where
    -- used in a foldr
    -- f' :: x@b -> k@(a -> m c) -> z@a -> m c
    -- f z x :: m a
    -- k is the accumulator
    f' x k z = f z x >>= k

exampleFoldM1 = (foldM binSmalls 0 [2,8,3,1] == Just 14)
             && (foldM binSmalls 0 [2,11,3,1] == Nothing)
  where
  binSmalls :: Int -> Int -> Maybe Int
  binSmalls acc x
    | x > 9     = Nothing
    | otherwise = Just (acc + x)



-- == monadic compositions == --

leftComposition :: Monad m => (b -> m c) -> (a -> m b) -> a -> m c
leftComposition = (<=<)
rightComposition :: Monad m =>  (a -> m b) -> (b -> m c) -> a -> m c
rightComposition = (>=>)

exampleComposition1 = ((+1) . (*2)) 3 == 7
exampleComposition2 = ((\y -> return (y+1)) <=< (\x -> return (x*2))) 3 == Just 7
exampleComposition3 = ((\x -> return (x*2)) >=> (\y -> return (y+1))) 3 == Just 7

exampleComposition4 = function 1 == 201
  where
  function = foldr (.) id [(+1), (*100), (+1)]

