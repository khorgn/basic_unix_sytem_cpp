# Lists
* Use `fmap` rather than `map`
* Use `Data.Sequence.Seq`, or `Data.Text.Text`, or `Data.ByteString.ByteString` when needed

# foldl
* Use `foldl'`, foldl will traverse the whole list anyway, so no gain is done with the lazy version

