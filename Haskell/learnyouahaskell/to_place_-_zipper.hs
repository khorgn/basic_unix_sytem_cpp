-- list zipper
data Cons a = Empty | Cons a (Cons a) deriving (Show)
data ConsZ a = ConsZ { getConsZLeft :: Cons a, getConzHere :: a, getConsZRight :: Cons a } deriving Show

consZip :: Cons a -> Maybe (ConsZ a)
consZip Empty = Nothing
consZip (Cons a as) = Just (ConsZ Empty a as)

consUnzip :: ConsZ a -> Cons a
consUnzip (ConsZ Empty a as) = Cons a as
consUnzip (ConsZ (Cons l ls) a as) = consUnzip ((ConsZ ls) l (Cons a as))

consMoveRight :: ConsZ a -> Maybe (ConsZ a)
consMoveRight (ConsZ _ _ Empty) = Nothing
consMoveRight (ConsZ ls x (Cons a as)) = Just (ConsZ (Cons x ls) a as)

consMoveLeft :: ConsZ a -> Maybe (ConsZ a)
consMoveLeft (ConsZ Empty _ _) = Nothing
consMoveLeft (ConsZ (Cons a as) x rs) = Just (ConsZ as a (Cons x rs))

consModify :: (a -> a) -> ConsZ a -> ConsZ a
consModify f (ConsZ ls x rs) = ConsZ ls (f x) rs


-- tree zipper
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

-- file system

type Name = String
type Data = String

data FSItem = File Name Data | Folder Name [FSItem] deriving (Show)

-- files are ordered
-- the first list is the items before the one currently focused
-- the second list is the items after the one currently focused
data FSCtx = FSCtx Name [FSItem] [FSItem] deriving (Show)

type FSZipper = (FSItem, [FSCtx])

defaultDisk :: FSItem
defaultDisk =
  Folder "root"
    [ File "goat.wmv" "baaaaa"
    , File "pope.avi" "god bless"
    , Folder "pics"
      [ File "ape.jpg" "bleargh"
      , File "watermelon.gif" "smash"
      , File "skull.bmp" "Yi"
      ]
    , File "dijon.doc" "best mustard"
    , Folder "programs"
      [ File "prog1.exe" "go"
      , File "owl.dmg" "h00t"
      , File "virtus.exe" "virus"
      , Folder "source code"
        [ File "best_prog.hs" "main = print (fix error)"
        , File "random.hs" "main = print 4"
        ]
      ]
    ]



fsUp :: FSZipper -> FSZipper
-- the inner parentheses for FSCtx are not necessary but make it easier to understand
fsUp (item, (FSCtx name lfiles rfiles):ctxs) = (Folder name (lfiles ++ [item] ++ rfiles), ctxs)

fsTo :: Name -> FSZipper -> FSZipper
fsTo name (Folder folderName items, ctxs) =
  -- break :: (a -> Bool) -> [a] -> ([a], [a])
  -- first element evaluate to false, second the first one to evaluate to true
  let (lfiles, item:rfiles) = break (nameIs name) items
  in (item, FSCtx folderName lfiles rfiles:ctxs)

nameIs :: Name -> FSItem -> Bool
nameIs name (Folder folderName _) = name == folderName
nameIs name (File fileName _) = name == fileName

fsRename :: Name -> FSZipper -> FSZipper
fsRename newName (Folder name items, ctxs) = (Folder newName items, ctxs)
fsRename newName (File name dat, ctxs) = (File newName dat, ctxs)




(-:) :: a -> (a -> b) -> b
x -: f = f x
