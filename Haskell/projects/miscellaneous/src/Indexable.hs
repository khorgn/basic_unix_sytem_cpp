{-# LANGUAGE ConstraintKinds       #-}
{-# LANGUAGE DataKinds             #-}
-- allows us to promote values to the type system
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE ParallelListComp      #-}
{-# LANGUAGE TypeFamilies          #-}
-- allows us to do mapping of types
{-# LANGUAGE TypeOperators         #-}
{-# LANGUAGE UndecidableInstances  #-}

{-
Inspired by:
https://www.reddit.com/r/haskellquestions/comments/db18yc/trying_to_index_a_ndimensional_list/
Disclaimer: I have no idea what I'm doing.
-}

module Indexable ( Indexable
                 , Indexed
                 , indexN
                 , index1
                 , index2
                 , index3
                 , index4
                 , index5
                 ) where



-- import

import           Data.Proxy
import           GHC.TypeLits



-- peano numbers
-- used to define our indexing level, where we need numbers at the type level
-- PZ <=> peano zero, PN <=> peano next
data PN = PZ | PS PN



-- conversion from nats to peano

type family ToPN (n :: Nat) where
  ToPN 0 = 'PZ
  ToPN n = 'PS (ToPN (n-1))



-- indexation recursion

class PNIndexable (n :: PN) a where
  type PNIndexed n a
  indexify :: [Int] -> Proxy n -> a -> PNIndexed n a

instance PNIndexable 'PZ a where
  type PNIndexed 'PZ a = ([Int], a)
  indexify c _ x = (reverse c, x)

instance PNIndexable n a => PNIndexable ('PS n) [a] where
  type PNIndexed ('PS n) [a] = [PNIndexed n a]
  indexify c n v = [indexify (i:c) (prevNat n) p | i <- [0..] | p <- v]
    where prevNat :: Proxy ('PS n) -> Proxy n
          prevNat = const Proxy



-- aliases for natural numbers

type Indexable (n :: Nat) a = PNIndexable (ToPN n) a
type Indexed   (n :: Nat) a = PNIndexed   (ToPN n) a



-- index functions

indexN :: Indexable n a => Proxy n -> a -> Indexed n a
indexN = indexify [] . toPN
  where toPN :: Proxy n -> Proxy (ToPN n)
        toPN = const Proxy

index1 :: Indexable 1 a => a -> Indexed 1 a
index1 = indexN (Proxy :: Proxy 1)

index2 :: Indexable 2 a => a -> Indexed 2 a
index2 = indexN (Proxy :: Proxy 2)

index3 :: Indexable 3 a => a -> Indexed 3 a
index3 = indexN (Proxy :: Proxy 3)

index4 :: Indexable 4 a => a -> Indexed 4 a
index4 = indexN (Proxy :: Proxy 4)

index5 :: Indexable 5 a => a -> Indexed 5 a
index5 = indexN (Proxy :: Proxy 5)
