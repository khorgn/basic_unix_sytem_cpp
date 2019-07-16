import Prelude hiding (fail)
import Data.Ratio ( Rational(..)
                  , (%)
                  )
import Control.Monad ( join
                     )
import Control.Monad.Fail ( MonadFail(..)
                          )
import Data.List ( partition
                 , groupBy
                 , sortBy
                 )
import Data.Map ( fromListWith
                , toList
                )
import Data.Function ( on
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

exampleFlipThree =  getProb flipThree == [(False,1 % 40),(False,9 % 40),(False,1 % 40),(False,9 % 40),(False,1 % 40),(False,9 % 40),(False,1 % 40),(True,9 % 40)]


-- == improve result presentation == --
-- = specific implementation = --
sumProbsBool :: Prob Bool -> Prob Bool
 -- partition a list acording to a predicate
sumProbsBool (Prob probs) = let (trueHalf, falseHalf) = partition (\(x, p) -> x) probs
                                probTrue = sum $ map snd trueHalf
                                probFalse = sum $ map snd falseHalf
                            in Prob $ [(True, probTrue), (False, probFalse)]


-- = generalising = --
sumProbsListConversion :: (Ord a) => Prob a -> Prob a
sumProbsListConversion = Prob
                       -- convert back to list
                       . toList
                       -- convert the list of tuples to a Map, with an aggregator function when there are multiple values for a key
                       -- Ord is because the key in a map must be ordered, and a is the type of the key in the temporary map
                       . fromListWith (+)
                       . getProb


sumProbs :: (Ord a) => Prob a -> Prob a
sumProbs (Prob ps) = 
                   --- sum the elements of each list and bring them back in a Prob
                   Prob . map reduce
                   -- group by comparison between two elements to see them as equal
                   . groupBy ((==) `on` fst)
                   -- sort by ordering between two elements to order them
                   $ sortBy (compare `on` fst)
                   ps
  where reduce = foldr1 (\(b, r) (_, r') -> (b, r+r'))

