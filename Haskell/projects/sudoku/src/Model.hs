module Model
  ( exampleGrid
  , exampleGridResult
  , size
  , Grid
  ) where

import qualified Data.Array as A

type Grid = A.Array (Int, Int) (Maybe Int)

size :: Integer
size = 4

gridRange :: ((Integer, Integer), (Integer, Integer))
gridRange = ((1, 1), (size, size))

indexList :: [(Integer, Integer)]
indexList = [(i, j) | i <- [1..size], j <- [1..size]]

makeArray :: [e] -> A.Array (Integer, Integer) e
makeArray = A.listArray gridRange

exampleGrid :: A.Array (Integer, Integer) (Maybe Integer)
exampleGrid = A.array gridRange [
    ((1, 1), Just 2)
  , ((1, 2), Nothing)
  , ((1, 3), Just 1)
  , ((1, 4), Just 3)
  , ((2, 1), Nothing)
  , ((2, 2), Nothing)
  , ((2, 3), Just 4)
  , ((2, 4), Nothing)
  , ((3, 1), Nothing)
  , ((3, 2), Nothing)
  , ((3, 3), Just 3)
  , ((3, 4), Nothing)
  , ((4, 1), Nothing)
  , ((4, 2), Nothing)
  , ((4, 3), Just 2)
  , ((4, 4), Nothing)
  ]

exampleGridResult :: A.Array (Integer, Integer) (Maybe Integer)
exampleGridResult = A.array gridRange [
    ((1, 1), Just 2)
  , ((1, 2), Just 4)
  , ((1, 3), Just 1)
  , ((1, 4), Just 3)
  , ((2, 1), Just 3)
  , ((2, 2), Just 1)
  , ((2, 3), Just 4)
  , ((2, 4), Just 2)
  , ((3, 1), Just 1)
  , ((3, 2), Just 2)
  , ((3, 3), Just 3)
  , ((3, 4), Just 4)
  , ((4, 1), Just 4)
  , ((4, 2), Just 3)
  , ((4, 3), Just 2)
  , ((4, 4), Just 1)
  ]

