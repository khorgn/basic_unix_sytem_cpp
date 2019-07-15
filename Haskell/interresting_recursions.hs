-- Structural recursion, recursion is over a subset of the input
-- we are sure structural recursions act correctly on finite lists
sum [] = 0
sum (a:as) = a + sum as

-- Naturals can be represented as subsets like this:
data Nat = Zero | S Nat
-- and so fact can be seen as a structural recursion
fact 0 = 1
fact n = n * fact (n-1)


-- Guarded recursion, recursion constructs a result at each step
-- the program is well behavied even on infinite lists
fib = 1 : 1 : zipWith (+) fib (tail fib)

sumSoFar x (y:ys) = x :sumSoFar (x+y) ys

