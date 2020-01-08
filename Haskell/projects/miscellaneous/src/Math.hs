module Math ( mean
            , standardDeviation
            , cartesian
            , cartesianStrict
            ) where

import Data.List.NonEmpty ( NonEmpty(..)
                          )

mean :: (Fractional a) => NonEmpty a -> a
mean xs = (foldr1 (+) xs) / (fromIntegral $ length xs)

standardDeviation xs = sqrt (eOfx² - e²)
  where eOfx² = mean (fmap (\x -> x*x) xs)
        e² = let e = mean xs in e*e


gcdList :: Integral a => [a] -> a
gcdList xs = head [x1 | x1 <- xs]


cartesianStrict :: (a -> a -> b) -> [a] -> [b]
cartesianStrict f xs = clean' cs
  where cs = cartesian f xs
        l = length xs
        -- to remove, index 0, index n*n - 1, rule x
        -- observation rule x: index must be equal to 0 mod n+1
        -- for n == 2: 0, 3
        -- for n == 3: 0, 4, 8
        -- for n == 4: 0, 5, 10, 15
        clean _ [] = []
        clean i (x':xs')
          | i `mod` (l+1) == 0 = clean (succ i) xs'
          | otherwise           = x':(clean (succ i) xs')

        clean' xs' = foldr (\(i, x) acc -> case i `mod` (l+1) of
                                               0 -> acc
                                               _ -> x:acc) [] $ zip [0..] xs'

cartesian' :: (a -> a -> b) -> [a] -> [b]
cartesian' f xs = do
  x1 <- xs
  x2 <- xs
  return $ f x1 x2

cartesian :: (a -> a -> b) -> [a] -> [b]
cartesian f xs = f <$> xs <*> xs

-- TMP --
tmp n = zip [0..] $ cartesian (,) [1..n]
