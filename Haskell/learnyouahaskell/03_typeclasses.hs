-- typeclasses defines preperies that types can have, similar to interfaces

-- signature of ==
-- :t (==)
-- (==) :: (Eq a) => a -> a -> Bool
-- the type variable a must be part of the typeclass Eq

-- functions only made of special characters are infix by default, to call :t on them when need to call them as prefix, with parentheses



read' = read "5" :: Int
