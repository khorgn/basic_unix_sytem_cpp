module MergedDataType where

-- data Foo = F { value :: Int } deriving (Show)
-- data Bar = B { value :: Double, canDoA :: Bool } Bool deriving (Show)

data FooBar = FooBar { value :: Double, canDoA :: Bool } deriving Show

foo :: Int -> FooBar
foo x = FooBar { value = fromIntegral x, canDoA = False }

bar :: Double ->  Bool -> FooBar
bar x b = FooBar { value = x, canDoA = b }

{-
 - Make your different types monomorphic, the type safety was not used anyway here
 - Try to find which essential characteristics are in the merged type
 - Works great when everything important can be captured in a merged type
 -
 - If necessary, Foo and Bar can still exist, with functions converting to the merged type and back (with a maybe if there is not information lost)
 -}

