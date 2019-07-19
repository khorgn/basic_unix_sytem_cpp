
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

