# Comments
```haskell
-- single line comment
{- multiple
line
comment -}
```
# ClassType definition
```haskell
class <ClassName> <a> where
	<functionName> :: <a> -> <a> -> Bool
```

# Type definition
```haskell
-- enumeration
data <TypeName> = <VariantA> | <VariantB> | <VariantC>
--- type tuple
data <TypeName> = <TypeName> Int Int String

foobar :: <TypeName> -> Bool
foobar (TypeName <x> _ <z>) = <definition>
--- type struct
data <TypeName> = <TypeName> { <field> :: Int, <field> :: String, <field> :: Int }

--- deriving ClassTypes
data <TypeName> = <VariantA> | <VariantB> Int Int | <VariantC> { <field> :: Int } deriving (Eq, Show)
```

# implenting classtypes
```haskell
instance <ClassType> <TypeName> where
	<functionName> <param> <param> = <definition>
```
# Function definition
```haskell
<functionName> :: [<TypeName> -> ...] <TypeName>
<functionName> [<param>, ...] = <definition>
<param> \`<functionName>\` <param> = <definition>
```

## 

## let in


## guard
foobar x y z =
	| <condition> = <definition>
	| <condition> = <definition>
	where <v> = <defintion>
		  <w> = <definition>

# dollars operator
```haskell
foo :: a -> b -> c
bar :: a -> b -> c

foo w bar x y <==> (((foo w bar) x) y) -- would probably not compile
foo x - y <==> ((foo x) - y)
foo (x - y) <==> foo $ x - y
foo x (bar y z) <==> foo x $ bar y z
foo x (y `bar` z) <==> foo x $ y `bar` z
```

# point operator
foo ( bar (1 + 2)) <==> foo . bar (1 + 2) <==> foo . bar $ 1 + 2
foo (bar ((+) 1 2)) <==> foo . bar ((+) 1 2)
foo (bar (toto x)) <==> foo . bar . toto x

# IO
```haskell
import System.IO

-- main function
main = <definition>

-- interact with IO
<functionName> = do
	putStrLn "Hello ?"
	name <= getLine
	putStrLn $ "Hello" ++ name

-- write to file
<functionName> = do
	theFile <- openFile "test.txt" WriteMode
	hPutStrLn theFileA ("Random line of text")
	hClose theFile

-- write to file
<functionName> = dp
	theFile <- openFile "test.txt" ReadMode
	contents <= hGetContents theFile
	putStr contents
	hClose theFile

```

# Fibonacci example
```haskell
fib = 1 : 1 : [a + b | (a, b) <- zip fib (tail fib)]

{-
-- steps
[1, 1]
fib == 1, (tail fib) == 1 => zip == (1, 1)
[1, 1, 2]
fib == 1, (tail fib) == 2, zip == (1, 2)
[1, 1, 2, 3]
fib == 2 (tail fib) == 3, zip == (2, 3)
-}

take 20 fib
fib !! 300
```

# GHCI
to write multiline definitions
```haskell
foobar :: Int -> Int; foobar x = x^2

:{
foobar :: Int -> Int
foobar x = x^2
:}
```
