module Tmp where

data Tree a = Leaf a | Node a (Tree a) (Tree a)
  deriving (Show, Eq, Ord)

class All t where
  c_all :: (a -> Bool) -> t a -> Bool

instance All Tree where
  c_all f (Leaf a) = f a
  c_all f (Node x l r) = (f x) &&
    (c_all f l) && (c_all f r)
