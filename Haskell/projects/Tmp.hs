module Tmp where

type Point = (Float, Float)

distanceRadian (x1, y1) (x2, y2) = (distance, radian)
  where dX = x2 - x1
        dY = y2 - y1
        distance = sqrt $ dX * dX + dY * dY
        radian = atan2 dY dX

middlePoint :: Point -> Point -> Point
middlePoint (x1, y1) (x2, y2) = (x1 + halfDistX, y1 + halfDistY)
  where halfDistX = (x2 - x1) / 2
        halfDistY = (y2 - y1) / 2

p1 :: Point
p1 = (0, 0)
p2 :: Point
p2 = (4, 4)
p3 :: Point
p3 = (2, 8)
p4 :: Point
p4 = (5, 3)
p5 :: Point
p5 = (4, 0)
p6 :: Point
p6 = (-4, 0)
p7 :: Point
p7 = (0, 4)
p8 :: Point
p8 = (0, -4)

