-- newtypes can be used to redo the instance of a typeclass for a type

-- == new<type ZipList == --

import Control.Applicative (ZipList(ZipList), getZipList)


applicativeFunctorList = ( [(+1), (*100), (*5)] <*> [1, 2, 3] )
  == ( [2, 3, 4, 100, 200, 300, 5, 10, 15] )
applicativeFunctorZipList = ( getZipList $ ZipList [(+1), (*100), (*5)] <*> ZipList [1, 2, 3] )
  == ( [2, 200, 15] )


newtype ZipListImpl a = ZipListImpl { getZipListImpl :: [a] }



-- newtypes can be derived or manually instancied
newtype CharList = CharList { getCharList :: [Char] }deriving (Eq, Show)


-- == Using newtype to make typeclass instances == --

-- we can reimplement Functor for pairs
-- but it depends on the first type in the pair
newtype Pair a b = Pair { getPair :: (a, b) }
instance Functor (Pair a) where
  -- fmap :: (a -> b) -> InvPair a c -> InvPair b c
  fmap f (Pair (x, y)) = Pair (x, f y)

newtype InvPair b a = InvPair { getInvPair :: (a, b) }
instance Functor (InvPair b) where
  -- fmap :: (a -> b) -> InvPair c a -> InvPair c b
  fmap f (InvPair (x, y)) = InvPair (f x, y)

-- = examples = --
--
examplePair1 = ( getPair $ fmap (*100) (Pair (2, 3)) )
  == (2, 300)
examplePair2 = ( getPair $ fmap reverse (Pair ("london calling", "abcd")) )
  == ("london calling", "dcba")

exampleInvPair1 = ( getInvPair $ fmap (*100) (InvPair (2, 3)) )
  == (200, 3)
exampleInvPair2 = ( getInvPair $ fmap reverse (InvPair ("london calling", 3)) )
  == ("gnillac nodnol", 3)

-- == newtypes are more lazy than datas in regard to undefined == --
exampleListWithUndefined = [3, 4, 5, undefined, 2, undefined]
canStillUseFunctions = head exampleListWithUndefined == 3

-- a data is a new type at runtime
data DataBool = DataBool { getDataBool :: Bool }

-- function doesn't use the inner data
helloDataBool :: DataBool -> String
helloDataBool (DataBool _) = "hello"

-- still throws an exception
throwsException = helloDataBool undefined

--a newtype is the same as its previous type at runtime
newtype NewtypeBool = NewtypeBool { getNewtypeBool :: Bool }
--
-- function doesn't use the inner data
helloNewtypeBool :: NewtypeBool -> String
helloNewtypeBool (NewtypeBool _) = "hello"

-- Doesn't throw an exception
throwsNoException = helloNewtypeBool undefined

