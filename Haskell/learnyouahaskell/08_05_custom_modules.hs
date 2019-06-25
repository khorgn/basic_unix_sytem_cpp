module Geometry
  ( sphereVolume
  , sphereArea
  , cubeVolume
  , cubeArea
  , cuboidArea
  , cuboidVolume
  , Cube
  , Tree
  ) where
-- if the Geometry.hs is in the smae folder as the program, we can import the module with import Geometry

sphereVolume :: Float -> Float
sphereVolume radius = (4.0 / 3.0) * pi * (radius ^ 3)

sphereArea :: Float -> Float
sphereArea radius = 4 * pi * (radius ^ 2)

cubeVolume :: Float -> Float
cubeVolume side = cuboidVolume side side side

cubeArea :: Float -> Float
cubeArea side = cuboidArea side side side

cuboidVolume :: Float -> Float -> Float -> Float
cuboidVolume a b c = rectangleArea a b * c

cuboidArea :: Float -> Float -> Float -> Float
cuboidArea a b c = rectangleArea a b * 2 + rectangleArea a c * 2 + rectangleArea c b * 2

rectangleArea :: Float -> Float -> Float
rectangleArea a b = a * b

data Cube = Cube Float Float Float

-- we only export Tree, not Leaf or Branch, so a tree cannot be constructed directly, only through the methods we give access to
data Tree a = Leaf a | Branch (Tree a) (Tree a)

-- if we have a more complicated module structure we can use folders
-- a folder Geometry with three files, Cube.hs, Cuboid.hs, and Sphere.hs with each their own submodule
-- any file in the same folder as the Geometry folder can directly call Geometry.Cube Geometry.Sphere and Geometry.Cuboid
-- files in Geometry can also call Geometry.Cube, Geometry.Sphere, Geometry.Cuboid

