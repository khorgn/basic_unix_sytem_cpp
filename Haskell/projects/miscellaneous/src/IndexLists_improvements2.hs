{-# LANGUAGE TupleSections #-}
-- allows the use of tuple sections syntax
-- makes (, True) equivalent to \x -> (x, True)
-- and (, "I", , , "Love", , 1337) equivalent to \a b c d -> (a, "I", b, c, "Love", d, 1337)

module IndexLists_improvements2 (
                  ) where

import MakeLists ( make1D
                 , make2D
                 , make3D
                 )


type C = Int

mapIndex :: (C -> a -> b) -> [a] -> [b]
mapIndex f = zipWith f [0..]

index1_ :: [C] -> [a] -> [([C], a)]
index1_ c = mapIndex $ \x -> (reverse (x : c),)
index2_ :: [C] -> [[a]] -> [[([C], a)]]
index2_ c = mapIndex $ \y -> index1_ $ y : c
index3_ :: [C] -> [[[a]]] -> [[[([C], a)]]]
index3_ c = mapIndex $ \z -> index2_ $ z : c
index4_ :: [C] -> [[[[a]]]] -> [[[[([C], a)]]]]
index4_ c = mapIndex $ \w -> index3_ $ w : c

index1D :: [a] -> [([C], a)]
index1D = index1_ []
index2D :: [[a]] -> [[([C], a)]]
index2D = index2_ []
index3D :: [[[a]]] -> [[[([C], a)]]]
index3D = index3_ []
index4D :: [[[[a]]]] -> [[[[([C], a)]]]]
index4D = index4_ []

