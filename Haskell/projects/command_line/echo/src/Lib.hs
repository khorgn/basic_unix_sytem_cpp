module Lib
    ( parseArgs
    , Options(..)
    , Flags(..)
    , Flag(..)
    , Content(..)
    ) where

type Content = String
type Flags = [Flag]
data Flag = NO_TRAIL | ENABLE_ESCAPE

data Options = Options {optionsGetContent :: Content, optionsGetFlags :: Flags}

parseArgs :: [String] -> Maybe Options
parseArgs [] = Nothing
parseArgs [a] = Just $ Options a []
