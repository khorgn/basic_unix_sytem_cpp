import Data.Monoid ( Sum(Sum, getSum)
                   , Product(..) -- the function getProduct is also imported
                   , Any(..)
                   , All(..)
                   , First(..)
                   , Last(..)
                   )
import Data.Semigroup ( Semigroup(..)
                      )

-- Monoids: a set with an operator combining two elements of the set into another element, and a neutral element that when combined with another element always returns the other element
-- example: Natural numbers with the function addition and the neutral element 0
-- haskell examples of monoids: List, Sum, Product

class Semigroup m => MyMonoid m where
  -- the identy value
  myMempty :: m
  -- the binary function combining two elements of the set
  myMappend :: m -> m -> m
  myMappend = (<>)
  myMconcat :: [m] -> m
  myMconcat = foldr myMappend myMempty


-- == monoid laws == --
monoidFirstLaw :: (Monoid a, Eq a) => a -> Bool
monoidFirstLaw x = mempty `mappend` x == x
monoidSecondLaw :: (Monoid a, Eq a) => a -> Bool
monoidSecondLaw x = x `mappend` mempty == x
monoidThirdLaw :: (Monoid a, Eq a) => a -> a -> a -> Bool
monoidThirdLaw x y z = (x `mappend` y) `mappend` z == x `mappend` (y `mappend` z)

-- == Semigroups == --
-- a semigroup is a set with a binary function, it doesn't need to have an identity element

-- == Lists as monoids == --

instance MyMonoid [a] where
  myMempty = []
  myMappend = (++)

exampleList1 = [1, 2, 3] `mappend` [4, 5, 6] == [1, 2, 3, 4, 5, 6]
exampleList2 = ("one" `mappend` "two") `mappend` "three" == "ontwothree"
exampleList3 = "one" `mappend` ("two" `mappend` "three") == "ontwothree"
exampleList4 = "aaa" `mappend` mempty == "aaa"


-- == Product and Sum == --
-- there is two possi

newtype MyProduct a = MyProduct { getMyProduct :: a } deriving (Eq, Ord, Read, Show, Bounded)
newtype MySum a = MySum { getMySum :: a } deriving (Eq, Ord, Read, Show, Bounded)

instance Num a => Semigroup (MyProduct a) where
  MyProduct x <> MyProduct y = MyProduct (x * y)

instance Num a => Monoid (MyProduct a) where
  mempty = MyProduct 1


exampleSum1 = ( getSum $ Sum 2 `mappend` Sum 9 ) == 11
exampleSum2 = ( getSum $ mempty `mappend` Sum 9 ) == 9
exampleSum3 = ( getSum . mconcat . map Sum $ [1, 2, 3] ) == 6


-- == Any and All == --
-- newtypes for Bool, can be monoids with OR or AND
-- for Any, False is the identity value, and (||) is the combinary function
-- for All, True is the identity value, and (&&) is the combinary function

newtype MyAny = MyAny { getMyAny :: Bool }
  deriving (Eq, Ord, Read, Show, Bounded)

instance Semigroup MyAny where
  MyAny x <> MyAny y = MyAny (x || y)

instance Monoid MyAny where
  mempty = MyAny False

exampleAny1 = ( getAny $ Any True `mappend` Any False ) == True
exampleAny2 = ( getAny $ mempty `mappend` Any True ) == True
exampleAny3 = ( getAny . mconcat . map Any $ [False, False, True, False] ) == True


-- == Ordering == --
-- ordering is used when comparing values, and has three variants: LT, EQ, GT

exampleUsingOrdering = 1 `compare` 2 == LT

data MyOrdering = MyLT | MyEQ | MyGT

instance Semigroup MyOrdering where
  MyLT <> _ = MyLT
  MyEQ <> x = x
  MyGT <> _ = MyGT

instance Monoid MyOrdering where
  mempty = MyEQ

-- monoid allows an sequence of ordering
exampleOrderingNoMonoid1 x y = lengthCompare x y
  where lengthCompare x y = let a = length x `compare` length y
                                b = x `compare` y
                            in if a == EQ then b else a
exampleOrderingMonoid2 x y = lengthCompare x y
  where lengthCompare x y = (length x `compare` length y) `mappend` (x `compare` y)

exampleOrdering3 x y = (length x `compare` length y) `mappend`
                       (vowels x `compare` vowels y) `mappend`
                       (x `compare` y)
  where vowels = length . filter (`elem` "aeiou")


-- == Maybe == --

data MyMaybe a = MyNothing | MyJust a deriving (Eq, Ord, Read, Show)

instance Semigroup a => Semigroup (MyMaybe a) where
  MyNothing <> m = m
  m <> MyNothing = m
  MyJust m1 <> MyJust m2 = MyJust (m1 <> m2)

instance Monoid a => Monoid (MyMaybe a) where
  mempty = MyNothing

exampleMaybe1 = mempty <> Just "andy" == Just "andy"
exampleMaybe2 = Just LT <> mempty == Just LT
exampleMaybe3 = Just (Sum 3) <> Just (Sum 4) == Just (Sum 7)

-- one problem with this instance is that the content of Maybe must also be a monoid
-- to allow the use of monoid even with non-monoid content a newtype exists
newtype MyFirst a = MyFirst { getMyFirst :: MyMaybe a }
  deriving (Eq, Ord, Read, Show)

instance Semigroup (MyFirst a) where
  MyFirst (MyJust x) <> _ = MyFirst (MyJust x)
  MyFirst MyNothing <> x = x

instance Monoid (MyFirst a) where
  mempty = MyFirst MyNothing

exampleFirst1 = ( getFirst $ First (Just 'a') <> First (Just 'b') ) == Just 'a'
exampleFirst2 = ( getFirst $ First Nothing <> First (Just 'b') ) == Just 'b'
exampleFirst3 = ( getFirst $ First (Just 'a') <> First Nothing ) == Just 'a'
-- First allows with lists of maybes if at least one of them is Just
exampleFirst4 = ( getFirst . mconcat . map First $ [Nothing, Just 9, Just 10] ) == Just 9
-- Last also exists for the opposite of First
exampleLast1 = ( getLast $ Last (Just 'a') <> Last (Just 'b') ) == Just 'b'
exampleLast2 = ( getLast . mconcat . map Last $ [Nothing, Just 9, Just 10] ) == Just 10


-- == Use of Monoids with Foldable == --
-- we can also use monoids to make it easier to define folds threw the Foldable typeclass
-- foldable has one of two functions that must be implented to be instancied: foldr or foldMap
-- foldmap is easier to implement with monoids
-- foldMap :: (Monoid m, Foldable t) => (a -> m) -> t a -> m
data Tree a = Empty | Node a (Tree a) (Tree a)
  deriving (Show, Read, Eq)

-- infix fold
instance Foldable Tree where
  foldMap f Empty = mempty
  foldMap f (Node x l r) = foldMap f l
                           `mappend` f x
                           `mappend` foldMap f r

testTree = Node 5
             (Node 3
               (Node 1 Empty Empty)
               (Node 6 Empty Empty)
             )
             (Node 9
               (Node 8 Empty Empty)
               (Node 10 Empty Empty)
             )


exampleTree1 = foldl1 (+) testTree == 42
exampleTree2 = foldl1 (*) testTree == 64800
exampleTree3 = foldl (flip (:)) [] testTree == [10, 9, 8, 5, 6, 3, 1]
exampleTree4 = foldr (:) [] testTree == [1, 3, 6, 5, 8, 9, 10]
-- example use of foldMap: we check if at least one of the elements of the tree equal to 3
exampleTree5 = ( getAny $ foldMap (\x -> Any $ x == 3) testTree ) == True
exampleTree6 = ( getAny $ foldMap (\x -> Any $ x > 15) testTree ) == False
exampleTree7 = ( foldMap (\x -> [x]) testTree ) == [1, 3, 6, 5, 8, 9, 10]

