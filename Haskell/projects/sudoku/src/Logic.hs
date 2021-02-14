module Logic
  where


import Model
import qualified Data.Array as A
import Data.Maybe (catMaybes)
import Data.List (sort)


checkGrid g = all (==True) allChecks
  where
    checkAllColumns = fmap (checkColumn g) [1..size]
    checkAllRows = fmap (checkRow g) [1..size]
    checkAllSquares = fmap (checkSquare g) [1..size]
    allChecks = checkAllColumns ++ checkAllRows ++ checkAllSquares
    size = sudokuSize g


checkListUnique l = not $ hasDupplicate sortedList
  where sortedList = sort l
        hasDupplicate :: Eq a => [a] -> Bool
        hasDupplicate [] = False 
        hasDupplicate [_] = False 
        hasDupplicate (x1:x2:xs) = (x1 == x2) || hasDupplicate xs

checkRow :: Grid -> Integer -> Bool
checkRow g i = checkListUnique list
  where listWMaybes = fmap (g A.!) [(i, j) | j <- [1..size]]
        list = catMaybes listWMaybes
        size = sudokuSize g

checkColumn g j = checkListUnique list
  where listMaybes = fmap (g A.!) [(i, j) | i <- [1..size]]
        list = catMaybes  listMaybes
        size = sudokuSize g

-- NOTE: not wworking correctly right now
checkSquare g n = checkListUnique list
  where 
    sideSquare = sudokuSideSquares g
    -- The index of the square on the X axis
    nX = ((n-1) `mod` sideSquare) + 1
    -- The index of the square on the Y axis
    nY = ((n-1) `div` sideSquare) + 1
    rangeY = let y' = ((nY -1) * sideSquare) + 1 in (y', y' + sideSquare - 1)
    rangeX = let x' = ((nX -1) * sideSquare) + 1 in (x', x' + sideSquare - 1)
    listMaybes = fmap (g A.!) [(i, j) | i <- [fst rangeY..snd rangeY], j <- [fst rangeX..snd rangeX]]
    list  = catMaybes listMaybes

-- | The size of the sudoku: The number of columns rows, and squares; and the number of elements in each column, row, and square
sudokuSize :: Grid -> Integer
sudokuSize g = snd $ fst $ A.bounds g

-- | The number of squares on one size
sudokuSideSquares g = floor $ sqrt $ fromIntegral $ sudokuSize g
