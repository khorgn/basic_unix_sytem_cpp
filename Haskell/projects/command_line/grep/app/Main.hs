{-# LANGUAGE BlockArguments #-}
module Main where

import Lib
import Control.Monad ( when
                     )
import System.Environment ( getArgs
                          )

import System.IO (readFile
                 )

main' :: IO ()
main' = do
  args <- getArgs
  when (checkArgs' args) do
    let pattern = head args
    contents <- readFile "src/Lib.hs"
    let res = filterOutNonMatchingLines pattern (lines contents)
    putStrLn $ unlines res

main = do
  args <- getArgs
  let args' = parseArgs args
  let filepaths = [x | ArgFile x <- args']
  -- contents <- sequence $ map readFile 
  let contents = mapM readFile filepaths >>= \x -> return $ concat $ map lines x
  let argsWithoutFiles = filter (\x -> case x of { ArgFile {} -> False; otherwise -> True }) args'
  -- {} is to disregard the arguments of a constructor, equivalent to `Constructor _ ... _` but without needing to know the number of arguments
  
  
  return ()

exArgs = ["-i", "-e", "foo", "--regexp", "fuu", "-f", "bar", "aaa", "bbbb", "ccc"]
