module Rendering (gameAsPicture) where

import Graphics.Gloss

import Game

boardGridColor = makeColorI 255 255 255 255 -- white
playerXColor = makeColorI 255 50 50 255 -- Red
playerOColor = makeColorI 50 100 255 255 -- Blue
tieColor = greyN 0.5 -- Grey

gameAsPicture :: Game -> Picture
gameAsPicture game = -- Gloss coordinates originate on the center of the screen
                     translate (fromIntegral screenWidth * (-0.5))
                               (fromIntegral screenHeight * (-0.5))
                               frame
  -- the frame of the picture on a corner (0,0)
  where frame =
                case gameState game of
                  Running -> boardAsRunningPicture (gameBoard game)
                  GameOver winner -> boardAsGameOverPicture winner (gameBoard game)


boardAsRunningPicture board = 
  pictures [ color playerXColor $ xCellsOfBoard board
           , color playerOColor $ oCellsOfBoard board
           , boardGrid

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

snapPictureToCell picture (row, column) = translate x y picture -- move the picture to the given coordinates
  where x = fromIntegral column * cellWidth + cellWidth * 0.5
        y = fromIntegral row * cellHeight + cellHeight * 0.5

cellsOfBoard :: Board -> Cell -> Picture -> Picture
cellsOfBoard board cell cellPicture =
  pictures -- combine all the pictures into a single picture
  $ map (snapPictureToCell cellPicture) -- snap the picture of the cell to the corresponding cell coordinate
  $ map fst -- only keep the indices in the tuple (indice, cell)
  $ filter (\(_, e) -> e == cell) -- filter cells we want
  $ assocs board -- convert board array to association list of indices and cells

xCellsOfBoard :: Board -> Picture
xCellsOfBoard board = cellsOfBoard board (Full PlayerX) xCell
oCellsOfBoard :: Board -> Picture
oCellsOfBoard _ = cellsOfBoard board (Full PlayerO) oCell

xCell :: Picture
xCell = -- Gloss doesn't have thick lines so we use rectangles that are rotated
        pictures [ rotate 45.0 $ rectangleSolid side 10.0
                 , rotate (-45.0) $ rectangleSolid side 10.0
                 ]
  where side = min cellWidth cellHeight * 0.75

oCell :: Picture
oCell = thickCircle diameter 10.0
  where diameter = min CellWidth cellHeight * 0.25

boardGrid :: Picture
boardGrid = 
  pictures -- combine all the lines into a single picture
  -- we map each number to a pair of lines, then concat the list of list of lines
  $ concatMap (\i -> -- represents the columns of the grid
                     -- line :: Path -> Picture
                     [ line [ (i * cellWidth, 0.0)
                            , (i * cellWidth, fromIntegral screenHeight)
                            ]
                     -- represents the rows of the grid
                     , line [ (0.0, i*cellHeight)
                            , (fromIntegral screenWidth, i * screenHeight)
                            ]
                     ])
  [0.0 .. fromIntegral n] -- generate a list of n+1 numbers
