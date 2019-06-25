-- == exceptions in IO code == --
-- exceptions can only be handled in monads, and here in IO monad

import System.Environment
import System.IO
import System.Directory

import System.IO.Error (catchIOError, -- function to catch exceptions
                        ioError, -- rethrow the exception
                        isDoesNotExistError, -- predicate
                        isAlreadyExistsError, -- predicate
                        isAlreadyInUseError, -- predicate
                        isEOFError, -- predicate
                        isIllegalOperation, -- predicate
                        isPermissionError, -- predicate
                        isUserError, -- predicate, user-thrown exception
                        userError, -- UserError can be thrown with ioError $ userError "foobar"
                        -- get arguments from exception
                        ioeGetFileName -- get the filename of the exception
                       )

manualChecks = do
  (filename:_) <- getArgs
  fileExists <- doesFileExist filename
  if fileExists
    then do contents <- readFile filename
            putStrLn $ "The file has " ++ show (length (lines contents)) ++ " lines"
    else do putStrLn "The file doesn't exists"

 
-- catchIOError :: IO a -> (IOError -> IO a) -> IO a
useCatch = toTry `catchIOError` handler

toTry :: IO()
toTry = do (filename:_) <- getArgs
           contents <- readFile filename
           putStrLn $ "The file has " ++ show (length (lines contents)) ++ " lines"

handler :: IOError -> IO()
handler e
  | isDoesNotExistError e = case ioeGetFileName e of
                              Just path -> putStrLn $ "The file " ++ path ++ " does not exists"
                              Nothing -> putStrLn "File at unknown location doesn't exists"
  | otherwise = ioError e

-- catchs can be chaines
useCatchs = do toTry1 `catchIOError` handler1
               toTry2 `catchIOError` handler2

toTry1 = undefined
toTry2 = undefined
handler1 = undefined
handler2 = undefined


-- there is Control.Exception for more advanced exception handling
