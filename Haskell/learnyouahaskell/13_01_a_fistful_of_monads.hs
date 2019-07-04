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

-- == Using mondas: "walk the line" == --
-- a tightrope walker gets birds on its pole, need to check if he is falling, it falls if the difference between each side is bigger than 3
type Birds = Int
-- left side and right side
type Pole = (Birds, Birds)

landLeft :: Birds -> Pole -> Pole
landLeft n (l, r) = (l+n, r)

landRight :: Birds -> Pole -> Pole
landRight n (l, r) = (l, r+n)

x -: f = f x

exampleChainingLand1 = landLeft 2 (landRight 1 (landLeft 1 (0, 0))) == (3, 1)
-- using a chaining application to make it read from left to right
exampleChainingLand2 = (0, 0) -: landLeft 1 -: landRight 1 -: landLeft 2 == (3, 1)

-- we also need to represent the possibility of falling for the tightrope walker
-- it should have fallend here but the end result seems fine
exampleChainingLand3 = (0, 0) -: landLeft 1 -: landRight 4 -: landLeft (-1) -: landRight (-2) == (0, 2)

-- we use maybe to represent the possibilty of falling
landLeftMaybe :: Birds -> Pole -> Maybe Pole
landLeftMaybe n (l, r)
  | abs ((l + n) - r) < 4 = Just (l + n, r)
  | otherwise             = Nothing
landRightMaybe :: Birds -> Pole -> Maybe Pole
landRightMaybe n (l, r)
  | abs (l - (r + n)) < 4 = Just (l, r + n)
  | otherwise             = Nothing

exampleChainingMaybePole1 = (0, 0) -: landRightMaybe 1 >>= landLeftMaybe 2
exampleChainingMaybePole2 = ( (0, 0) -: landLeftMaybe 1 >>= landRightMaybe 4 >>= landLeftMaybe (-1) >>= landRightMaybe (-2) ) == Nothing


