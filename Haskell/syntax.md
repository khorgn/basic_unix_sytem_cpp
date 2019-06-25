# GHCI
* `:t` gives the type of the function  
* `:m +<module>` adds a module to the context
* `:i` give the associativity of the function (left or right associative) and its priority
  * infixr means infix and right associative
  * the number after it gives the priority

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
-- type tuple
data <TypeName> = <TypeName> Int Int String

foobar :: <TypeName> -> Bool
foobar (TypeName <x> _ <z>) = <definition>
-- type struct
data <TypeName> = <TypeName> { <field> :: Int, <field> :: String, <field> :: Int }
-- creates a function for each field that takes a value of type TypeName as argument)

-- deriving ClassTypes
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

# Dealing with context (Maybe, List ([]), IO, ...)
> shown as f :: c a with c being a generic context and a being a generic type in the context
contexts implements fmap, ap, and bind
## Wrap a value in a context
call a constructor
* List: `wrap x = [x]`
* Maybe: `wrap x = Just x`
* IO: `wrap x = return x`

## manipulate values in contexts
* can't unwrap context easily
  * Maybe need to take into account Nothing
  * List is destructive, you end up with only one element
  * can't be done with IO
* can use `fmap`, `ap`, and `bind` to do it

### fmap
`fmap :: (a -> b) -> c a -> c b`
> a generic map for all context instead of just List
> has an operator version: `<$>`
> fmap is defined in the typeclass `Functor`
> a functor is a type that wraps another types and uses fmap to apply functions to it

```haskell
fmap show [1, 2, 3] <=> ["1", "2", "3"]
fmap show (Just 1) <=> Just "1"
fmap show Nothing <=> Nothing

show <$> Just 1 <=> Just "1"
```

### ap
`ap :: c (a -> b) -> c a -> c b`
> ap for "apply"
> apply a function in a context to a value in a context
> used with fmap when the function used takes more than one argument
> There are better abstraction (functions) built from ap
> has an operator version: `<*>`
> ap is defined in the typeclass `Applicative`, it has `Functor` as a requisit (a type already must implement Functor to implement Applicative)
> an Applicative Functor is a type that wraps another value and uses fmap and ap

```haskell
fmap (+) (Just 3) <=> Just (3+)
Just (3+) :: Maybe (Int -> Int)
ap (Just (3+)) (Just 2) <=> Just (5)
ap (fmap (+) (Just 3)) (Just 2) <=> Just (5)

Just (3+) <*> Just 39 <=> Just 42
```

`(+) <$> Just 3 <*> Just 5 <=> Just 8

### bind
`(a -> c b) -> c a -> c b`
> used to chain functions
> has an operator version: `>>=`
> ap is defined in the typeclass `Monad`, it has `Functor` and `Applicative` as a requisit (a type already must implement Functor and Applicative to implement Monad)
> a Monad is a context that wraps values and in which you build pipelines, chaining functions that keep returning values inside that context

```haskell
div2 :: Int -> Maybe Int
div2 x = if (x%2 == 0) then Just (x `div` 2) else Nothing

div4 :: Int -> Maybe Int
div4 x = let y = div2 x -- Maybe Int
         in bind div2 y -- Maybe Int
div4 x = bind div2 $ div2 x
div4 x = div2 >>= $ div2 x

div8 x = div2 x >>= div2 >>= div2
```

#### do notation
> works for any other monad

* common code
```haskell
getFirstName :: IO String
getLastName :: IO String
greetUser :: String -> String -> IO ()
main :: IO()
```
* version with operators
```haskell
main = 
      getFirstName >>= \firstname ->
          >>= getLastName >>= \lastname ->
		    greetUser firstname lastname
```
* version with do notation
```haskell
main = do
    firstname <- getFirstName -- String
	lastname <- getLastName -- String
	greetUser firstname lastname
```

#### implement a Monad
need to instanciate all three typeclasses
```haskell
ErrorOr a = Error ErrorMsg
            | Value a
		    deriving (Show, Eq)
```

```haskell
-- fmap :: (a -> b) -> ErrorOr a -> ErrorOr b
instance Functor ErrorOr where
  fmap _ (Error msg) = Error msg
  fmap f (Value x) = Value $ f x

-- ap :: ErrorOr (a -> b) -> ErrorOr a -> ErrorOr b
instance Applicative ErrorOr where
  pure = Value -- pure x = Value x
  (<*>) (Error msg) _ = Error msg -- ap
  (<*>) (Value f) eoa = fmap f eoa -- ap

-- bind :: ErrorOr a -> (a -> ErrorOr b) -> ErrorOr b
instance Monad ErrorOr where
  return = Value -- return x = Value x
  (>>=) (Error msg) _ = Error msg
  (>>=) (Value x) f = f x
```
