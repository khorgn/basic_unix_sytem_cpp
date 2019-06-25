addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c -< st, c `elem` ['A'..'Z']]

-- type :t <function|definition> to see the type of the function or definition


head' :: [a] -> a -- a type variable, for genericity
head' xs = head xs

