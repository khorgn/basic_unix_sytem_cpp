import Control.Monad.State ( State(..) -- the type to represent a state
                           , runState -- convert a state to a tuple
                           , state -- construct a state from a tuple
                           , MonadState -- acces the MonadState typeclass
                           )
import Control.Monad.State.Class ( get -- access the methods from MonadState
                                 , put
                                 )
import System.Random ( Random(..)  -- a typeclass for types giving results using RandomGen types
                     , RandomGen(..) -- a typeclass for generators
                     , StdGen(..) -- a type for standard generators
                     , random -- evaluates to a tuple with a result and seed from a RandomGen
                     , mkStdGen -- evaluates to an StdGen from an input seed
                     , getStdGen -- evaluates to an StdGen from the process's inner input seed
                     , newStdGen -- getStdGen and replace the process's seed
                     )



-- == Reminder of the problem == --

threeCoinsStateless :: StdGen -> (Bool, Bool, Bool)
threeCoinsStateless gen =
  let (firstCoin, newGen) = random gen
      (secondCoin, newGen') = random newGen
      (thirdCoin, _newGen'') = random newGen'
  in (firstCoin, secondCoin, thirdCoin)

exampleProblem1 = threeCoinsStateless (mkStdGen 11) -- always the same seed
exampleProblem2 = getStdGen >>= \gen -> return $ threeCoinsStateless gen -- seed never changed when called
exampleProblem3 = newStdGen >>= \gen -> return $ threeCoinsStateless gen -- seed changed after being recovered

-- it would be practical to hide the transfert of state in the context of a Monad

-- = intuitions to make the monad = --
--- a stateful computation is of the type: s -> (a, s)
--with s the type of the state and a the result of the computation

-- == naive state implementation == --
-- = Example with stacks = --
type Stack = [Int]

popStateless :: Stack -> (Int, Stack)
popStateless (x:xs) = (x, xs)

pushStateless :: Int -> Stack -> ((), Stack)
pushStateless v xs = ((), v:xs)

exampleStateless1 = stackManip [5,8,2,1] == (5, [8,2,1])
  where
  stackManip :: Stack -> (Int, Stack)
  stackManip stack = let
    ((), newStack1) = pushStateless 3 stack
    (_a, newStack2) = popStateless newStack1
    in popStateless newStack2
-- stacManip is itself a stateful computation, it is a group of statefull computations binded together


-- == The State Monad == --
-- simplified implementation
newtype MyState s a = MyState { runMyState :: s -> (a, s) }

instance Functor (MyState s) where
  -- h :: s -> (a, s)
  -- it :: s -> (b, s)
  fmap f (MyState h) = MyState $ \s0 ->
                                 let (a, s1) = h s0
                                 -- (f a) :: b
                                 in (f a, s1)

instance Applicative (MyState s) where
  pure x = MyState $ \s -> (x, s)
  -- (<*>) :: ((a, s) -> (b, s)) -> (s -> (a, s)) -> (s -> (b, s))
  -- sf :: (b, s) -> (a, (b, s))
  -- sv :: s -> (a, s)
  -- it :: s -> (b, s)
  (MyState sf) <*> (MyState sv) = MyState $ \s0 -> let (f, s1) = sf s0
                                                       (a, s2) = sv s1
                                                   in (f a, s2)

instance Monad (MyState s) where
  return x = MyState $ \s -> (x, s)
  (MyState h) >>= f = MyState $ \s -> let (a, newState) = h s
                                          (MyState g) = f a
                                      in g newState


myPop :: MyState Stack Int
myPop = MyState $ \(x:xs) -> (x,xs)

myPush :: Int -> MyState Stack ()
myPush a = MyState $ \xs -> ((), a:xs)

exampleMyState = runMyState stackManip [4,5,6] == (4,[5,6])
  where
  stackManip :: MyState Stack Int
  stackManip = do
    myPush 3
    a <- myPop
    myPop


-- te actual State implementation doesn't have a State constructor, we need to use the state function instead
peak :: State Stack Int
peak = state $ \xs@(x:_) -> (x, xs)
pop :: State Stack Int
pop = state $ \(x:xs) -> (x, xs)

push :: Int -> State Stack ()
push v = state $ \xs -> ((), v:xs)

exampleState1 = runState stackManip [4,5,6] == (4,[5,6])
  where
  stackManip :: State Stack Int
  stackManip = do
    push 3
    pop -- we don't use the variable so we don't need to bind it
    pop

exampleState2 = runState stackStuff [4,7,11] == ((), [8,3,4,7,11])
  where
  stackStuff = do
    a <- peak
    if a == 5
      then return ()
      else do
        push 3
        push 8

exampleState3 = runState moreStack  [4,5,6] == ((),[5,6])
  where
  stackManip = push 3 >> pop >> pop
  stackStuff = peak >>= \a -> if a == 5 then return () else push 3 >> push 8
  moreStack = do
    a <- stackManip
    if a == 100
      then stackStuff
      else return ()

-- == the Typeclass MonadState == --
-- a typeclass defining state monads
-- it has two methods, get to get the current state as the result, and put to replace the state with a new one

exampleState4 = runState stackyStack [1,2,3] == ((), [8,3,1])
  where
  stackyStack = do
    stackNow <- get
    if stackNow == [1,2,3]
      then put [8,3,1]
      else put [9,2,1]


-- == Randomness with the State monad == --
randomSt :: (RandomGen g, Random a) => State g a
randomSt = state random

threeCoins :: State StdGen (Bool, Bool, Bool)
threeCoins = do
  a <- randomSt
  b <- randomSt
  c <- randomSt
  return (a, b, c)

-- reminder a State contextualize a function, so we give it a StdGen as input
exampleRandom1 = fst (runState threeCoins (mkStdGen 33)) == (True,False,True) 

