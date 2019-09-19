module Lib
    ( someFunc
    , getRandomNumber
    ) where

import qualified System.Random as R

-- perlin noise implementation
-- https://gpfault.net/posts/perlin-noise.txt.html

-- map generation
-- https://www.youtube.com/watch?v=wbpMiKiSKm8&list=PLFt_AvWsXl0eBW2EiBtl_sxmDtSgZBxB3

{-
Now, let's imagine that for each integer, a value of either 1 or -1 is chosen randomly. For a given integer i, we're going to denote the corresponding randomly chosen value as g(i). We'll call these values gradients.

The noise function is defined as follows:
n(p) = (1 - F(p-p0))g(p0)(p-p0) + F(p-p0)g(p1)(p-p1)

Where:
    p0 = floor(p) (largest integer smaller than or equal to p)
    p1 = p0 + 1 (smallest integer larger than p)
    g(p0) and g(p1) are the gradients at p0 and p1 respectively
    F(t) = t3(t(t-15)+10), a fade function, the purpose of which will be explained a bit later
-}

someFunc :: IO ()
someFunc = putStrLn "someFunc"

getRandomNumber :: IO()
getRandomNumber = do
  gen <- R.newStdGen
  let (foo, _) = R.random gen :: (Double, R.StdGen)
  putStrLn $ show foo

getRandomNoise :: (R.Random a, RealFrac a, R.RandomGen g) => g -> [a]
getRandomNoise g = R.randomRs (-1, 1) g

getRandomNoiseIO :: (R.Random a, RealFrac a) => [IO a]
getRandomNoiseIO = repeat $ R.randomIO
-- sequenceA evaluates a foldable of applicatives and return a functor of foldable
-- here it returns the list of number we want

regularNoise :: RealFrac a => a -> a
regularNoise x = (1 - (fade (x - f)))
            -- need to convert back to Num since Integral restrict computation with non-integrals
  where f = fromIntegral $ floor x
        c = ceiling x

fade = undefined
