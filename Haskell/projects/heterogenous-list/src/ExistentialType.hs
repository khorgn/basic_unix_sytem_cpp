{-# LANGUAGE ExplicitForAll, ExistentialQuantification, GADTs #-}

module ExistentialType where

import Data.Typeable ( cast -- cast the variable to (Maybe <type>)
                     , typeOf -- gives the type of a variable
                     , Typeable -- typeclass expressing that a type can be checked
                     )
import Data.Maybe ( fromJust )

data Foo = F deriving (Show, Eq)
data Bar = B deriving (Show, Eq)

-- two ways to write existential types
-- with the ExplicitForAll and ExistentialQuantification extensions
data Showable = forall s. Show s => Showable s
-- with the GADTs extension
data Showable' where
  Showable' :: Show s => s -> Showable'

instance Show Showable where
  show (Showable s) = show s

data AnyShowEq = forall s. (Show s, Typeable s, Eq s) => AS s
instance Show AnyShowEq where
  show (AS s) = show s
instance Eq AnyShowEq where
  (AS x) == (AS y) = if typeOf x == typeOf y
                     then x == fromJust (cast y)
                     else False


stuffShowable :: [Showable]
stuffShowable = [Showable F, Showable B]

stuffAnyShowEq :: [AnyShowEq]
stuffAnyShowEq = [AS F, AS B]

{-
 - Tends to be seen as anti-pattern, they are leftover from OO design,
 - and most of the time it is better to use a merged type or a sum type
 -}
