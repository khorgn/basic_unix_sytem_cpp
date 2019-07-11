-- we add this extension for our own either type, to get better fail handling
{-# LANGUAGE FlexibleInstances #-}

data MyEither a b = MyLeft a | MyRight b deriving (Show, Eq)

instance Functor (MyEither a) where
  fmap _ (MyLeft e) = MyLeft e
  fmap f (MyRight x) = MyRight (f x)

instance Applicative (MyEither a) where
  pure x = MyRight x
  MyLeft e <*> _ = MyLeft e
  MyRight f <*> x = fmap f x


-- the default Either allows any a, and is not especially used for failure, just for a blocking state (left) and non-block state (right)
instance Monad (MyEither a) where
  MyLeft x >>= _ = MyLeft x
  MyRight x >>= f = f x

-- we overlap the instanciation of either with a special instance when a is String
-- not the actual implementation of Either
instance {-# OVERLAPPING #-} Monad (MyEither String) where 
  MyLeft x >>= _ = MyLeft x
  MyRight x >>= f = f x
  fail msg = MyLeft msg

exampleFail1 = ( fail "aa" :: MyEither String Int ) == MyLeft "aa"
exampleFail2 = fail "aa" :: MyEither Int Int -- exception

exampleEither1 = ( Left "boom" >>= \x -> return (x+1) ) == Left "boom"
exampleEither2 = ( Right 3 >>= \x -> return (x+100) ) == Right 103

