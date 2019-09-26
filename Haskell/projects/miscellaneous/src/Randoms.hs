module Randoms
    ( randomNums
    ) where

import System.Random ( randomRIO
                     )

randomNums :: Int -> IO [Int]
randomNums n = mapM (const $ randomRIO (0,9)) [1..n]

randomNums' :: [IO Int]
randomNums' = map (const $ randomRIO (0, 9)) [0..]

randomNums'' :: Int -> IO [Int]
randomNums'' n = sequence $ take n randomNums'




