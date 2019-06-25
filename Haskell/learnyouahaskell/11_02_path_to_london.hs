{-
a simplified disktra
two roads with passages between each
output is in the form

50  
10  
30  
5  
90  
20  
40  
2  
25  
10  
8  
0 

with triple (x, y, z), x being the top road, y the bottom road, and z the connection at the end of this section
 -}


import Data.List
import Control.DeepSeq (deepseq)


type Length = Int
data Section = Section {getSectionTop :: Length, getSectionBot :: Length, getSectionCross :: Length } deriving (Show)
type RoadSystem = [Section]


data Label = Top | Bot | Cross deriving (Show)
type Path = [(Label, Length)]

example :: RoadSystem
example = [Section 50 10 30, Section 5 90 20, Section 40 2 25, Section 10 8 0]
exampleSolution :: Path -- total length = 75
exampleSolution =  [(Bot, 10), (Cross, 30), (Top, 5), (Cross, 20), (Bot, 2), (Bot, 8)]

solve :: RoadSystem -> Path
solve roadSystem = 
        if sumPricePath1 <= sumPricePath2
        -- the pathes are produced with the head being the closest to the result, so we need to reverse it
        then reverse optimalPath1
        else reverse optimalPath2
        where
                (optimalPath1, optimalPath2) = optimalPairPath roadSystem
                sumPricePath1 = sum $ map snd optimalPath1
                sumPricePath2 = sum $ map snd optimalPath2
        
                


optimalPairPath :: RoadSystem -> (Path, Path)
optimalPairPath = cleanupOptimalPairPath . computeOptimalPairPath
        where
                computeOptimalPairPath r = foldl roadStep ([], []) r
                cleanupOptimalPairPath (p1:p1s, p2:p2s) =
                        ( if snd p1 == 0 then p1s else p1:p1s
                        , if snd p2 == 0 then p2s else p2:p2s
                        )

-- determine the best path for the Top and Bottom of the Section
-- entry is [] [] and first section, output is the new paths
-- also works for a foldl, with (Path, Path) as accumulator and Section as element
roadStep :: (Path, Path) -> Section -> (Path, Path)
roadStep (pathTop, pathBot) (Section secTop secBot secCross) =
        let
                priceTop = sum $ map snd pathTop
                priceBot = sum $ map snd pathBot
                forwardPriceToTop = priceTop + secTop
                crossPriceToTop = priceBot + secCross + secBot
                forwardPriceToBot = priceBot + secBot
                crossPriceToBot = priceTop + secCross + secTop
                newPathToTop =
                        if forwardPriceToTop <= crossPriceToTop
                        then  (Top, secTop):pathTop
                        else (Cross, secCross):(Bot, secBot):pathBot
                newPathToBot =
                        if forwardPriceToBot <= crossPriceToBot
                        then  (Bot, secBot):pathBot
                        else (Cross, secCross):(Top, secTop):pathTop
        in (newPathToTop, newPathToBot)


groupsOf :: Int -> [a] -> [[a]]
groupsOf 0 _ = undefined
groupsOf _ [] = []
-- take takes n or (length xs) elements, whichever is lower, idem for drop
groupsOf n xs = take n xs : groupsOf n (drop n xs)

groupsOf' :: Int -> [a] -> [[a]]
groupsOf' 0 _ = undefined
groupsOf' _ [] = []
groupsOf' n xs
        | length xs >= n = take n xs : groupsOf n (drop n xs)
        | otherwise = []

main = do
        -- getContents is lazy IO, so it reacts weirdly with interactive use
        -- to make is work interactively:
        --      use System.IO.Strict.getContents instead
        --      use byteStrings with Data.ByteString
        --      use Control.DeepSeq.deepseq, which will go throught the list completely, forcing its evaluation
        --              it is a deep version of seq, which ensure evaluation of the first agument before the segond
        contents <- getContents
        let
                -- lines doesn't discard empty lines, so we filter them out
                threes = groupsOf' 3 (map read $ filter (\x -> x /= "") $ lines contents)
                roadSystem = map (\[a, b, c] -> Section a b c) threes
                path = solve roadSystem
                -- Data.List.intersperse add in the list the given String, Concat concat the list directly
                pathString = concat $ intersperse ", " $ map (show . fst) path
                -- Data.List.intercalate concatenated with the given String inbetween
                pathString2 = intercalate ", " $ map (show . fst) path
                pathPrice = sum $ map snd path
        -- see comments for getContents, we need to force getContents to evaluate before putStrLn
        contents `deepseq` putStrLn $ "The best path is: " ++ pathString
        putStrLn $ "Its price is: " ++ show pathPrice



