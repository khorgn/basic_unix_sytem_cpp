module Lib
    ( filterOutNonMatchingLines
    , filterOutMatchingLines
    , parseArgs
    , checkArgs'
    , grep
    , Arg(ArgFile)
    ) where

import System.IO ( openFile
                 , readFile
                 , hGetContents
                 , IOMode(..)
                 )
import Data.List ( isInfixOf
                 )
import Data.Char ( toLower
                 )


getCont = readFile "src/Lib.hs"

basicRead = do
  contents <- readFile "src/Lib.hs"
  putStrLn contents

basicRead' = do
  handle <- openFile "src/Lib.hs" ReadMode
  contents <- hGetContents handle
  print contents

filterOutNonMatchingLines pattern text = filter (isInfixOf pattern) text
filterOutNonMatchingLinesIgnoreCase pattern text = filter (isInfixOf (map toLower pattern)) (map (map toLower) text)
filterOutMatchingLines pattern text = filter (\l -> not $ isInfixOf pattern l) text

-- is Data.List.isInfixOf
lineMatch l p = isInfixOf p l

-- ==== Filtering ==== --
-- separate the options from the patterns
-- the files are handled by IO
-- the patterns define the filter function
-- the options change the input/output (for now)
grep :: [Arg] -> [String] -> [String]
grep ass@(a:as) lss@(l:ls) = undefined

filterForArgIgnoreCase as ls = if hasIgnoreCase as then
                                                   filterOutNonMatchingLinesIgnoreCase ps ls
                                                   else
                                                   filterOutNonMatchingLines ps ls
  where hasIgnoreCase = any $ \x -> case x of { ArgIgnoreCase -> True; otherwise -> False}
        ps = [x | ArgPattern x <- as]

filterLine (a:as) l = filter (isAccepted) l
  where isAccepted x = undefined

buildFilter :: [Arg] -> (String -> Bool)
buildFilter (a:as) = undefined
  where foo :: [Arg] -> (String -> Bool) -> (String -> Bool)
        foo (a:as) f = undefined

-- ==== Args ==== --

type Filepath = String
type Pattern = String

data Arg = ArgHelp
          | ArgIgnoreCase
          | ArgPattern Pattern
          | ArgFile Filepath
          deriving (Show, Eq)

checkArgs' :: [String] -> Bool
checkArgs' xs = if length xs == 1 then True else False

parseArgs :: [String] -> [Arg]
parseArgs xs = checkOptions [] xs


checkOptions args [] = args
checkOptions args (x:xs)
  | x == "-i" || x == "--ignore-case" = checkOptions (ArgIgnoreCase:args) xs
  | x == "-e" || x == "--regexp" = checkOptions (ArgPattern (head xs):args) (tail xs)
  | x == "-f" || x == "--file" = checkOptions (ArgFile (head xs):args) (tail xs)
  | otherwise = if xs == [] then (ArgPattern x):args
                            else (fmap (ArgFile) xs) ++ (ArgPattern x):args


exArgs = ["-i", "-e", "foo", "--regexp", "fuu", "-f", "bar", "aaa", "bbbb", "ccc"]
