import Data.Semigroup (Semigroup(..))
import Control.Applicative (liftA2, Alternative(..))
import Control.Monad (MonadPlus(..))
import Control.Monad.Fail (MonadFail(..))


data List a = Empty | a `Cons` List a deriving (Show, Eq)

Empty +++ ys = ys
(x`Cons`xs) +++ ys = x`Cons`(xs+++ys)


instance Semigroup (List a) where
  (<>) = (+++)

testSemigroup = routine == 3`Cons`(4`Cons`(5`Cons`(6`Cons`Empty)))
  where routine = (3`Cons`(4`Cons`Empty)) <> (5`Cons`(6`Cons`Empty))
  
-- requires Semigroup
instance Monoid (List a) where
  mempty = Empty
  mappend = (<>)

testMonoid = routine == (3`Cons`(4`Cons`(5`Cons`(6`Cons`(7`Cons`Empty)))))
  where routine = mempty `mappend` (3`Cons`(4`Cons`(5`Cons`Empty))) `mappend` (6`Cons`(7`Cons`Empty))


instance Foldable List where
  foldMap f Empty = mempty
  foldMap f (x`Cons`xs) = f x `mappend` foldMap f xs

testFoldable = routine == 4 -- (3 - (4 - (5 - 0)))
  where routine = foldr1 (-) (3`Cons`(4`Cons`(5`Cons`Empty)))


instance Functor List where
  fmap _ Empty = Empty
  fmap f (x `Cons` xs) = (f x) `Cons` (fmap f xs)

testFunctor = routine == 6 `Cons` (7 `Cons` (8 `Cons` Empty))
  where routine = fmap (+3) (3 `Cons` (4 `Cons` (5 `Cons` Empty)))

-- requires Functor
instance Applicative List where
  pure x = x `Cons` Empty
  Empty <*> _ = Empty
  _ <*> Empty = Empty
  (f `Cons` fs) <*> (xs) = (fmap f xs) +++ (fs <*> xs)

testApplicative = routine == 10 `Cons` (100 `Cons` (1000 `Cons` (20 `Cons` (200 `Cons` (2000 `Cons` (30 `Cons` (300 `Cons` (3000 `Cons` Empty))))))))
  where routine = (*) <$> 1`Cons`(2`Cons`(3`Cons`Empty)) <*> 10`Cons`(100`Cons`(1000`Cons`Empty))

-- requires Applicative
instance Monad List where
  Empty >>= _ = Empty
  xs >>= f = foldr1 (+++) (fmap f xs)

instance MonadFail List where
  fail _ = Empty

testMonad = routine == 3`Cons`((-3)`Cons`(4`Cons`((-4)`Cons`(5`Cons`((-5)`Cons`Empty)))))
  where hidenRoutine = fmap (\x -> [x, -x]) [3, 4, 5]  == [[3, -3], [4, -4], [5, -5]]
        routine = 3`Cons`(4`Cons`(5`Cons`Empty)) >>= \x -> x`Cons`((-x)`Cons`Empty)

-- ==== more advanced typeclasses ==== --

-- == (Functor, Foldable) => Traversable == --
-- while Foldable allows to tear down the structure, Traversable allows to preserve it

exampleTraversable1 = rejectWithNegatives == Nothing
  where rejectWithNegatives = (sequenceA . fmap deleteIfNegative) [-5, 3, 2, -1, 0]
        deleteIfNegative x = if x < 0 then Nothing else Just x

exampleTraversable1' = rejectWithNegatives == Just [1..10]
  where rejectWithNegatives = (sequenceA . fmap deleteIfNegative) [1..10]
        deleteIfNegative x = if x < 0 then Nothing else Just x

exampleTraversable2 = rejectWithNegatives == Nothing
  where rejectWithNegatives = (traverse deleteIfNegative) [-5, 3, 2, -1, 0]
        deleteIfNegative x = if x < 0 then Nothing else Just x

exampleTraversable2' = rejectWithNegatives == Just [1..10]
  where rejectWithNegatives = (traverse deleteIfNegative) [1..10]
        deleteIfNegative x = if x < 0 then Nothing else Just x

-- | Map each element of a structure to an action, evaluate these actions
-- from left to right, and collect the results. For a version that ignores
-- the results see 'Data.Foldable.traverse_'.
myTraverse :: (Traversable t, Applicative f) => (a -> f b) -> t a -> f (t b)
myTraverse = undefined -- for lists : (a -> f b) -> [a] -> f [a]

mySequenceA :: (Applicative f, Traversable t) => t (f b) -> f (t b)
mySequenceA = undefined -- for lists: [f b] -> f [b]

instance Traversable List where
  
  -- f takes the value in the Traversable tr and return an Applicative
  -- tr is the Traversable list to traverse
  traverse f tr = foldr cons_f (pure Empty) tr
      -- liftA2 filts the given binary function to the given applicative context
      where 
          -- cons_f :: Applicative f1 => t1 -> f1 (List a) -> f0 (List a)
          cons_f x ys = liftA2 Cons (f x) ys



-- == Applicative => Alternative == --
-- an Applicative that is also a monoid
-- it can't require monoid because Monoid takes a kind * while Applicative takes a kind *-> *

-- the identity element
myEmpty :: Alternative f => f a
myEmpty = undefined
-- the associated binary function
(~<|>~) :: Alternative f => f a -> f a -> f a
(~<|>~) = undefined

instance Alternative List where
  empty = Empty
  (<|>) = (+++)

exampleAlternative = undefined

-- = Alternative, Monad => MonadPlus = --
-- a Monad that is also a monoid
myMzero :: MonadPlus m => m a
myMzero = empty
myMplus :: MonadPlus m => m a -> m a -> m a
myMplus = (<|>)

instance MonadPlus List
