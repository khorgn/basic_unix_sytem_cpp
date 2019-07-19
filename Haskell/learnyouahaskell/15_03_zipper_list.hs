data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)

type ListZipper a = ([a], [a])

goForward :: ListZipper a -> ListZipper a
goForward (x:xs, bs) = (xs, x:bs)

goBack :: ListZipper a -> ListZipper a
goBack (xs, b:bs) = (b:xs, bs)

simpleList = [1..4]

exampleList1 = (goForward . goForward) (simpleList, []) == ([3,4], [2,1])

-- zippers tend to save the path in a stack, so the elements are in inverse order as when they are used
