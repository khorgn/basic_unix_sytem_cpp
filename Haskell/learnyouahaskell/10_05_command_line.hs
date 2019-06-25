import qualified System.Environment -- doesn't clash with prelude
import qualified Data.List
import qualified System.Directory
import qualified System.IO

-- == main == --
main = basicsCLI

-- == Get program name and CL arguments == --
basicsCLI :: IO()
basicsCLI = do
  args <- System.Environment.getArgs
  progname <- System.Environment.getProgName
  putStrLn "The arguments are:"
  mapM putStrLn args
  putStrLn "The program name is:"
  putStrLn progname


-- = Example with todo program = --
-- association list used with the program
todoCLI = do
  (command:args) <- System.Environment.getArgs
  -- lookup :: Eq a => a -> [(a, b)] -> Maybe b
  let (Just action) = lookup command dispatch
  action args

dispatch :: [(String, [String] -> IO())]
dispatch = [ ("add", add)
           , ("view", view)
           , ("remove", remove)
           ]


add :: [String] -> IO()
add [filename, task] = System.IO.appendFile filename (task ++ "\n")
view :: [String] -> IO()
view [filename] = do
  content <- System.IO.readFile filename
  let todoTasks = lines content
      numberedTasks = zipWith (\n line -> show n++" - "++line) [0..] todoTasks
  putStrLn $ unlines numberedTasks
remove :: [String] -> IO()
remove [filename, numberString] = do
  handle <- System.IO.openFile filename System.IO.ReadMode
  (tempName, tempHandle) <- System.IO.openTempFile "." "temp"
  contents <- System.IO.hGetContents handle
  let number = read numberString
      todoTasks = lines contents
      -- remove the n-th element
      -- newTodoTasks = take (number) todoTasks ++ drop (number+1) todoTasks
      -- other possibility
      -- splitAt evaluates as a tuple of lists, and uncurry allows to use function arguments on tuple
      newTodoTasks = uncurry (\a b -> a ++ tail b) $ splitAt number newTodoTasks
  System.IO.hPutStr tempHandle $ unlines newTodoTasks
  System.IO.hClose handle
  System.IO.hClose tempHandle
  System.Directory.removeFile filename
  System.Directory.renameFile tempName filename
  
