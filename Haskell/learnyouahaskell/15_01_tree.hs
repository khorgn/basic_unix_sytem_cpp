

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)


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


-- we want to change a value in the tree, but it's very inpractical
changeToP :: Tree Char -> Tree Char
changeToP (Node x l (Node y (Node _ m n) r)) = Node x l (Node y (Node 'P' m n) r)


-- lets remember the direction to the element we want to change
data Direction = L | R deriving (Show)
type Directions = [Direction]

changeToP' :: Directions -> Tree Char -> Tree Char
changeToP' (L:ds) (Node x l r) = Node x (changeToP' ds l) r
changeToP' (R:ds) (Node x l r) = Node x l (changeToP' ds r)
changeToP' [] (Node _ l r) = Node 'P' l r


-- lets also make a function to tell use what is the element at a given directions
elementAt :: Directions -> Tree a -> a
elementAt (L:ds) (Node _ l r) = elementAt ds l
elementAt (R:ds) (Node _ l r) = elementAt ds r
elementAt [] (Node x _ _) = x


-- zippers allow to generalize and use this principle more easily
