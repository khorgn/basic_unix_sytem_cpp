module GameOfLife where

{- Rules
 - 1. Live with living neighbors: 2-3 => Live
 - 2. Dead with living neighbors: 3   => Live
 - 3. otherwise => Dead
 -}

import Data.Array (Array, array, listArray)
import qualified Data.Array
import Data.Map (Map)
import qualified Data.Map

data Cell = Alive | Dead deriving (Show, Eq)

type Board = Array Coord Cell

initBoard sizeY sizeX = listArray ((0,0), (sizeY, sizeX)) (repeat Dead)

makeBoard sizeY sizeX coords = (initBoard sizeY sizeX) Data.Array.// (map (\c -> (c, Alive)) coords)

-- exBoard1 = array (0,0) [((10, 10), Dead)]


type Coord = (Int, Int)
type Board' = Map Coord Cell

makeBoard' :: [Coord] -> Map Coord Cell
makeBoard' = Data.Map.fromList . map (\c -> (c, Alive))
