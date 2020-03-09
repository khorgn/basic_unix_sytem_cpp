module Lib
    
    where

import qualified Data.Map.Strict as Map
import Data.Maybe ( fromMaybe
                  )
import Data.Char ( toUpper
                 )
import System.Random

someFunc :: IO ()
someFunc = putStrLn "someFunc"

type DecodedMessage = String
newtype EncodedMessage = EncodedMessage String

data LanguageModel = LanguageModel
  { languageModel_unigrams :: Map.Map Char Double
  , languageModel_bigrams :: Map.Map Char Double
  } deriving (Show, Eq)

type Cipher = Map.Map Char Char

encode_message :: Cipher -> DecodedMessage -> EncodedMessage
encode_message c m = EncodedMessage $ map convert_letter m
  where convert_letter l =  fromMaybe l $ Map.lookup l c

decode_message :: Cipher -> EncodedMessage -> DecodedMessage
decode_message c (EncodedMessage m) = map convert_letter m
  where convert_letter l = fromMaybe l $ Map.lookup l inverted_cipher
        inverted_cipher = Map.fromList $ map (\(k, v) -> (v, k)) $ Map.toList c


cipher_from_dna_string :: String -> Cipher
cipher_from_dna_string dna = Map.fromAscList $ zip keys $ map toUpper dna
  where keys = ['A'..'Z']

