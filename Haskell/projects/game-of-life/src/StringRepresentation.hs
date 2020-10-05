module StringRepresentation (
                              representBoard
                            ) where

import Model
import qualified Data.List as L

-- | Represents the board as a String, with \'A' and \'D' 'Alive' and 'Dead'
representBoard :: Board -> String
representBoard b = unlines $ fmap unwords boardLines
    where
        sortedBoard :: [Cell]
        sortedBoard = L.sort b
        boardLines :: [[String]]
        boardLines = fmap (\ l -> fmap toStrCellState l) $ L.groupBy sameYCoord sortedBoard

sameYCoord :: Cell -> Cell -> Bool
sameYCoord (Cell (Coordinate y1 _) _) (Cell (Coordinate y2 _) _) = y1 == y2

toStrCellState :: Cell -> String
toStrCellState (Cell _ s) = case s of
    Alive -> "A"
    Dead -> "D"
