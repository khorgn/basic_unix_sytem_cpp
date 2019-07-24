module Lib
    ( parseArgs
    , Options(..)
    , Flags(..)
    , Flag(..)
    , Content(..)
    ) where

type Content = String
type Flags = [Flag]
data Flag =
  NO_TRAIL
  | DISABLE_ESCAPE
  deriving (Show, Eq, Ord)

data Options = Options {optionsGetContent :: Content, optionsGetFlags :: Flags}

parseArgs :: [String] -> String
parseArgs [] = ""
parseArgs args = content ++ endString
  where
    flags = parseFlags args
    content = let rawContent = parseContent args
              in if DISABLE_ESCAPE `elem` flags then show rawContent else rawContent
    endString = if not (NO_TRAIL `elem` flags) then "\n" else ""

parseFlags :: [String] -> Flags
parseFlags [] = []
parseFlags (x:xs)
  | x == "-n" = NO_TRAIL : parseFlags xs
  | x == "-E" = DISABLE_ESCAPE : parseFlags xs
  | otherwise = parseFlags xs

parseContent :: [String] -> String
parseContent [] = ""
parseContent (x:xs)
  | head x == '-' = parseContent xs
  | head x /= '-' = x ++ let c = parseContent xs in if null c then "" else " " ++ c

exampleArgs1 = ["AAA\tBBB"]
exampleArgs2 = ["-n", "AAA\tBBB"]
exampleArgs3 = ["-E", "AAA\tBBB"]
exampleArgs4 = ["-n", "-E", "AAA\tBBB"]
exampleArgs5 = ["-n", "-E", "AAA\tBBB", "CCCC\nD"]

