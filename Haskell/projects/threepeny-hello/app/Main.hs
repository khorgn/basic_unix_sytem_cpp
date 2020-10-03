module Main where

import Control.Monad
import Control.Concurrent (threadDelay)

import qualified Graphics.UI.Threepenny as UI
import Graphics.UI.Threepenny.Core


main :: IO ()
main = startGUI (defaultConfig { jsPort = Just 8023 }) setup

setup :: Window -> UI()
setup window = do
  return window # set UI.title "Hello World!"

  button <- UI.button # set UI.text "Click"
  getBody window #+ [element button]

  on UI.click button $ \_ -> do
    element button # set UI.text "Clicked"
