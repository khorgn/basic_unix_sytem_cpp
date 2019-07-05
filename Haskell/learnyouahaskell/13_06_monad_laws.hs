-- monads have _ laws


-- == law 1: Left identity == --
-- return x >>= f == f x
law1Maybe = ( return 3 >>= \x -> Just (x+1000) ) == (\x -> Just (x+1000)) 3
law1List = ( return "ABC" >>= \x -> [x, x, x] ) == (\x -> [x, x, x] ) "ABC"

leftIdentity :: (Eq (m b), Monad m) => (t -> m b) -> t -> Bool
leftIdentity f x = law1 == f x
  where law1 = return x >>= f


-- == law 2: right identity == --
-- m >>= return == m
law2List = ( [1, 2, 3, 4] >>= (\x -> return x) ) == [1, 2, 3, 4]

rightIdentity :: (Eq (m b), Monad m) => m b -> Bool
rightIdentity m = law2 == m
  where law2 = m >>= \x -> return x

-- == law 3: associativity == --
-- (m >>= f) >>= g == m >>= (\x -> f x >>= g)
-- the nesting of assications doesn't matter for monads
law3List = leftPart && rightPart
  where
    leftPart = ( [1, 2, 3, 4] >>= \x -> [x, -x] >>= \x -> [x, 2*x] )
               == [1,2,-1,-2,2,4,-2,-4,3,6,-3,-6,4,8,-4,-8]
    rightPart = ( [1,2,3,4] >>= (\y -> (\x -> [x, -x]) y >>= \x -> [x, 2*x]) )
               == [1,2,-1,-2,2,4,-2,-4,3,6,-3,-6,4,8,-4,-8]

-- note the equivalent to (.) for monads is Control.Monad.<=<
-- so the thrid law can be written (f <=< g) <=< h == f <=< (g <=< h)
-- equivalent to (f . g) . h == f . (g . h)

associativity :: (Monad m, Eq (m b)) => m a1 -> (a1 -> m a) -> (a -> m b) -> Bool
associativity m f g = law3L == law3R
  where law3L = (m >>= f) >>= g
        law3R = m >>= (\x -> f x >>= g)
