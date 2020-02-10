module Main where

import Game
import Rendering
import Logic
import qualified Graphics.Gloss as Gloss
import Graphics.Gloss.Data.Color as Color

window = Gloss.InWindow "Functional" (640, 640) (100, 100)

backgroundColor = makeColor 0 0 0 255


main :: IO ()
main = Gloss.play window backgroundColor 30 initialGame gameAsPicture transformGame (const id)


