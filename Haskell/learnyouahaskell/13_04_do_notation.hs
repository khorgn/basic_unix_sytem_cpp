-- syntaxic sugar for >>= and >>

exampleWithoutDoNotation1 = ( Just 3 >>= (\x -> Just "!" >>= (\y -> Just (show x ++ y))) ) == Just "3!"

exampleWithoutDoNotation1BetterAlined = routine == Just "3!"
  where
    routine =
       Just 3 >>= (\x ->
       Just "!" >>= (\y ->
       Just (show x ++ y)))


exampleWithDoNotation1 = routine == Just "3!"
  where
    routine = do
      x <- Just 3
      y <- Just "!"
      Just (show x ++ y)

-- reminder that even though it looks like imperative code, it is still just sequential evaluation with bind, and depends on the previous value evaluated

exampleWithoutDoNotation2 = ( Just 3 >>= (\x -> Nothing >>= (\y -> Just "!" >>= \z -> Just (show x ++ y ++ z))) ) == Just "3!"

exampleWithDoNotation2 = routine == Nothing
  where
    routine = do
      x <- Just 3
      y <- Nothing
      z <- Just "!"
      Just (show x ++ y ++ z)

exampleWithoutDoNotation2' = ( Just 3 >>= (\x -> Nothing >>= (\_ -> Just "!" >>= \z -> Just (show x ++ z))) ) == Nothing

exampleWithDoNotation2' = routine == Nothing
  where
    routine = do
      x <- Just 3
      _ <- Nothing
      z <- Just "!"
      Just (show x ++ z)


exampleWithoutDoNotation2'' = ( Just 3 >>= (\x -> Nothing >> Just "!" >>= \z -> Just (show x ++ z)) ) == Nothing

exampleWithDoNotation2'' = routine == Nothing
  where
    routine = do
      x <- Just 3
      Nothing
      z <- Just "!"
      Just (show x ++ z)


-- == Do notation and pattern matching == --

examplePatternMatching1 = routine == Just 'h'
  where
    routine = do
      (x:xs) <- Just "hello"
      return x

-- failing a match in let expressions throw a runtime error, failing a match with do calls the fail function, who evaluates to Nothing for Maybe
examplePatternMatching2 = routine == fail "whatever" && routine == Nothing
  where
    routine = do
      (x:xs) <- Just ""
      return x


