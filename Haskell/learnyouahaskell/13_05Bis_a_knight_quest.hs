import qualified  Control.Monad as M
import qualified Data.List as L

type KnightPos = (Int, Int)

moveKnightDo :: KnightPos -> [KnightPos]
moveKnightDo (c, r) = do
  -- in monadic context, a list is a superposition of possible results
  (c', r') <- [(c+2, r-1), (c+2, r+1), (c-2, r-1), (c-2, r+1)
            , (c+1, r-2), (c+1, r+2), (c-1, r-2), (c-1, r+2)
            ]
  -- guards requires MonadPlus, which are Monads that are also Monoids, like Lists
  M.guard(c' `elem` [1..8] && r' `elem` [1..8])
  -- return here return the group of possible results in a list: [[1], [2,], ...] which is concat to [1, 2, ...]
  return (c', r')

moveKnightListComprehension :: KnightPos -> [KnightPos]
moveKnightListComprehension (c, r) = [(c', r') |
                                      (c', r') <- [(c+2, r-1), (c+2, r+1), (c-2, r-1), (c-2, r+1)
                                                  , (c+1, r-2), (c+1, r+2), (c-1, r-2), (c-1, r+2)
                                                  ]
                                      , c' `elem` [1..8] && r' `elem` [1..8]]

moveKnightBind :: KnightPos -> [KnightPos]
moveKnightBind (c, r) = 
  [(c+2, r-1), (c+2, r+1), (c-2, r-1), (c-2, r+1)
  , (c+1, r-2), (c+1, r+2), (c-1, r-2), (c-1, r+2)
  ] >>= \p'@(c', r') -> M.guard (onBoard p')
  >> return (c', r')
  where onBoard (c, r) = c `elem` [1..8] && r `elem` [1..8]

moveKnightFilter :: KnightPos -> [KnightPos]
moveKnightFilter (c, r) = filter onBoard
  [(c+2, r-1), (c+2, r+1), (c-2, r-1), (c-2, r+1)
  , (c+1, r-2), (c+1, r+2), (c-1, r-2), (c-1, r+2)
  ]
  where onBoard (c, r) = c `elem` [1..8] && r `elem` [1..8]

moveKnight = moveKnightDo

in3 :: KnightPos -> [KnightPos]
in3 start = return start >>= moveKnight >>= moveKnight >>= moveKnight
  -- nub removes duplicates
  where
        cleanup :: [KnightPos] -> [KnightPos]
        cleanup = L.sort . L.nub

cleanIn3 :: KnightPos -> [KnightPos]
cleanIn3 = (L.sort . L.nub . in3)

canReachIn3 :: KnightPos -> KnightPos -> Bool
canReachIn3 start end = end `elem` in3 start
--
-- improvements: give the moves to reach it with a Maybe
-- improvements using monadic composition (see 14_05)
inMany :: Int -> KnightPos -> [KnightPos]
-- replicate returns a list of size x of moverKnight functions
inMany x start = return start >>= foldr (M.<=<) return (replicate x moveKnight)

canReachIn :: Int -> KnightPos -> KnightPos -> Bool
canReachIn x start end = end `elem` inMany x start

