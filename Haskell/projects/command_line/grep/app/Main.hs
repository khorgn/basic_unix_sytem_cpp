{-# LANGUAGE BlockArguments #-}
module Main where

import Lib
import Control.Monad ( when
                     )
import System.Environment ( getArgs
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
  let args' = checkArgs args
  
  return ()

