module SumType where

data Foo = F deriving Show
data Bar = B deriving Show

data Contain = CFoo Foo | CBar Bar deriving Show

stuffExplicit :: [Contain]
stuffExplicit = [CFoo F, CBar B]

{- Avantages:
 - Simple to understand
 - Keep type information
 -
 - Disadvantages:
 - Must be explicit with every possible type in the collection
 -}
