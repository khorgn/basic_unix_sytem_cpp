import qualified Control.Applicative as A

-- == Maybe example == --

-- example of Applicative over function
aJustFunc = fmap (*) (Just 3)


{-
instance Applicative Maybe where
  pure = Just
  Nothing <*> _ = Nothing
  (Just f) <*> something = fmap f something

(<*>) :: Maybe (a -> b) -> Maybe a -> Maybe b
-}

maybeExampleApply1 = Just (+3) <*> Just 9
maybeExampleApply2 = pure (+3) <*> Just 10
maybeExampleApply3 = Nothing <*> Just 3
maybeExampleApply4 = pure (+) <*> Just 3 <*> Just 4
maybeExampleApply5 = pure (+) <*> Just 3 <*> Nothing
maybeExampleApply6 = pure (+) <*> Nothing <*> Just 4

maybeEquivalencesFmap f x = (pure f <*> x) == (f <$> x)

maybeExampleApply7 = (++) <$> Just "AAA" <*> Just "BBB"

-- == List example == --

{-
instance Applicative [] where
  pure x = [x]
  fs <*> xs = [f x | f <- fs, x <- xs]

(<*>) :: [a -> b] -> [a] -> [b]
-}

listExampleApply1 = ( [(*0), (+100), (^2)] <*> [1, 2, 3] ) == ( [0, 0, 0, 101, 102, 103, 1, 4, 9] )
listExampleApply2 = ( [(+), (*)] <*> [1, 2] <*> [3, 4] ) == [4, 5, 5, 6, 3, 4, 6, 8]

listEquivalencesListComprehension1 = [ x*y | x <- [2, 5, 10], y <- [8, 10, 11]] == ( (*) <$> [2, 5, 10] <*> [8, 10, 11] )

listEquivalencesListComprehension2 = [ x*y | x <- [2, 5, 10], y <- [8, 10, 11], x*y > 50] == ( filter (>50) $ (*) <$> [2, 5, 10] <*> [8, 10, 11] )


-- == IO example == --

{-
instance Applicative IO where
  pure = return
  ioF <*> ioX = do
    f <- ioF
    x <- ioX
    return (f x)
(<*>) :: IO (a -> b) -> IO a -> IO b
-}

ioWithoutApplicative = do
  a <- getLine
  b <- getLine
  return $ a ++ b

ioWithApplicative = (++) <$> getLine <*> getLine

ioWithApplicative2 = do
  a <- (++) <$> getLine <*> getLine
  putStrLn $ "the concat is : " ++ a


-- == (->) r example == --

{-
instance Applicative ((->) r) where
  pure x = (\_ -> x)
  f <*> g = \x -> f x (g x)

pure :: a -> (r -> a)
(<*>) :: (r -> (f -> g)) -> (r -> f) -> (r -> g)
-}

funcExamplePure = ( (pure 3) "AA" ) == 3
funcExampleApply1 = ( ( (+) <$> (+3) <*> (*100) :: (Num a) => a -> a ) $ 5 ) == ((5+3)+(5*100)) -- 508
funcExampleApply2 = ( (\x y z -> [x, y, z]) <$> (+3) <*> (*2) <*> (/2) $ 5 ) == [5+3, 5*2, 5/2]-- [8.0, 10.0, 2.5]


-- == ZipList example == --
-- zipList is another way for lists to be applicative

{-
instance Applicative ZipList where
  pure x = ZipList (repeat x)
  ZipList fs <*> ZipList xs = ZipList (ZipList (\f x -> f x) fs xs)
-}

zipListExample1 = ( A.getZipList $ (+) <$> A.ZipList [1, 2, 3] <*> A.ZipList [100, 100, 100] ) == [101, 102, 103]
zipListExample2 = ( A.getZipList $ (+) <$> A.ZipList [1, 2, 3] <*> pure 100 ) == [101, 102, 103]
zipListExample3 = ( A.getZipList $ (+) <$> A.ZipList [1..6] <*> A.ZipList [5, 3, 1] ) == [6, 5, 4]
zipListExample4 = ( A.getZipList $ (,,) <$> A.ZipList "dog" <*> A.ZipList "cat" <*> A.ZipList "rat" ) == [('d','c','r'), ('o', 'a', 'a'), ('g', 't', 't')]

-- there is also ZipWith3, ZipWith4, .., ZipWith7 for functions that take 3, 4, .., 7 arguments


-- == liftA2 == --

myLiftA2 :: (Applicative f) => (a -> b -> c) -> f a -> f b -> f c
myLiftA2 f a b = f <$> a <*> b


-- == sequenceA == --

sequenceAExampleOfNeed = ( (:) <$> Just 2 <*> ((:) <$> Just 3 <*> Just [4]) ) == ( Just [2, 3, 4] )
-- the real sequenceA uses Traversable (Foldable + Functor) instead of List
mySequenceA :: (Applicative f) => [f a] -> f [a]
mySequenceA [] = pure []
mySequenceA (x:xs) = (:) <$> x <*> sequenceA xs
mySequenceA' :: (Applicative f) => [f a] -> f [a] -- another way to implement it
mySequenceA' xs = foldr (A.liftA2 (:)) (pure []) xs

withSequenceA = sequenceA [Just 2, Just 3, Just 4] == Just [2, 3, 4]

sequenceAExample1 = sequenceA [Just 3, Nothing, Just 1] == Nothing
sequenceAExample2 = ( sequenceA [(+3), (+2), (+1)] 3 ) == [6, 5, 4]
sequenceAExample3 = sequenceA [[1,2,3], [4,5,6]] == [[1,4], [1,5], [1,6], [2,4], [2,5], [2,6], [3,4], [3,5], [3,6]]
sequenceAExample4 = sequenceA [[1,2,3], [4,5,6], []] == []

sequenceAExample5 = map (\f -> f 7) [(>4), (<10), odd] == sequenceA [(>4), (<10), odd] 7
sequenceAExample6 = ( and $ map (\f -> f 7) [(>4), (<10), odd] ) == ( and $ sequenceA [(>4), (<10), odd] 7 )

-- == Applicative functor laws == --
-- relation between apply and fmap
applicativeLaw1 :: (Applicative f, Eq (f b)) => (a -> b) -> f a -> Bool
applicativeLaw1 f x = ( pure f <*> x ) == ( fmap f x )

-- there are other laws, but it is the main one
-- Identity
applicativeLaw2 :: (Applicative f, Eq (f a)) => f a -> Bool
applicativeLaw2 x = ( pure id <*> x ) == x

-- Composition
applicativeLaw3 :: (Applicative f, Eq (f c)) => f (b -> c) -> f (a -> b) -> f a -> Bool
applicativeLaw3 u v w = ( pure (.) <*> u <*> v <*> w ) == ( u <*> (v <*> w) )

-- Homomorphism
-- example for Maybe Int
applicativeLaw4 :: Eq a => (Int -> a) -> Int -> Bool
applicativeLaw4 f x = ( pure f <*> (pure x :: Maybe Int) ) == ( pure (f x) )

-- Interchange
applicativeLaw5 :: (Applicative f, Eq (f b)) => f (a -> b) -> a -> Bool
applicativeLaw5 u y = ( u <*> pure y ) == ( pure ($ y) <*> u )
