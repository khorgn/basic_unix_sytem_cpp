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


exampleChainingMaybePole1 = ( return (0, 0) >>= landRightMaybe 1 >>= landLeftMaybe 2 ) == Just (2, 1)
exampleChainingMaybePole2 = ( return (0, 0) >>= landLeftMaybe 1 >>= landRightMaybe 4 >>= landLeftMaybe (-1) >>= landRightMaybe (-2) ) == Nothing

-- here we use a function that ignore pole and always returns Nothing
exampleChainingMaybePole3 = ( return (0, 0) >>= landLeftMaybe 1 >>= (\_ -> Nothing) >>= landRightMaybe 1 ) == Nothing

-- can also be done with >>
-- (>>) :: (Monad m) => m a -> m b -> m b
-- m >> n = m >>= \_ -> n
exampleChainingMaybePole4 = ( Just 3 >> Just 4 ) == Just 4
exampleChainingMaybePole5 = ( Nothing >> Just 3 ) == Nothing

exampleChainingMaybePole6 = ( return (0, 0) >>= landLeftMaybe 1 >> Nothing >>= landRightMaybe 1 ) == Nothing

exampleChainingMaybePoleNoBind = case landLeft 1 (0, 0) of
  Nothing -> Nothing
  Just pole1 -> case landRight 4 pole1 of
    Nothing -> Nothing
    Just pole2 -> case landRight 2 pole2 of
      Nothing -> Nothing
      Just pole3 -> landLeft 1 pole3


