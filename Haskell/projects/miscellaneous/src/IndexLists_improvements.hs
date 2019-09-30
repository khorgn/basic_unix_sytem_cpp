module IndexLists_improvements (
                  ) where

import MakeLists ( make1D
                 , make2D
                 , make3D
                  )

import Debug.Trace (trace)

type X = Int
type Y = Int
type Z = Int

mapIndex :: (Int -> a -> b) -> [a] -> [b]
mapIndex f = zipWith f [0..]

mapIndex' :: (Int -> a -> b) -> [a] -> [b]
--  uncurry :: (a -> b-> c) -> (a, b) -> c
--  takes a function that is than uncurried to work on the zipped list
mapIndex' f = map (uncurry f) . zip [0..]

-- this one doesn't really do much
index1D :: [a] -> [(X, a)]
index1D = mapIndex $ \x p -> (x, p)

-- the first "mapIndex $ \y ->" takes a function "a -> b", then takes the point-free list at the end
index2D :: [[a]] -> [[((Y, X), a)]]
index2D = mapIndex $ \y -> innerIndexing y
  -- the second "mapIndex $ \x p -> ((y, x), p)" is of type "[b] -> [((a, Int), b)]", also possible "a -> b"
  -- [b] is every line in the 2D array (point-free), matching the needed function for mapIndex
  where
    innerIndexing :: a -> [b] -> [((a, Int), b)]
    innerIndexing y = mapIndex $ \x p -> ((y, x), p)

-- same as before, the first and second mapIndex got the first argument of their function, but need the rest before the list
index3D :: [[[a]]] -> [[[((Z, Y, X), a)]]]
index3D = mapIndex $ \z -> mapIndex $ \y -> mapIndex $ \x p -> ((z, y, x), p)



-- ==== Equivalent with list comprehensions ==== --
index3D' :: [[[a]]] -> [[[((Z, Y, X), a)]]]
index3D' w = [ [ [ ((z, y, x), p)
                -- index the list (with index but we don't care we don't use it)
                | (x, p) <- zip [0..] u
                ]
              -- index the list of lists (with index but we don't care we don't use it)
              | (y, u) <- zip [0..] v
              ]
            -- index the list of 2D lists
            | (z, v) <- zip [0..] w
            ]

