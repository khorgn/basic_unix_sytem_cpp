import Control.Monad
import qualified Data.Char as C
-- loop until a whiteline is entered, and inverse the line content
main = do
  line <- getLine
  if null line
    -- return only wrap in IO and execute the action, it doesn't stop execution of the function
    then return ()
    -- equivalent to
    -- else do (...\n...) its all one IO action
    else do
      putStrLn $ reverseWords line
      main

reverseWords :: String -> String
-- unwords: takes a list of strings and returns a string with space separator
-- words: takes a string with words separated by spaces and returns a list of strings
reverseWords = unwords . map reverse . words

  

-- -= IO functions == --
-- putStrLn, putStr, putChar, print (equivalent to putStrLn . show)
-- getChar, getLine


-- = sequence = --
withoutSequence = do
  a <- getLine
  b <- getLine
  c <- getLine
  print [a,b,c]
-- is equivalent to
withSequence = do
  rs <- sequence [getLine, getLine, getLine]
  print rs

-- usefull with mapping IO functions
onlyMap = map print [1,2,3] -- evaluates to [print 1, print 2, print 3], it didn't execute the actions
sequenceOfMap = sequence $ map print [1,2,3] -- executes them

-- mapM and mapM_ => map and then sequences the IO actions list
-- mapM_ => discard the result of the IO actions list, returns IO()
withMap = mapM print [1,2,3]

-- = Control.Monad = --
-- when, equivalent to if condition then IO action else return ()

-- forever, takes an IO action and returns an IO action that repeats the IO action forever
foreverLoop = forever $ do
  putStr "Give me some input: "
  l <- getLine
  putStrLn $ map C.toUpper l

-- forM => like mapM, with its arguments inverted
-- forM [1,2,3] print
-- allows to use do notation easily
withForM = do
  colors <- forM [1,2,3,4] (\a -> do
    putStrLn $ "Associate a color to this number: " ++ show a ++ "?"
    color <- getLine
    -- this line is not necessary, getLine already returns an IO color, while this line wraps an unwrapped color
    return color)
  putStrLn "The colors you asscociate with 1, 2, 3, and 4 are: "
  mapM putStrLn colors

  
