{-# OPTIONS_HADDOCK show-extensions #-}
-- other option: hide
{-|
Module      : Model
Description : Contains the model for Conway's game of life
Copyright   : None
Licence     : MIT
Maintainer  : damianyang@outlook.fr
Stability   : experimental
Portability : All

A module containing the data and function to manipulate Conway's game of life
Currently use list reprensation to ease development
Rules:
if Alive:\n
          If Neighbours < 2 : 'Dead'
          If Neighbours in [2, 3] : 'Alive'
          If Neighbours > 3 : 'Dead'
If Dead:
          If Neighbours == 3 : 'Alive'

Example of use:
>>> let a = makeBoard
>>> let b = updateBoardState a
-}
module ListModel (
               -- * Data types
               --
               -- $data-types
               Board
             , Cell(..)
             , Coordinate(..)
             , CellState(..)

               -- * Manipulating functions
               --
               -- | Two functions are available to manipulate the board, to generate it,
               --   and to make it advance to the next step
             , makeBoard
             , makeBoardTuple
             , makeDefaultBoard
             , updateBoardState
             ) where

import BaseModel


-- $data-types
--
-- Four data types are exported:
--     one representing the complete board,
--     one to represent a cell in said board,
--     one to represent the coordinates of said cell,
--     and one to represent the state of the cell



-- | The board containing the cells
type Board = [Cell]

type Neighbours = [Cell]

updateCell :: Neighbours -> Cell -> Cell
updateCell n c = changeCell aliveNeighbors c
  where
    aliveNeighbors :: Int
    aliveNeighbors = length $ filter (== Alive) $ map getCellState n

-- | Recovers neighbors from a board and a set of coordinates relative to a cell
getNeighbors :: Board -> [Coordinate] -> Cell -> Neighbours
getNeighbors b cs (Cell (Coordinate cX cY) _) = filter (\(Cell c _) -> c `elem` fullCoords) b
  where
    fullCoords = map (\(Coordinate x y) -> (Coordinate (cX+x) (cY+y))) cs

-- | Updates the board state following Conway's game of life rules
updateBoardState :: Board -> Board
updateBoardState board = map (\(c, n) -> updateCell n c) $ map (\c -> (c, getNeighbors board neighborsCoords c)) board
  where
    neighborsCoords :: [Coordinate]
    neighborsCoords = map (\(x, y) -> Coordinate x y) [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]

type Range = (Int, Int)



-- | Make a new board from a X range, a Y range, and a set of coordinates for Alive cells
makeBoard :: Range -> Range -> [Coordinate] -> Board
makeBoard (minX, maxX) (minY, maxY) cs = map (\c -> if c `elem` cs then Cell c Alive else Cell c Dead) allCells
  where
    allCells :: [Coordinate]
    allCells = Coordinate <$> [minX..maxX] <*> [minY..maxY]

makeBoardTuple :: Range -> Range -> [(Int, Int)] -> Board
makeBoardTuple rX rY cs = makeBoard rX rY $ fmap (uncurry Coordinate) cs

makeDefaultBoard :: [(Int, Int)] -> Board
makeDefaultBoard cs = makeBoardTuple defRange defRange cs
  where
    defRange = (0, 8)
