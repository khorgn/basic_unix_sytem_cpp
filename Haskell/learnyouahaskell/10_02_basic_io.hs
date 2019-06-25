import Data.Char

main = do
  -- bind the result of an IO action to extract the value
  uselessBinding <- putStrLn "Hello, what's your name?"
  name <- getLine
  putStrLn $ "Here is your futur " ++ name ++ ": " ++ tellFortune name
  -- let bindings are sequentials in do notations
  let bigName = map toUpper name
      bigChar = toUpper (head name) : tail name
  -- last IO action can't be binded
  putStrLn $ "see ya " ++ bigChar ++ " or do you prefer " ++ bigName


tellFortune :: String -> String
tellFortune _ = "you will be rich"
