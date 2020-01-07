module MakeLists
          ( make1D
          , make2D
          , make3D
          ) where

import Randoms ( randomNums
               )

-- === START The good ones === --

make1D = randomNums 3

make2D = do
  xss <- mapM (const make1D) (replicate 3 0)
  let f xs w = map (*w) xs
  return $ zipWith f xss [1, 2, 4]

make3D = do
  xsss <- mapM (const make2D) (replicate 3 0)
  let f xss w = map (\xs -> (map (\x -> w*x)) xs) xss
  return $ zipWith f xsss [1, 4, 8]

-- === END The good ones === --

make2D' = do
  xs1 <- make1D
  xs2 <- make1D >>= \x -> return $ map (*2) x
  xs3 <- make1D >>= \x -> return $ map (*4) x
  return $ xs1:xs2:xs3:[]


make3D' = make2D' >>= \xs -> mapM (\x -> return $ map (map (*x)) xs) [1, 4, 8]


make2D'' xs = [xs, (map (*10) xs), (map (*100) xs)]

make3D'' xss = [xss, map (map (*1000)) xss, map (map (*10000)) xss]
