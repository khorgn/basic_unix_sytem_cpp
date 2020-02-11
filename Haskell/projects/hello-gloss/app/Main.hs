module Main where

import Lib
import Graphics.Gloss

main :: IO ()
main = display (InWindow "Hello Gloss" (200, 200) (10, 10)) white (Circle 80)
