module IndexLists_personalTries (
                  ) where

import MakeLists ( make1D
                 , make2D
                 , make3D
                  )

import Debug.Trace (trace)

type X = Int
type Y = Int
type Z = Int


-- index1D :: (Num b, Enum b) => [a] -> [(a, b)]
index1D :: [a] -> [(a, X)]
index1D xs = zip xs [0..]

-- index2D' :: (Num t, Num b, Enum t, Enum b) => [[a]] -> [[(a, (t, b))]]
-- index2D' xss = f xss' 0
--   where f (vs:vss) y = map (\(v, x) -> (v, (y, x))) vs : f vss (succ y)
--         f [] _ = []
--         xss' = map index1D xss

-- index2D :: (Num t, Num b, Enum t, Enum b) => [[a]] -> [[(a, (t, b))]]
index2D :: [[a]] -> [[(a, (Y, X))]]
index2D xss = map (\l -> let a = fst l; y = snd l in map (indexify y) a) xss'
  where xss' = index1D (map index1D xss)
        indexify y (v, x) = (v, (y, x))

-- -- [([(7,0),(9,1),(8,2)],0),([(4,0),(10,1),(18,2)],1),([(12,0),(4,1),(36,2)],2)]
-- index2D_partway xss = index1D xss'
--   where xss' = map index1D xss
-- 
-- tmp xss = map (\x -> let a = fst x; b = snd x in show a ++ " @@ " ++ show b) xss'
--   where xss' = index1D (map index1D xss)
--         almostSame = map (\x -> let a = fst x in let b = snd x in show a ++ " @@ " ++ show b) xss'

-- index3D :: (Num b1, Num b2, Num c, Enum b1, Enum b2, Enum c) => [[[a]]] -> [[[(a, (b1,b2,c))]]]
index3D :: [[[a]]] -> [[[(a, (Z,Y,X))]]]
index3D xsss = map (\l -> let a = fst l; z = snd l in map (mapIndex z) a) xsss'
  where
        xsss' = index1D $ map index2D xsss
        mapIndex z l = map (indexify z) l
        indexify z (v, (y, x)) = (v, (z, y, x))
