module MapModel where

import BaseModel
import qualified Data.Map as M

type Board = M.Map Coordinate CellState