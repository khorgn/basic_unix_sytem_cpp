import Control.Monad ( Monad
                     , (<=<)
                     , (>=>)
                     )

-- == The monad typeclass
class Applicative m => MyMonad m where
  myReturn :: a -> m a
  myReturn = pure

  (~>>=) :: m a -> (a -> m b) -> m b

  (~>>) :: m a -> m b -> m b
  x ~>> y = x Main.~>>= \_ -> y

  myFail :: String -> m a
  myFail msg = error msg

-- >>= (and fail when possible) needs to be implemented for a good monad
-- fail is not to be used directly
data MyMaybe a = MyNothing | MyJust a
instance Functor MyMaybe where
  fmap _ MyNothing = MyNothing
  fmap f (MyJust a) = MyJust (f a)
instance Applicative MyMaybe where
  pure = MyJust
  MyNothing <*> _ = MyNothing
  _ <*> MyNothing = MyNothing
  (MyJust f) <*> (MyJust x) = MyJust (f x)
instance MyMonad MyMaybe where
  MyNothing ~>>= f = MyNothing
  MyJust x ~>>= f = f x
  myFail _ = MyNothing

exampleBind1 :: Maybe String
exampleBind1 = return "WHAT" :: Maybe String
-- Integer is a int of arbitrary size, while Int is a 32 or 64 bits int
exampleBind2 = (( Just 9 >>= \x -> return (x*10) ) :: Maybe Integer) == Just 90
exampleBind3 = ( Nothing >>= \x -> return (x*10) ) == Nothing

-- = Monad composition = --

leftComposition :: Monad m => (b -> m c) -> (a -> m b) -> a -> m c
leftComposition = (<=<)
rightComposition :: Monad m =>  (a -> m b) -> (b -> m c) -> a -> m c
rightComposition = (>=>)

exampleComposition1 = ((+1) . (*2)) 3 == 7
exampleComposition2 = ((\y -> return (y+1)) <=< (\x -> return (x*2))) 3 == Just 7
exampleComposition3 = ((\x -> return (x*2)) >=> (\y -> return (y+1))) 3 == Just 7
