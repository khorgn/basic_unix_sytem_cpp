import Control.Monad


leftComposition :: Monad m => (b -> m c) -> (a -> m b) -> a -> m c
leftComposition = (<=<)
rightComposition :: Monad m =>  (a -> m b) -> (b -> m c) -> a -> m c
rightComposition = (>=>)
