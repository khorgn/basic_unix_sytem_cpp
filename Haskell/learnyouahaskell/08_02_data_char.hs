-- === Data.Char === --
import qualified Data.Char as C
import Data.Function (on)
import Data.List (groupBy)

-- = predicates = -- 
-- signature: Char -> Bool

-- is a control char (non-displayed char)
isControlChar = C.isControl '\n' -- True
-- is whitespace
isTab = C.isSpace '\t' -- True
isa = C.isLower 'a'
isA = C.isUpper 'A'
isAlphaChar = C.isAlpha 'c'
is9 = C.isAlphaNum '9'
-- is a printable char
isa' = C.isPrint 'a'
is9' = C.isDigit '9'
is7 = C.isOctDigit '7'
isC = C.isHexDigit 'c'
isb = C.isLetter 'b'
-- is a mark char (combines in new letters, such as accents)
-- C.isMark
is3 = C.isNumber '3'
isComma = C.isPunctuation ','
-- isSymbol

isNewLine = C.isSeparator '\n'

-- isAscii

-- isLatin1

-- isAsciiUpper

-- isAsciiLower


-- check if the full string is alphaNum
isallAlphaNum = all C.isAlphaNum "aezr232"
-- implement words
words' = filter (not . any C.isSpace) . groupBy ((==) `on` C.isSpace) $ "AA BB CC DDD"


-- = general category = --
-- characters can be ordered in general categories (space, control, letter, ...)
category = C.generalCategory ' '


-- = conversion = --
convertUpper = C.toUpper 'a'
convertLower = C.toLower 'B'
convertTitle = C.toTitle 'c' -- for most chars, title-case is the same as upper-case
convertDigit = C.digitToInt 'f'
convertDigit' = C.digitToInt '3'
convertInt = C.intToDigit 3
convertInt' = C.intToDigit 15 -- 'f'
onvertCharCode = C.ord 'a' -- 97
convertCharCode' = C.chr 97 -- 'a' 
