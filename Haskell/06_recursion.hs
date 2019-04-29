maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
  | x < y = y
  | otherwise = x
  where y = maximum' xs




maximum'' :: (Ord a) => [a] -> a
maximum'' [] = error "maximum of empty list"
maximum'' [x] = x
maximum'' (x:xs) = max x $ maximum'' xs


replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' 0 _ = []
replicate' i x = x : replicate' (i-1) x

replicate'' :: (Num i, Ord i) => i -> a -> [a]
replicate'' n x
  | n <= 0 = []
  | otherwise = x:replicate'' (n-1) x



take' :: (Ord t, Num t) => t -> [a] -> [a]
take' n _
  | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x:take' (n-1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' a = a : repeat' a

zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' e (x:xs)
  | e == x = True
  | otherwise = e `elem'` xs


quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  let left = quicksort [y | y <- xs, y <= x]
      right = quicksort [y | y <- xs, y > x]
  in left ++ [x] ++ right

