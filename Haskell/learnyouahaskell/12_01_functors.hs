import Data.Char
import Data.List

-- IO a

{-
instance Functor IO where
  fmap f action = do
    result <- action
    return (f result)
fmap :: (a -> b) -> IO a -> IO b
-}

ioWithoutFunction = do
  line <- getLine
  let line' = reverse line
  putStrLn $ "you said " ++ line' ++ " backward"

ioWithFunctor = do
  line <- fmap reverse getLine
  putStrLn $ "you said " ++ line ++ " backward"

ioAnotherExample = do
  line <- fmap (intersperse '-' . reverse . map toUpper) getLine
  putStrLn line


-- (->) r
{-
instance Functor ((->) r) where
  fmap f g = (\x -> f (g x))
  -- or
  fmap = .
fmap :: (a -> b) -> (r -> a) -> (r -> b)
-}


withFmap = fmap (*3) (+100) 1
withoutFmap = ((*3) . (+100)) 1


-- === Functor laws === --

firstLaw :: (Functor f, Eq (f a)) => f a -> Bool
firstLaw o = (fmap id o) == o


secondLaw :: (Functor f, Eq (f c)) => (a -> b) -> (b -> c) -> f a -> Bool
secondLaw f g o = (fmap (g . f) o) == fmap g (fmap f o)


-- example of instance not following the laws
data CMaybe a = CNothing | CJust Int a deriving (Show, Eq) -- a counter type

instance Functor CMaybe where
  fmap f CNothing = CNothing
  fmap f (CJust counter x) = CJust (counter+1) (f x)

doesn'tRespectFirstLaw :: Eq a => CMaybe a -> Bool
doesn'tRespectFirstLaw f@(CJust c x) = fmap id f == CJust (c+1) x

doesn'tRespectSecondLaw :: Eq c => (a -> b) -> (b -> c) -> CMaybe a -> Bool
doesn'tRespectSecondLaw f g o@(CJust c x) = (fmap (g . f) (CJust (c+1) x)) == fmap g (fmap f o)
