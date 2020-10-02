module Model () where

import qualified Data.List (elem)

-- Rules:
-- if Alive:
--           If Neighbours < 2 : Dead
--           If Neighbours in [2, 3] : Alive
--           If Neighbours > 3 : Dead
-- If Dead:
--           If Neighbours == 3 : Alive


data CellState = Alive | Dead deriving (Show, Eq)

data Coordinates = Coordinates { getXCoord :: Int, getYCoord :: Int } deriving (Show, Eq)

coordinates :: Int -> Int -> Coordinates
coordinates x y = Coordinates x y

data Cell = Cell { getCoordinates :: Coordinates, getCellState :: CellState } deriving (Show, Eq)


type Board = [Cell]

type Neighbours = [Cell]

changeCell :: Int -> Cell -> Cell
changeCell 3 (Cell c Dead) = Cell c Alive
changeCell n (Cell c Dead) = Cell c Dead
changeCell n (Cell c Alive)
  | n `elem` [2, 3] = Cell c Alive
  | otherwise = Cell c Dead

updateCell :: Neighbours -> Cell -> Cell
updateCell n c = changeCell aliveNeighbors c
  where
    aliveNeighbors :: Int
    aliveNeighbors = length $ filter (== Alive) $ map getCellState n

updateBoardState :: Board -> Board
updateBoardState board = map _a board
  where
    neighborsCoords :: [Coordinates]
    neighborsCoords = map (\(x, y) -> Coordinates x y) [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]
