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

goLeft :: (Tree a, Breadcrumbs a) -> (Tree a, Breadcrumbs a)
goLeft (Node x l r, bs) = (l, LeftCrumb x r:bs)

goRight :: (Tree a, Breadcrumbs a) -> (Tree a, Breadcrumbs a)
goRight (Node x l r, bs) = (r, RightCrumb x l:bs)

goUp :: (Tree a, Breadcrumbs a) -> (Tree a, Breadcrumbs a)
goUp (t, LeftCrumb x r:bs) = (Node x t r, bs)
goUp (t, RightCrumb x l:bs) = (Node x l t, bs)

-- Zip together a current focus and its surrounding context
type Zipper a = (Tree a, Breadcrumbs a)

modify :: (a -> a) -> Zipper a -> Zipper a
modify f (Node x l r, bs) = (Node (f x) l r, bs)
modify _ (Empty, bs) = (Empty, bs)


exampleModify1 = newFocus  == newResult
  where newFocus = modify(\_ -> 'P') (goRight (goLeft (freeTree, [])))
        newResult = (
          Node 'P'
              (Node 'S' Empty Empty)
              (Node 'A' Empty Empty)
          ,
          [
          RightCrumb 'O'
              (Node 'L'
                  (Node 'N' Empty Empty)
                  (Node 'T' Empty Empty)
              ),
          LeftCrumb 'P'
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
          ])


-- we allow to attach a completely different subtree
attach :: Tree a -> Zipper a -> Zipper a
attach t (_, bs) = (t, bs)

topMost :: Zipper a -> Zipper a
topMost (t, []) = (t, [])
topMost z = topMost (goUp z)

exampleModify2 = (fst . topMost $ newFocus) == newResult
  where newFocus = modify(\_ -> 'P') (goRight (goLeft (freeTree, [])))
        newResult =
          Node 'P'
              (Node 'O'
                  (Node 'L'
                      (Node 'N' Empty Empty)
                      (Node 'T' Empty Empty)
                  )
                  (Node 'P'
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
