-- a reverse polish notation calculator
-- 10 - ( 4 + 3 ) * 2 ==> 10 4 3 + 2 * - == - -4

import Text.Read (readMaybe)
-- could also use reads, that returns a pair with the parsed value and remaining string

solveRPN :: (Num a, Read a) => String -> a
solveRPN s = solve [] (words s)

example = "10 4 3 + 2 * -"

stringSymbols = words example

solve :: (Num a, Read a) => [a] -> [String] -> a
solve (res:[]) [] = res
solve res (x:xs) = case readMaybe x of
                    Just val -> solve (val:res) xs
                    Nothing -> solve (popStack x res) xs

popStack :: (Num a) => String -> [a] -> [a]
popStack s (x1:x2:xs)
  | s == "+" = (x2 + x1):xs
  | s == "-" = (x2 - x1):xs
  | s == "*" = (x2 * x1):xs
  | otherwise = error $ "wrong character: " ++ s

solveRPNFold :: (Num a, Read a) => String -> a
solveRPNFold = head . foldl handleNewSymbol [] . words
  where
    handleNewSymbol :: (Num a, Read a) => [a] -> String -> [a]
    handleNewSymbol stack@(x1:x2:xs) symbol = case readMaybe symbol of
                                      Just val -> val:stack
                                      Nothing -> case symbol of
                                        "+" -> (x2 + x1):xs
                                        "-" -> (x2 - x1):xs
                                        "*" -> (x2 * x1):xs
                                        "sum" -> [sum stack]
                                        otherwise -> error $ "wrong character: " ++ symbol

