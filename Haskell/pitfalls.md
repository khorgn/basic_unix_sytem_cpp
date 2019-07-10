# Lists
* Use `fmap` rather than `map`
* Use `Data.Sequence.Seq`, or `Data.Text.Text`, or `Data.ByteString.ByteString` when needed
  * Use typesclasses Foldable and Traversable (Foldable+Functor)
* If the list cannot be empty, use `data Data.List.NonEmpty a = a :| [a]` or `data List a = Single a | Cons a (List a)` or `Data.List.Extras.list :: (a -> [a] -> b) -> b -> [a] -> b)`
* Don't use `length` on long list if you don't need to know the exact length use `Data.List.Extras.LazyLength.lengthBound :: Int -> (Int -> Int -> a) -> [b] -> a` or `Data.List.Extras.LazyLength.lengthCompare :: [a] -> [b] -> Ordering` 

# foldl
* Use `foldl'`, foldl will traverse the whole list anyway, so no gain is done with the lazy version

