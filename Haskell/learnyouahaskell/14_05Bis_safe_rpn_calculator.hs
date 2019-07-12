-- a reverse polish notation calculator
-- 10 - ( 4 + 3 ) * 2 ==> 10 4 3 + 2 * - == - -4

import Text.Read (readMaybe)
import Control.Monad (foldM, liftM)
-- could also use reads, that returns a pair with the parsed value and remaining string

example = "10 4 3 + 2 * -"

solveRPN :: (Num a, Read a) => String -> Maybe a
solveRPN st = do
  [result] <- foldM handleNewSymbol [] (words st)
  return result

handleNewSymbol :: (Num a, Read a) => [a] -> String -> Maybe [a]
handleNewSymbol (x:y:ys) "*" = return ((y * x):ys)
handleNewSymbol (x:y:ys) "+" = return ((y + x):ys)
handleNewSymbol (x:y:ys) "-" = return ((y - x):ys)
-- lift (:xs) so if the result of readMaybe is a Nothing, the result of (:xs) is also Nothing
handleNewSymbol xs numberString = liftM (:xs) (readMaybe numberString)

