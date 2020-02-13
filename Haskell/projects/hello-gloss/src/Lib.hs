module Lib
    where

import Graphics.Gloss

someFunc :: IO ()
someFunc = putStrLn "someFunc"

disp :: Picture -> IO ()
disp = display (InWindow "Thick line" (300, 300) (10, 10)) white

thickLine :: Path -> Float -> Picture
thickLine (p1:p2:ps) = pictures [ thickLine1 p1 p2
                                , thickLine (p2:ps)
                                ]
thickLine [] = blank

p1 :: Point
p1 = (0, 0)
p2 :: Point
p2 = (100, 80)

pic1 = translate (-50) 0 $ line [p1, p2]
pic2 = translate 50 0 $ thickLine1 p1 p2 10

d = disp $ pictures [pic1, pic2]

thickLine1 :: Point -> Point -> Float -> Picture
thickLine1 p1 p2 t = translate midX midY $ rotate angle $ rectangleSolid width height
  where (height, radian) = distanceRadian p1 p2
        width = t
        angle = radianToDegree radian
        (midX, midY) = middlePoint p1 p2

radianToDegree a = a * 180 / pi

distanceRadian :: Point -> Point -> (Float, Float)
distanceRadian (x1, y1) (x2, y2) = (distance, radian)
  where dX = x2 - x1
        dY = y2 - y1
	distance = sqrt $ dX * dX + dY * dY
	radian = atan2 dY dX


middlePoint :: Point -> Point -> Point
middlePoint (x1, y1) (x2, y2) = (x1 + halfDistX, y1 + halfDistY)
  where halfDistX = (x2 - x1) / 2
        halfDistY = (y2 - y1) / 2

