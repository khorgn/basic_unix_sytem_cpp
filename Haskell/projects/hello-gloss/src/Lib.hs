module Lib
    where

import Graphics.Gloss

someFunc :: IO ()
someFunc = putStrLn "someFunc"

disp :: Picture -> IO ()
disp = display (InWindow "Thick line" (300, 300) (10, 10)) white

thickLine :: Path -> Float -> Picture
thickLine = undefined

p1 :: Point
p1 = (0, 0)
p2 :: Point
p2 = (100, 80)

pic1 = translate (-50) 0 $ line [p1, p2]
pic2 = translate 50 0 $ rec p1 p2 10

d = disp $ pictures [pic1, pic2]

rec :: Point -> Point -> Float -> Picture
rec p1 p2 t = let r = rectangleSolid width height in rotate angle r
  where height = distance p1 p2
        width = t
        angle = angleDegree p1 p2

radianToDegree a = a * 180 / pi

distance :: Point -> Point -> Float
distance (x1, y1) (x2, y2) = sqrt $ dX * dX + dY * dY
  where dX = x1 - x2
        dY = y1 - y2

angleDegree :: Point -> Point -> Float
angleDegree (x1, y1) (x2, y2) = radianToDegree $ atan2 dY dX
  where dX = x1 - x2
        dY = y1 - y2


