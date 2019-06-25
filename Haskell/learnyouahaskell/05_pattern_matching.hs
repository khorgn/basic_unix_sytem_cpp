lucky :: (Intergral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1+x2, y1+y2)

first (x, _, _) = x
second (_, x, _) = x
third (_, _, x) = x

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

capital :: String -> String
capital "" = "Empty string, whoops!"
capital all@(x:xs) = "The first letter of  " ++ all ++ " is " ++ [x]

-- Gards
bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
	| bmi <= 18.5 = "You're underweight, you emo, you!"
	| bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
	| bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
	| otherwise = "You're a whale, congratulations!"

bmiTell' :: (RealFloat a) => a -> a -> String
bmiTell' wheight height
	| bmi <= skinny = "You're underweight, you emo, you!"
	| bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
	| bmi <= fat = "You're fat! Lose some weight, fatty!"
	| otherwise = "You're a whale, congratulations!"
	where bmi = weight / height ^ 2
	      (skinny, normal, fat) = (18.5, 25.0, 30.0)

-- functions can also be defined in infix
a `myCompare` b
	| a > b = GT
	| a == b = EQ
	| otherwise = LT


intials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
	where 	(f:_) = firstname
		(l:_) = lastname

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
	where 	bmi weight height = weight / height ^ 2

-- let bindings
-- the definitions after let are only available after in
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
	let	sideArea = 2 * pi * r* h
		tpoArea = pi * r ^2
	in sideArea + 2 * topArea

squares = [let square x = x * x in (square 5, square 3, square 2)]
hey = (let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)

calcBmis' :: (RealFloat a) => [(a, a)] -> [a] 
calcBmis' xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0] 

-- Case
-- Same thing, the first one is syntactic sugar
myhead'' :: [a] -> a
myhead'' [] = error "No head of empty lists!"
myhead'' (x:_) = x

myhead''' :: [a] -> a
myhead''' xs = case xs of [] -> error "No head for empty lists!"
			  (x:_) -> x

describeList :: [a] -> String  
describeList xs = "The list is " ++ case xs of [] -> "empty."  
					       [x] -> "a singleton list."   
					       xs -> "a longer list."  

describeList' :: [a] -> String  
describeList' xs = "The list is " ++ what xs  
    where what [] = "empty."  
          what [x] = "a singleton list."  
          what xs = "a longer list." 
