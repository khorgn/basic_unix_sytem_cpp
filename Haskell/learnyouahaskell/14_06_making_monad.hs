import Data.Ratio ( Rational(..)
                  , (%)
                  )
-- Making a type with probabilities where the sum is 1

examplePrototype = [(3, 0.5), (5, 0.25), (9, 0.25)]
examplePrototypeWithRational = [(3, 1%2), (5,1%4), (9, 1%4)]

newtype Prob a = Prob { getProb :: [(a, Rational)] } deriving Show

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


instance Monad Prob where
  Prob [] >>= _ = Prob []
  Prob xs >>= f = Prob $ foldr1 (++) (getProb $ fmap f xs)
    where
      s1 = fmap f xs
      s2 = getProb s1
