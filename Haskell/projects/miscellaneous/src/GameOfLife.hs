module GameOfLife where

{- Rules
 - 1. Live with living neighbors: 2-3 => Live
 - 2. Dead with living neighbors: 3   => Live
 - 3. otherwise => Dead
 -}

import Data.Array (Array, array, listArray, inRange)
import qualified Data.Array
import Data.Map (Map)
import qualified Data.Map
import Data.Maybe (mapMaybe) -- mapMaybe only keep the Just
                              -- catMaybes filter-in and unpack the Just

data Cell = Alive | Dead deriving (Show, Eq)

type Board = Array Coord Cell

initBoard :: Int -> Int -> Board
initBoard sizeY sizeX = listArray ((0,0), (sizeY, sizeX)) (repeat Dead)

makeBoard :: Int -> Int -> [Coord] -> Board
makeBoard sizeY sizeX coords = (initBoard sizeY sizeX) Data.Array.// map (\c -> (c, Alive)) coords

exBoard1 = initBoard 5 5
-- exBoard1 = array (0,0) [((10, 10), Dead)]
exBoard2 = makeBoard 5 5 [(0, 0), (1, 0), (0, 1)]


type Coord = (Int, Int)
type Board' = Map Coord Cell

makeBoard' :: [Coord] -> Map Coord Cell
makeBoard' = Data.Map.fromList . map (\c -> (c, Alive))

aliveNeighbors :: Board -> Coord -> Int
aliveNeighbors b c = length . filter (== Alive) $ neighbors b c

neighbors :: Board -> Coord -> [Cell]
neighbors board (y, x) =
  let neighBordsCoords = [(y, x+1), (y+1, x+1), (y+1, x), (y+1, x-1), (y, x-1), (y-1, x-1), (y-1, x), (y-1, x+1)]
  in mapMaybe getC neighBordsCoords
  where getC c = if Data.Array.inRange bounds c then Just(board Data.Array.! c) else Nothing
        bounds@((minY, minX), (maxY, maxX)) = Data.Array.bounds board

updateCell :: Board -> Coord -> Cell
updateCell b c
  | cellState == Dead && livingN == 3 = Alive
  | cellState == Alive && inRange (2, 3) livingN = Alive
  | otherwise = Dead
  where livingN = aliveNeighbors b c
        cellState = b Data.Array.! c

updateCell' :: Board -> Coord -> Board
updateCell' b c
  | cellState == Dead && livingN == 3 = b Data.Array.// [(c, Alive)]
  | cellState == Alive && inRange (2, 3) livingN = b Data.Array.// [(c, Alive)]
  -- | cellState == Alive && elem livingN [2,3] = b Data.Array.// [(c, Alive)]
  | otherwise = b Data.Array.// [(c, Dead)]
  where livingN = aliveNeighbors b c
        cellState = b Data.Array.! c

updateBoard :: Board -> Board
updateBoard b = Data.Array.listArray bounds newState
  where assocs = Data.Array.assocs b
        bounds = Data.Array.bounds b
        newState = fmap (\(i, _) -> updateCell b i) assocs

