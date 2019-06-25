import qualified System.Random as R
import qualified Control.Monad as M (when)
import qualified Data.ByteString as BS
import qualified Data.ByteString.Lazy as BS.L
import qualified System.Environment as Env
-- need to add this package
-- see list of installed pachages: ghc-pkg list random
-- install with cabal install random


-- random :: (RandomGen g, Random a) => g -> (a, g)
-- RandomGen are for sources of randomness
-- Random are for type able to take random values

-- for RandomGen, the default typeis StdGen
-- to manually make a random generator call mkStdGen

basicRandom = R.random (R.mkStdGen 100) :: (Int, R.StdGen) -- needs to precise that its an Int

threeCoins :: R.StdGen -> (Bool, Bool, Bool)
threeCoins gen =
  let (firstCoin, newGen) = R.random gen
      (secondCoin, newGen') = R.random newGen
      (thirdCoin, newGen'') = R.random newGen'
  in (firstCoin, secondCoin, thirdCoin)
-- threeCoins $ R.mkStdGen 100

-- = make a sequence of random numbers = --
fiveRandoms = take 5 $ R.randoms (R.mkStdGen 11) :: [Int]

-- = random number in a range = --
randomDice = R.randomR (1, 6) $ R.mkStdGen 100 :: (Int, R.StdGen)

randomLetters = take 5 $ R.randomRs ('a', 'z') $ R.mkStdGen 100 :: [Char]

-- = get seed from IO = --
randomSeed = R.getStdGen

randomString = do
  gen <- R.getStdGen -- getStdGen will always return the same generator for the same execution
  putStrLn $ take 20 $ R.randomRs ('a', 'z') gen

twoRandomString = do
  gen <- R.getStdGen
  let randomChars = R.randomRs ('a', 'z') gen
      (first20, rest) = splitAt 20 randomChars
      (second20, _) = splitAt 20 randomChars
  putStrLn first20
  putStrLn second20
  
-- another way to handle multiple generations is to use newStdGen
-- it generate to generators from getStdGen, returns one and update getStdGen with the other
twoRandomString' = do
  gen <- R.getStdGen
  putStrLn $ take 20 (R.randomRs ('a', 'z') gen)
  gen' <- R.newStdGen
  putStrLn $ take 20 (R.randomRs ('a', 'z') gen')

guessNumber = do
  gen <- R.getStdGen

  let (randomNumber, _) = R.randomR (1,10) gen :: (Int, R.StdGen)
  putStr "Guess number: "
  numberString <- getLine
  M.when (not $ null numberString) $ do -- if condition true, then given IO action; otherwise IO action "return ()"'
    let number = reads numberString :: [(Int, String)] -- returns an empty list if fails; otherwise returns singleton list
    if not (null number) && randomNumber == fst (head number)
      then putStrLn "Correct"
      else putStrLn $ "Sorry, it was " ++ show number
    R.newStdGen
    guessNumber


-- == ByteString == --
-- allow a more efficient list for manipulating large files
-- a ByteString is an array of characters of size 1B (the type is Word8)
-- Data.ByteString module contains function for a strict byteString
-- Data.ByteString.Lazy module contains function for a lazy byteString (load by chunks of 64K)
-- a large number of functions with lists exists with strict and lazy ByteStrings

-- convert [Word8] to ByteString
packListInByteString listChars = BS.L.pack listChars

unpackByteStringInList byteStream = BS.L.unpack byteStream

fromStrictToLazy strictBS = BS.L.fromChunks strictBS
fromLazyToStrict lazyBS = BS.L.toChunks lazyBS

-- [] equivalent is Empty
-- : equivalent is cons for lazy (always create a new chunk) and cons' for strict, so cons' is better when a lot of insertion is done

-- contains also functions from IO that returns ByteString instead of String
-- readFile for example

copyFile = do
  (filename1:filename2:_) <- Env.getArgs
  contents <- BS.readFile filename1 -- strict ByteString, so read all file and store to memory
  BS.writeFile filename2 contents
