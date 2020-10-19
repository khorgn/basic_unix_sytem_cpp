module Main where

import ListModel
import StringRepresentation
import Control.Monad ( when )
import qualified System.Environment as E
import Text.Read (readMaybe)
import Data.Maybe (fromJust, isJust)

board = makeDefaultBoard [(1, 1), (1, 2), (2, 2), (4, 3)]

main :: IO ()
main = do
    args <- E.getArgs
    putStrLn $ unlines args
    let b0 = if null args
             then board
             else let res = extractArgs args in if isJust res then makeDefaultBoard $ fromJust res else board
    putStrLn $ representBoard b0
    step b0

step :: Board -> IO()
step b = do
    let b' = updateBoardState b
    putStrLn $ representBoard b'
    i <- getLine
    when (i /= "q") $ step b'

extractArgs :: [String] -> Maybe([(Int, Int)])
extractArgs args = sequenceA $ fmap readMaybe args