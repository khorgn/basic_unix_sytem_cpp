import Data.Monoid ( Sum(Sum, getSum)
                   , Product(..) -- the function getProduct is also imported
                   , Any(..)
                   , All(..)
                   )

-- Monoids: a set with an operator combining two elements of the set into another element, and a neutral element that when combined with another element always returns the other element
-- example: Natural numbers with the function addition and the neutral element 0
-- haskell examples of monoids: List, Sum, Product

class MyMonoid m where
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

instance Monoid MyAny where
  mempty = MyAny False
  MyAny x `mappend` MyAny y = MyAny (x || y)

exampleAny1 = ( getAny $ Any True `mappend` Any False ) == True
exampleAny2 = ( getAny $ mempty `mappend` Any True ) == True
exampleAny3 = ( getAny . mconcat . map Any $ [False, False, True, False] ) == True

