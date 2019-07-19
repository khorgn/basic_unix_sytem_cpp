data Tree a = Node (Tree a) (Tree a) | Leaf a deriving (Show)
data TreeCtx a = Top | L (TreeCtx a) (Tree a) | R (Tree a) (TreeCtx a) deriving Show
type TreeZ a = (Tree a, TreeCtx a)

treeGoLeft :: TreeZ a -> TreeZ a
treeGoLeft (Node l r, c) = (l, L c r)

treeGoRight :: TreeZ a  -> TreeZ a
treeGoRight (Node l r, c) = (r, R l c)

treeGoUp :: TreeZ a -> TreeZ a
treeGoUp (t, L c r) = (Node t r, c)
treeGoUp (t, R l c) = (Node l t, c)

treeSetTop :: Tree a -> TreeZ a
treeSetTop t = (t, Top)

treeGoUpmost :: TreeZ a -> TreeZ a
treeGoUpmost l@(t, Top) = l
treeGoUpmost l = treeGoUpmost (treeGoUp l)

treeModify :: (Tree a -> Tree a) -> TreeZ a -> TreeZ a
treeModify f (t, c) = (f t, c)
