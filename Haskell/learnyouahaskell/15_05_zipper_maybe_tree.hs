data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show, Eq)


freeTree :: Tree Char
freeTree =
    Node 'P'
        (Node 'O'
            (Node 'L'
                (Node 'N' Empty Empty)
                (Node 'T' Empty Empty)
            )
            (Node 'Y'
                (Node 'S' Empty Empty)
                (Node 'A' Empty Empty)
            )
        )
        (Node 'L'
            (Node 'W'
                (Node 'C' Empty Empty)
                (Node 'R' Empty Empty)
            )
            (Node 'A'
                (Node 'A' Empty Empty)
                (Node 'C' Empty Empty)
            )
        )

-- save the path to the current subtree
-- and reconstruct the missing subtrees
data Crumb a = LeftCrumb a (Tree a) | RightCrumb a (Tree a) deriving (Show, Eq)
type Breadcrumbs a = [Crumb a]
type Zipper a = (Tree a, Breadcrumbs a)

goLeft :: Zipper a -> Maybe (Zipper a)
goLeft (Node x l r, bs) = Just $ (l, LeftCrumb x r:bs)
goLeft (Empty, _) = Nothing


goRight :: Zipper a -> Maybe(Zipper a)
goRight (Node x l r, bs) = Just $ (r, RightCrumb x l:bs)
goRight (Empty, _) = Nothing

goUp :: Zipper a -> Maybe(Zipper a)
goUp (t, LeftCrumb x r:bs) = Just $ (Node x t r, bs)
goUp (t, RightCrumb x l:bs) = Just $ (Node x l t, bs)
goUp (_, []) = Nothing

-- 

modify :: (a -> a) -> Zipper a -> Zipper a
modify f (Node x l r, bs) = (Node (f x) l r, bs)
modify _ (Empty, bs) = (Empty, bs)


-- we allow to attach a completely different subtree
attach :: Tree a -> Zipper a -> Zipper a
attach t (_, bs) = (t, bs)

topMost :: Zipper a -> Zipper a
topMost z = case goUp z of
              Just x -> topMost x
              Nothing -> z

exampleTree = newFocus == pure (freeTree, [])
  where newFocus = pure topMost <*> ((freeTree, []) -: goLeft >>= goRight >>= goRight >>= goLeft)


x -: f = f x
