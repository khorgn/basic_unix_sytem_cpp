-- === Data.Char === --
import qualified Data.Char as C
import Data.Function (on)

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
isComma = isPunctuation ','
-- isSymbol

isNewLine = isSeparator '\n'

-- isAscii

-- isLatin1

-- isAsciiUpper

-- isAsciiLower


-- check if the full string is alphaNum
isallAlphaNum = all isAlphaNum "aezr232"
-- implement words
  words' = filter (not . any isSpace) . groupBy ((==) `on` isSpace) $ "AA BB CC DDD"


-- = general category = --
-- characters can be ordered in general categories (space, control, letter, ...)
category = C.generalCategory ' '


-- = conversion = --
convertUpper = toUpper 'a'
convertLower = toLower 'B'
convertTitle = toTitle 'c' -- for most chars, title-case is the same as upper-case
convertDigit = digitToInt 'f'
convertDigit' = digitToInt '3'
convertInt = intToDigit 3
convertInt = intToDigit 15 -- 'f'
convertCharCode = ord 'a' -- 97
convertCharCode' = chr 97 -- 'a' 
