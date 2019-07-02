import Data.Monoid ( Sum(Sum, getSum)
                   , Product(..) -- the function getProduct is also imported
                   , Any(..)
                   , All(..)
                   )

-- Monoids: a set with an operator combining two elements of the set into another element, and a neutral element that when combined with another element always returns the other element
-- example: Natural numbers with the function addition and the neutral element 0
-- haskell examples of monoids: List, Sum, Product

class Semigroup m => MyMonoid m where
  -- the identy value
  myMempty :: m
  -- the binary function combining two elements of the set
  myMappend :: m -> m -> m
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
  MyProduct x `mappend` MyProduct y = MyProduct (x * y)


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
  MyAny x `mappend` MyAny y = MyAny (x || y)

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
  mappend = (<>) -- default impl

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

