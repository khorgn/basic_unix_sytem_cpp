module MapModel where

import BaseModel
import qualified Data.Map as M
import Data.Maybe ( fromJust, isJust )

type Board = M.Map Coordinate CellState

getNeighbors :: Board -> [Coordinate] -> Cell -> Neighbours
getNeighbors b cs (Cell (Coordinate cX cY) _) = fmap (\(k, v) -> Cell k v)$ filterMap fullCoords b
  where
      fullCoords = map (\(Coordinate x y) -> (Coordinate (cX+x) (cY+y))) cs

filterMap :: Ord k => [k] -> M.Map k a -> [(k, a)]
filterMap cs m = fmap (\(k', x) -> (k', fromJust x)) $ filter (\(_, x) -> isJust x) $ fmap (\k' -> (k', M.lookup k' m)) cs


updateBoardState :: Board -> Board
updateBoardState board = M.mapWithKey updateCell board
  where
      updateCell :: Coordinate -> CellState -> CellState
      updateCell = undefined