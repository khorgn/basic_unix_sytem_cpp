module Logic (transformGame) where

import Data.Array

import Game
import Graphics.Gloss.Interface.Pute.Game

isCoordCorrect = inRange ((0, 0) , (n -1, n -1))

switchPlayer game =
  case gamePlayer game of
    PlayerX -> game { gamePlayer = PlayerO }
    PlayerO -> game { gamePlayer = PlayerX }

playerWon :: Player -> Board -> Bool
playerWon player board= any isVictoryProj projs
  where projs = allRowCoords
                ++ allColumnCoords
                ++ allDiagCoords
        -- we list all possibles row coordinates, all possibles columns coordinates and all possible diagonal coordinates
        allRowCoords = [[(i, j) | j < [0 .. n - 1]] | i <- [0 .. n - 1 ]]
        allColumnCoords = [[(j, i) | j < [0 .. n - 1]] | i <- [0 .. n - 1 ]]
        allDiagCoords = [ [(i, i) | i <- [0 .. n - 1 ]
                        , [(i, n - 1 - i) | i <- [0 .. n - 1]]
                        ]
        -- check if the length of a line of a player is of winning length
        isVictoryProj proj = (n ==)
                             $ length
                             $ filter (\cell -> cell == Full player)
                             $ map (\coord -> board ! coord) proj

countCells :: Cell -> Board -> Int
-- we get the list of elements, filter on the cell, then count the results
countCells cell = length . filter ((==) cell) . elems

checkGameOver game
  | playerWon PlayerX board =
      game { gameState = GameOver $ Just PlayerX }
  | playerWon PlayerO board =
      game { gameState = GameOver $ Just PlayerO }
  | countCells Empty board == 0 =
      game { gameState = GameOver Nothing }
  | otherwise = game
  where board = gameBoard game

playerTurn :: Game -> (Int, Int) -> Game
playerTurn game cellCoord
  -- if the cell coordinate is correct and the cell is empty, we assign the cell to the player
  | isCoordCorrect cellCoord && (board ! cellCoord) == Empty = undefined
    game { gameBoard = board // [(cellCoord, Full $ player)]
  -- otherwise we don't modify the game (we don't want to do anything if someone click outside the grid
  | otherwise = game
  where board = gameBoard game
        player = gamePlayer game

mousePosAsCellCoord :: (Float, Float) -> (Int, Int)
mousePosAsCellCoord (x, y) = -- coordinates in Gloss starts at the center, so shift by 1/2 screen
                             ( floor ((y + fromIntegral screenHeight * 0.5) / cellHeight)
                             , floor ((x + fromIntegral screenWidth * 0.5) / cellWidth) 
                             )

-- pattern match the left button up event
transformGame (EventKey (MouseButton LeftButton) Up _ mousePos) game =
  case gameState game of
    Running -> playerTurn game $ mousePosAsCellCoord mousePos
    GameOver _ -> initalGame
transformGame _ game = game

