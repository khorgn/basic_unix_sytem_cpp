module Logic
  (
  ) where


import Model
import qualified Data.Array as A

checkRow g i = fmap (g A.!) [(i, j) | j <- [1..size]]

checkColumn g j = fmap (g A.!) [(i, j) | i <- [1..size]]

checkSquare g n = undefined
  where nX = n `mod` size 
        nY = n `div` size
        sideSquare = floor $ sqrt $ fromIntegral size
        rangeY = ((nY-1) * sideSquare, nY - (sideSquare - 1))
        rangeX = ((nX-1) * sideSquare, nX - (sideSquare - 1))
