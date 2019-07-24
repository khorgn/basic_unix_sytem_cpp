module Main where

import Lib

import System.IO ( putStrLn
                 , print
                 )
import System.Environment ( getArgs
                          )

{-
Format: echo [-n][-e]<text>
-n remove the trailing newline
-e enable the interpretation of backlash escapes
  \\ backlash
  \a allert (BELL)
  \b backspace
  \c produce no further output
  \e escape
  \f form feed
  \n newline
  \r cariage return
  \t horizontal tab
  \v vertical tab
  \0NNN byte with octal value NNN (1 to 3 digits)
  \xHH byte with hexadecimal value HH (1 to 2 digits)
or -E to disable the interpretation of backlash escapes

-}

-- to display a string with the escapes, use show on the string

main :: IO ()
main = do
  args <- getArgs
  putStr $ parseArgs args

-- NOTES: don't know why, but the escape sequences are not handled if :main is not given quoted strings in ghci
-- same behavior as echo, but strange behavior nonetheless
