module IndexLists (
                  ) where

import MakeLists ( make1D
                  , make2D
                  , make3D
                  )



index1D :: (Num b, Enum b) => [a] -> [(a, b)]
index1D xs = zip xs [0..]
index2D :: (Num t, Num b, Enum t, Enum b) => [[a]] -> [[(a, (t, b))]]
index2D xss = f (h xss) 0
  where f (vs:vss) y = map (\(v, x) -> (v, (y, x))) vs : f vss (succ y)
        f [] _ = []
        h xss = map index1D xss

index3D xsss = undefined
  where f (vss:vsss) y = undefined
        h xsss = map index2D xsss
