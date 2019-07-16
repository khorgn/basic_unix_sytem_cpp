import Data.Ratio ( Rational(..)
                  , (%)
                  )
import Control.Monad ( join
                     )
import Control.Monad.Fail ( MonadFail(..)
                          )
-- Making a type with probabilities where the sum is 1

examplePrototype = [(3, 0.5), (5, 0.25), (9, 0.25)]
examplePrototypeWithRational = [(3, 1%2), (5,1%4), (9, 1%4)]

newtype Prob a = Prob { getProb :: [(a, Rational)] } deriving Show

exampleProb = Prob examplePrototypeWithRational

instance Functor Prob where
  fmap f (Prob xs) = Prob $ map (\(x, p) -> (f x, p)) xs


exampleFunctor = fmap negate (Prob [(3, 1%2), (5, 1%4), (9, 1%4)])

instance Applicative Prob where
  pure x = Prob ([(x, 1)])
  Prob [] <*> _ = Prob []
  _ <*> Prob [] = Prob []
  Prob (f:fs) <*> Prob xs = let  probMap (fv, fp) (Prob xs) = Prob $ map (\(x, p) -> (fv x, fp * p)) xs
                            in  Prob $ getProb (probMap f (Prob xs)) ++  getProb(Prob fs <*> Prob xs)

exampleApplicative = (+) <$> Prob examplePrototypeWithRational <*> Prob examplePrototypeWithRational


-- defining (>>=) is not easy here
-- reminder that (m >>= f) == (join $ fmap f m)
exampleRecurseProb :: Prob (Prob Char)
exampleRecurseProb = Prob
  [( Prob [('a', 1%2), ('b', 1%2)], 1%4)
  ,( Prob [('c', 1%2), ('d', 1%2)], 3%4)
  ]

flatten :: Prob (Prob a) -> Prob a
-- map multiplies the probabilies but doesn't remove the flatten the list
-- concat flatten the list
flatten (Prob xs) = Prob $ concat $ map (uncurry multAll) xs
  where multAll (Prob innerxs) p = map(\(x,r) -> (x, p*r)) innerxs

exampleFlatten = getProb (flatten exampleRecurseProb) == [('a',1 % 8),('b',1 % 8),('c',3 % 8),('d',3 % 8)]

instance Monad Prob where
  m >>= f = flatten $ fmap f m

instance MonadFail Prob where
  fail _ = Prob []


-- == using monad == --
data Coin = Heads | Tails deriving (Show, Eq)

coin :: Prob Coin
coin = Prob [(Heads, 1%2), (Tails, 1%2)]

loadedCoin :: Prob Coin
loadedCoin = Prob [(Heads, 1%10), (Tails, 9%10)]

flipThree :: Prob Bool
flipThree = do
  a <- coin
  b <- coin
  c <- loadedCoin
  return $ all (==Tails) [a,b,c]
