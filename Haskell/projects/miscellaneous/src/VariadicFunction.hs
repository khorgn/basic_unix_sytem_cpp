{-# LANGUAGE MultiParamTypeClasses, FunctionalDependencies, FlexibleInstances #-}

module VariadicFunctions where

class SumRes r where
  sumOf :: Integer -> r

instance SumRes Integer where
  sumOf = id

instance (Integral a, SumRes r) => SumRes (a -> r) where
  sumOf x = sumOf . (x +) . toInteger




-- Functional dependency, the type of a can be determined by r
-- It means that there cannot be two instances with the same r and a different a
class BuildList a r | r -> a where
  build' :: [a] -> a -> r

-- Case when there is only one more argument to handle
instance BuildList a [a] where
  build' l x = reverse $ x:l

-- Case when build' produces a function handling the next argument
instance BuildList a r => BuildList a (a -> r) where
  build' l x1 x2 = build' (x1:l) x2

-- Calls the builder function and gives the initial accumulator
build :: (BuildList a r) => a -> r
build x = build' [] x

-- To use:
-- >>> build 2 3 5 1 :: [Int]
-- the type annotation is necessary for the interpreter to know the final type is not a function
