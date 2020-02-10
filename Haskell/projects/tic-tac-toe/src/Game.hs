module Game where

import Data.Array

type Board = Array (Int, Int) Cell
data Cell = Empty | Full Player deriving (Eq, Show)
data Player = PlayerX | PlayerO deriving (Eq, Show)
data State = Running | GameOver (Maybe Player) deriving (Eq, Show)

data Game = Game { gameBoard :: Board
                 , gamePlayer :: Player
                 , gameState :: State
                 } deriving (Eq, Show)


n :: Int
n = 3

initialGame = Game { gameBoard = -- array takes the range of the array
                                 -- and a list of (index, value)
                                 array indexRange $ zip listRange (cycle [Empty])
                   , gamePlayer = PlayerX
                   , gameState = Running
                   }
  where indexRange = ((0, 0), (n-1,n-1)) -- :: tuple of instances of Ix, used to index array
        listRange = range indexRange -- [(0,0),(0,1),(0,2),(1,0),(1,1),(1,2),(2,0),(2,1),(2,2)]
