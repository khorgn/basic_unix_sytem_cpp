module Main where

import Text.Read (readMaybe)
import Text.Printf (printf)
import System.Random (randomRIO)
import Lib


main :: IO ()
main = do
  goal <- getGoal
  ioStep goal

getGoal :: IO Integer
getGoal = randomRIO (0, 100)

ioStep :: (Read t, Ord t, Show t) => t -> IO()
ioStep goal = do
  line <- getLine
  case step line goal of
    Left str -> do
      putStrLn str
      ioStep goal
    Right str -> putStrLn str

step :: (Read a, Ord a, Show a) => String -> a -> Either String String
step str o =
  case getRes str o of
    Just (val, EQ) -> Right $ show val ++ " is the right number"
    Just (val, res) -> Left $ concat [show val, " is ", show res, " ", show o]
    Nothing -> Left $ str ++ " is not a number"
  


getRes :: (Read a, Ord a) => String -> a -> Maybe (a, Ordering)
getRes str o = do
  x <- readMaybe str
  let res = compare x o
  return (x, res)
