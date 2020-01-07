module DiscretizeDistrib
  (
  makeDistribution
  ) where

import System.Random (
  randomIO
  )
import Data.Maybe ( fromJust
                  )
import Data.List.NonEmpty ( NonEmpty(..),
                            nonEmpty
                          )

-- START 1D distrib --


-- | Makes a distribution from a group of number
makeDistribution :: (Functor f, Foldable f, Fractional a) => f a -> f a
makeDistribution xs = 
  let total = foldr1 (+) xs
   in fmap (/total) xs

discretizeDistribution :: [Double] -> [Int]
discretizeDistribution xs = undefined
  where maxElem = foldr1 max xs
        minElem = foldr1 min xs


-- END 1D distrib --


-- TMP --
exDist1 = [0.3, 0.5, 0.2]

exMin = foldr1 min exDist1
exMax = foldr1 max exDist1


mean :: (Fractional a) => NonEmpty a -> a
mean xs = (foldr1 (+) xs) / (fromIntegral $ length xs)

standardDeviation xs = sqrt (eOfx² - e²)
  where eOfx² = mean (fmap (\x -> x*x) xs)
        e² = let e = mean xs in e*e

