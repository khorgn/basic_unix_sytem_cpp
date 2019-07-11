-- == Reminders about (->)r == --

-- (->)r is Functor
-- there mapping is the function composition, with f taking the output of g and returning the result
exampleFunctor =  (fmap f g) 8
  where
  f = (*5)
  g = (+3)

-- (->)r is Applicative functor
-- f is a cuntion that passes its input to (*2) and (+10) then add the results
exampleApplicative = f 3 == 19
  where
  f = (+) <$> (*2) <*> (+10)

-- as seen before a function can be seen as a value with a context, its context is that we need to apply the function to something to get the value

-- (->)r is Monad
class Applicative m => MyMonad m where
  (~>>=~) :: m a -> (a -> m b) -> m b
  (~>>~) :: m a -> m b -> m b
  m ~>>~ k = m ~>>=~ \_ -> k
  myReturn :: a -> m a

instance MyMonad ((->)r) where
  myReturn x = \_ -> x
  -- when we feed a function to another function, the result is a function, hence why the result is a lambda
  --we get the value isolated from the monadic value h and then apply f to it
  --We apply h to w to get the result from the function. f is also a function so we apply w again to get the result
  h ~>>=~ f = \w -> f (h w) w

exampleMonad1 :: Int -> Int
exampleMonad1 = do
  a <- (*2)
  b <- (+10)
  return (a+b)
-- same computation as the applicative version
-- a and b get the input and apply to it. return(a+b) does it as well but ignore the input

exampleNoMonad1 :: Int -> Int
exampleNoMonad1 x = let
  a = (*2) x
  b = (+10) x
  in a+b


-- the reader monad allow us to treat functions as values with context, we can act as if we already know what the functions will return
-- It can be very uselfull when a lot of functions are missing the same parameter and will be applied to the same thing in the end

