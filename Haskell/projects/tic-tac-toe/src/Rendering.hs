module Rendering (gameAsPicture) where

import Graphics.Gloss

import Game

playerXColor = makeColor  255 50 50 255 -- Red
playerOColor = makeColor  50 100 255 255 -- Blue
tieColor = greyN 0.5 -- Grey

gameAsPicture :: Game -> Picture
gameAsPicture game = 
  case gameState game of
    Running -> boardAsRunningPicture (gameBoard game)
    GameOver winner -> boardAsGameOverPicture winner (gameBoard game)


boardAsRunningPicture board = Blank

boardAsGameOverPicture winner board = -- color colorise a picture according to a given color
                                      color (outcomeColor winner) (boardAsPicture board)

outcomeColor (Just PlayerX) = playerXColor
outcomeColor (Just PlayerO) = playerOColor
outcomeColor Nothing = tieColor

-- made of three layers
boardAsPicture board =
  pictures [ xCellsOfBoard board
           , oCellsOfBoard board
           , boardGrid
           ]

xCellsOfBoard :: Board -> Picture
xCellsOfBoard _ = Blank
oCellsOfBoard :: Board -> Picture
oCellsOfBoard _ = Blank

boardGrid = Blank
-- 7.44
