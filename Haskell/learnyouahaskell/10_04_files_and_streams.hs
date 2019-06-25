import qualified Data.Char
import qualified System.IO
import qualified Data.List
import qualified System.Directory
-- == main == --
main = respondIsPalindrome

-- == reading stdin and writing stdout == --

-- getChar, getLine works on char and line in stdin
-- getContents recover the content of stdin until end-of-file character (cat foo.txt | executable)
-- also works like forever with getLine as long as every line is treaded the same

withForeverGetLine = do
  l <- getLine
  putStr $ map Data.Char.toUpper l
-- similar to
-- content works in interactive because of the laziness of haskell, it handles the content line by line
withGetContents = do
  contents <- getContents
  putStr $ map Data.Char.toUpper contents

printOnlyShortLines = do
  contents <- getContents
  putStr $ shortLinesOnly contents

shortLinesOnly input =
  let allLines = lines input
      shortLines = filter (\a -> length a >= 10) allLines
      result = unlines shortLines
  in result

-- interact is a function to shorten the pattern of getting content from stdin, use a function on it, and send result to stdout
withInteract = interact shortLinesOnly -- run the function on stdin, and print the result to stdout
withInteract2 = interact $ unlines . filter ((>=10) . length) . lines

-- can be used in interactive, or in pipes
-- loop and tells the user is the entered text is a palindrome
respondIsPalindrome = interact $ unlines . map ((\b -> if b then "palindrome" else "not palindrome") . (isPalindrome)) . lines

isPalindrome' :: Eq a => [a] -> Bool
isPalindrome' [] = True
isPalindrome' [x] = True
isPalindrome' (x:xs) = x == (head . reverse) xs && (isPalindrome . init) xs

isPalindrome :: Eq a => [a] -> Bool
isPalindrome x = x == reverse x


-- == writing to files == --
cat = do
  handle <- System.IO.openFile "10_04_example_file.txt" System.IO.ReadMode -- openFile to create an handle
  contents <- System.IO.hGetContents handle -- hGet to get content from the handle
  -- "getContents" is similar to "IO.hGetContents IO.stdin"
  putStr contents
  System.IO.hClose handle -- hClose to close the handle

cat2 = do
  System.IO.withFile "10_04_example_file.txt" System.IO.ReadMode (\handle -> do
    contents <- System.IO.hGetContents handle
    putStr contents
    )

-- there is also hGetLine, hPutStr, hPutStrLn, hGetChar, ...

directlyReadFile = do
  -- open the file, get the content and close the handle (still done lazily)
  contents <- System.IO.readFile "10_04_example_file.txt"
  putStr contents

directlyWriteFile = do
  contents <- System.IO.readFile "10_04_example_file.txt"
  -- write the given string in the given file
  System.IO.writeFile "10_04_example_file2.txt" (map Data.Char.toUpper contents)

directlyAppendFile = do
  contents <- System.IO.readFile "10_04_example_file.txt"
  System.IO.appendFile "10_04_example_file2.txt" (contents ++ reverse contents)
  


setBufferingToo = do
  System.IO.withFile "10_04_example_file.txt" System.IO.ReadMode (\handle -> do
    -- set the buffering to blocks of 2048 bits, if Nothing then OS chooses the size of the blocks
    System.IO.hSetBuffering handle $ System.IO.BlockBuffering(Just 2048)
    contents <- System.IO.hGetContents handle
    putStr contents
    )
  
-- we can also use hFlush to manually flush the data



addToTodoList = do
  todoItem <- getLine
  System.IO.appendFile "10_04_example_todo_file.txt" (todoItem ++ "\n")

removeToTodoList = do
  handle <- System.IO.openFile "10_04_example_todo_file.txt" System.IO.ReadMode
  -- create a temporary file at the given path (template name "temp" plus a random number)
  -- could also use System.Directory.getCurrentDirectory for "."
  (tempName, tempHandle)  <- System.IO.openTempFile "." "temp"
  contents <- System.IO.hGetContents handle
  -- todoTasks :: [String]
  let todoTasks = lines contents
      -- numberedTasks :: [string]
      numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
  putStrLn "These are your TO-DO items:"
  putStr $ unlines numberedTasks
  -- equivalent to
  -- mapM putStrLn numberedTasks
  putStrLn "Which one do you want to delete?"
  numberString <- getLine
  -- number :: Integer
  let number = read numberString
      -- newTodoItems :: [String]
      newTodoItems = Data.List.delete (todoTasks !! number) todoTasks
  -- write in temp file the new tasks
  System.IO.hPutStr tempHandle $ unlines newTodoItems
  System.IO.hClose handle
  System.IO.hClose tempHandle
  System.Directory.removeFile "todo.txt"
  System.Directory.renameFile tempName "todo.txt"
 
