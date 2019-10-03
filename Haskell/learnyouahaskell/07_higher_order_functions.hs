-- activate the ghc options in the file, so it's not need to call them when compiling
-- {-# OPTIONS_GHC -Wall #-}
-- allow the use of numberic underscores in the literals
{-# LANGUAGE NumericUnderscores #-}
-- ====== Higher-order functions ======
-- higher order functions are functions that takes functions
-- or return functions
-- ====== Curried functions ========
{-
normal functions with more than one argument are curried
hey form a new function after taking the first argument,
taking the second argument

It allows to make partially applied where the first parameters
are already filled
-}

equivalent1A = max 4 5
equivalent1B = (max 4) 5

-- multTree is actually a function with one argument returning a function
-- multTree :: (Num a) => a -> (a -> (a -> a))
multTree :: (Num a) => a -> a -> a -> a
multTree x y z = x*y*z

multTwoWitNine :: (Num a) => a -> a -> a
-- multTwoWitNine x y = multTree 9 x y
multTwoWitNine = multTree 9

-- === partial applications for infix functions ===
dividedByTen :: Floating a => a -> a
-- the infix function is sectionned
dividedByTen = (/10)
-- partially applied as a prefix function
dividedByTen' = (/) 10
dividedByTen'' = div 10

isUpperAlphaNum :: Char -> Bool
isUpperAlphaNum = (`elem` ['A'..'Z'])

-- the "-" function is special
minusFive = (-5+)
minusFive' = (-) 5
minusFive'' = subtract 5


-- === functions taking functions as parameters ===
applyTwice :: (a -> a) -> a -> a
-- applyTwice f x = f (f x)
applyTwice f x = f $ f x


zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ _ [] = []
zipWith' _ [] _ = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
-- zipWith' f (,) [1,2] [3,4] == zip [1,2] [3,4]


-- flip' :: (a ->b -> c) -> b -> a -> c is equivalent
flip' :: (a ->b -> c) -> (b -> a -> c)
flip' f = g
  where g y x = f x y

-- flip'' is equivalent to flip' thanks to functions being curried
-- flip'' :: (a->b->c) -> (b -> a -> c) is equivalent
flip'' :: (a->b->c) -> b -> a -> c
flip'' f x y = f y x


-- === Maps and Filters === --

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
  | p x = x : filter' p xs -- p x == True
  | otherwise == False = filter' p xs


-- let notNull x = not (null x) in filter notNull [[1,2,3],[],[3,4,5],[2,2],[],[],[]] 

quicksort' :: (Ord a) => [a] -> [a]
quicksort' [] = []
quicksort' (x:xs) =
  let left = quicksort'$ filter (<x) xs
      right = quicksort' $ filter (>=x) xs
  in left ++ [x] ++ right


largestDivisible :: (Integral a) => a
largestDivisible = head $ filter p [100_000, 99_999..]
  where p x = x `mod` 3829 == 0


-- === takeWhile === --
firstWord = takeWhile (/=' ') "elephants are big"

sumOddSquaresLessThan10_000 :: Integer
sumOddSquaresLessThan10_000 = sum $ takeWhile (>10_000) $ filter odd $ map (^2) [1..]


collatzSequence :: Integral a => a -> [a]
collatzSequence 1 = []
collatzSequence x
  | even x = let y = x `div` 2 in x : collatzSequence y
  | otherwise = let y = (x * 3) + 1 in x : collatzSequence y

-- Length returns an Int for historical reasons, so we must convert it to integral
numLongChains :: Num a => a
numLongChains = fromIntegral $ length $ filter (>15) $ map length $ map (collatzSequence)[1..100]


-- returns [(0*), (1*), .....]
multiplyOf :: [(Integer -> Integer)]
multiplyOf = map (*) [0..]

mult4and5 :: Integer
mult4and5 = (multiplyOf !! 4) 5


-- === Lambda === --
-- write lambda in parentesis so the lambda doesn't extends all the way to the right
numLongChains' :: Num a => a -> a
numLongChains' x = fromIntegral $ length $ filter (\xs -> length xs > 15) $ map (collatzSequence) [1..100]

-- you can pattern match in lambdas
addPairs = map (\(a, b) -> a + b) [(1,2), (3,4), (5,6)]


  
-- === Folds === --
-- folds are functions to reduce lists to single values
-- exists because the pattern of functions with x:xs is very frequent
-- folds takes a function, an accumulator, and a list

-- left fold, folds the list from the left side (the head)
sum'' :: Num a => [a] -> a
sum'' xs = foldl (\acc x -> acc + x) 0 xs

-- by taking into account that functions are curried, we can also write
-- calling foldl (+) 0 will return a function that takes a list
sum''' :: Num a => [a] -> a
sum''' = foldl (+) 0
-- not with sum'''', it throws an exception if the list is empty
-- foldl1 and foldr1 should only be used when it makes no sense for the list to be empty and an exception should be thrown
sum'''' :: Num a => [a] -> a
sum'''' = foldl1 (+)


elem'' :: (Num a, Eq a) => a -> [a] -> Bool
elem'' e xs = foldl (\acc x -> if e == x then True else acc) False xs

map'' :: (a -> b) -> [a] -> [b]
map'' f xs = foldr (\x acc -> f x : acc) [] xs

-- unfoldr is the inverse of foldr, producing a list from an initial value
-- unfoldl takes a function that return a Maybe(a,b). The a is the next value to pass in the function, and the b is the latest value produced for the new list
getDecrement10 :: [Int]
getDecrement10 = unfoldr (\b -> if b == 0 then Nothing else Just (b, b-1)) 10


-- scanl, scanr, scanl1, and scanr1 are equivalents to folds, but return the intermediate steps as lists
listSumsL = scanl (+) 0 [4, 5, 2, 1] -- [0, 4, 9, 11, 12]
listSumsR = scanr (+) 0 [4, 5, 2, 1] -- [12, 8, 3, 1, 0]


numberOfSqrtSumToExceed1000 = fromIntegral $ length (takeWhile(<=1000) $ scanl1 (+) $ map (sqrt) [1..]) + 1


-- === Function applications $ === --
-- a function application with ' ' has a very high precedence, while '$' has a very low one
-- function applied with ' ' is left associative, while those applied with '$' are right associative

sumFiltersMap = sum (filter (>10) (map (*2) [2..10]))
sumFiltersMap' = sum $ filter (>10) $ map (*2) [2..10] -- is equivalent

-- '$' also allows to treat function applications as other functions
-- here we map a function application over a list of functions
mapBy3 = map ($ 3) [(4+), (+4), (10*), (^2), sqrt]

-- subtract has the inverted arguments of (-)
-- flip inverts the arguments of (-)
equalsMinus1 = map ($ 3) [subtract 4, flip (-) 4, (-4+)]
equals1 = map ($ 3) [(4-), (-) 4]


-- === function composition '.' === --
-- function composition is right associative
-- write functions without their last parameter to be able to use function applications. The last function can be fully applied with $ before the last parameter if necessary
mapNegate = map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24]
mapNegate' = map (negate . abs) [5,-3,-6,7,-3,2,-19,24] -- clearer way with function composition

mapNegate2 = map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]
mapNegate2' = map (negate . sum . tail) [[1..5],[3..6],[1..7]]

-- can also be used to write in point-free style
fn x = ceiling (negate (tan (cos (max 50 x))))
fn' = ceiling . negate . tan . cos . max 50
