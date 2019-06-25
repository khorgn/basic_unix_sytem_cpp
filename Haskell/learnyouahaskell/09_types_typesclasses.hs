import qualified Data.Map as Map
-- === Types and Typeclasses == --

-- == type == --
-- a weak type, (Int, Int) and Point can be used interchangeably
type Point = (Int, Int)
-- == newtype == --
-- a strong type removed at execution time, the compiler see Shape and [Int] as different
newtype Shape = Shape [Int]
-- == data == --
-- a strong type, the compiler and the runtime see Enumeration as its own type
-- Enumeration
data Enumeration = Variant1 | Variant2 | Variant3
-- Type tuple
data Tuple = Tuple Int String
-- Record
data Record = Record {recordFieldA :: Int, recordFieldB :: String}


-- == general data type == --
type Point2 a = (a, a)
-- the first Shape2 is called a type constructor (and Shape2 Int is a type)
-- the second one is called a value constructor (and Shape2 [3] is a value)
newtype Shape2 a = Shape2 [a]
data Record2 a = Record2 {record2FieldA :: a, record2FieldB :: a}
-- == typeclass constraints
-- requires an extension
-- data (Ord a) => Record3 a = Record3 {record3FieldA :: a, record3FieldB :: a}
-- usually a bad idea, because the constraint needs then to be mentionned in all functions using the type, if limiting construction is needed, its better to put constraints in the functions to construct the type, like Map with fromList


-- == deriving typeclasses == --
-- some typeclasses can be automatically instanciated for custom types
-- Show => allows to convert to string with the show function
newtype TypeShow a = TypeShow a deriving Show -- show (TypeShow 3) <==> "TypeShow 3"
-- Read => allows to convert from string with the read function
newtype TypeRead a = TypeRead a deriving (Show, Read) -- read "TypeRead 3" :: TypeRead Int <==> TypeRead 3
-- Eq => allows to test equality with == and /=
newtype TypeEq a = TypeEq a deriving Eq -- (TypeRead 3) == (TypeRead 3) <==> True
-- Ord => allows to test comparison with >, >=, <, and <=; requires Eq
newtype TypeOrd a = TypeOrd a deriving (Eq, Ord) -- (TypeRead 3) >= (TypeRead 3) <==> True
-- Enum => allows to get the value after this one
data TypeEnum = A | B | C | D deriving Enum -- succ A <==> B, pred A <==> D
-- Bounded
data TypeBounded = TypeBounded Int deriving Bounded -- minBound :: TypeBounded <==> minBound :: Int, maxBound :: TypeBounded <==> maxBound :: Int

-- == exporting types
-- module Module1 (Enumeration,
-- load only the type, can only use it through our functions and can't pattern match our type--^
--                 Enumeration(Variant1, Variant2),
-- load the selected constructors for the type--^
--                 Enumeration(..) )
-- load all the constructors for the type--^

-- == patially applied type constructors
type IntMap v = Map.Map Int v

-- == the type Either == --
-- used to handle failure
-- Left a is for failure
-- Right b is for success


-- == recursive data structure == --
data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)
exampleList = 3 `Cons` (4 `Cons` (5 `Cons` Empty))
-- in lists, "Cons" is another word for ":", ":" is internally a constructor with two arguments, like here
infixr 5 :-: -- defines the priority and associativity of this operator, optional
data List2 a = Empty2 | a :-: (List2 a) deriving (Show, Read, Eq, Ord)

exampleList2 = 3 :-: 4 :-: 5 :-: Empty2

-- = binary search tree = --
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: Ord a => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node v left right)
  | x > v = Node v left (treeInsert x right)
  | x < v = Node v (treeInsert x left) right
  | otherwise = Node v left right

treeElem :: Ord a => a -> Tree a -> Bool
treeElem _ EmptyTree = False
treeElem x (Node v l r)
  | x == v = True
  | x > v = treeElem x r
  | x < v = treeElem x l

exampleNums = [8, 6, 4, 1, 7, 3, 5]
exampleTree = foldr treeInsert EmptyTree exampleNums


-- == typeclasses == --
class MyEq a where -- typeclass definition; a is the type variable, the type that will instanciate the typeclass
  (-==-) :: a -> a -> Bool -- function definition
  (-/=-) :: a -> a -> Bool -- function definition
  x -==- y = not (x -/=- y) -- function implementation
  x -/=- y = not (x -==- y) -- function implementation
  -- because both default implementation are interdependent the "minimal complete definition" for the typeclass is -==- or -/=-, no need to define both

data TrafficLight = Red | Yellow | Green

instance MyEq TrafficLight where
  Red -==- Red = True
  Yellow -==- Yellow = True
  Green -==- Green = True
  _ -==- _ = False

instance Show TrafficLight where
  show Red = "Red light"
  show Yellow = "Yellow light"
  show Green = "Green light"

-- class constaint on a class declaration, or subclassing
class (MyEq a) => MyTypeClass a where
  myFunction :: a -> a -> a

-- instanciation with context type
instance (MyEq m) => MyEq (Maybe m) where
  Just x -==- Just y = x -==- y
  Nothing -==- Nothing = True
  _ -==- _ = False


-- == a yes-no typeclass == --
-- implementing a typeclass to allow boolesque interaction like in scripting languages for ints (0), string (""), ...
class YesNo a where
  yesno :: a -> Bool

instance YesNo Int where
  yesno 0 = False
  yesno _ = True

instance YesNo [a] where
  yesno [] = False
  yesno _ = True

instance YesNo Bool where
  yesno = id

instance YesNo (Maybe m) where
  yesno (Just _) = True
  yesno Nothing = False

instance YesNo (Tree a) where
  yesno EmptyTree = False
  yesno _ = True

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult


-- == the functor typeclass == --
-- represent types that can be mapped over, like List
class MyFunctor f where -- here f is not a concrete type, but a type constructor
  myFmap :: (a -> b) -> f a -> f b -- so f needs to be accompanied to a value to construct a concrete type
-- types that acts like boxes can be instances of Functor

instance MyFunctor [] where
  myFmap = map

instance MyFunctor Maybe where
  myFmap f (Just x) = Just (f x)
  myFmap _ Nothing = Nothing

instance MyFunctor Tree where
  myFmap _ EmptyTree = EmptyTree
  myFmap f (Node v l r) = Node (f v) (myFmap f l) (myFmap f r)

instance MyFunctor (Either a) where
  myFmap _ (Left x) = Left x
  myFmap f (Right x) = Right (f x)

-- == kinds == --
-- kinds are more or less the type of types
-- types are the labels of values, kinds are the labels of types
-- in ghci :k Int gives you the kind of Int
-- here Int :: *
-- "*" means that its a concrete type

-- Maybe :: * -> *
-- the Maybe type constructor take one concrete type and returns a concrete type


-- = weird kind examples = --
class Tofu t where -- t :: * -> (* -> *) -> *
  tofu :: j a -> t a j

data Frank a b = Frank {frankField :: b a} deriving (Show)
-- a :: *
-- b :: (* -> *)
-- Frank :: (* -> *) -> * -> *

instance Tofu Frank where
  tofu x = Frank x
