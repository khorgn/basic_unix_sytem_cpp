-- reminder on functors and applicative functors
-- fmap :: (Functor f) => (a -> b) -> f a -> f b
-- (<*>) :: (Applicative f) => f (a -> b) -> f a -> f b

-- goal of monads: bind :: (Monad m) => m a -> (a -> m b) -> m b


-- == Maybe == --
reminderFmap1 = fmap (++"!") (Just "wisdom") == Just "wisdom!"
reminderFmap2 = fmap (++"!") Nothing == Nothing

reminderApplicative1 = ( Just (+3) <*> Just 3 ) == Just 6
reminderApplicative2 = ( (Nothing :: Maybe (Int -> Int)) <*> Just 3 ) == Nothing
reminderApplicative3 = ( pure (+3) <*> Nothing ) == Nothing
reminderApplicative4 = ( max <$> Just 3 <*> Just 6 ) == Just 6

-- use of monad
exampleFunctionNeedingMonad = (\x -> Just (x+1))
-- implementation of >>= for Maybe
bindMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
bindMaybe Nothing _ = Nothing
bindMaybe (Just x) f = f x

exampleBindMaybe1 = ( Just 3 `bindMaybe` \x -> Just (x+1) ) == Just 4
exampleBindMaybe2 = ( Just 3 `bindMaybe` \x -> Just (x+1) ) == Nothing
exampleBindMayb3 = ( Just 1 `bindMaybe` \x -> if x > 2 then Just x else Nothing ) == Nothing


