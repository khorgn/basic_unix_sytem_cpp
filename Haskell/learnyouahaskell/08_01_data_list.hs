-- === Data.List === --
import qualified Data.List as L
import Data.Function (on)


numUniques :: (Eq a) => [a] -> Int
-- nub removes duplicates from a list
numUniques = length . nub

-- equivalent to \xs length (nub xs)
-- a lot of functions in Prelude comes from it (map, filter)
-- can be safely imported into Prelude
dotSeparated1 = L.intersperse '.' "ABCDE" -- "A.B.C.D.E"
dotSeparated2 = L.intersperse 0 [1,2,3,4] -- [1,0,2,0,3,0,4]

sentence1 = L.intercalate " " ["hey", "there", "guys"] -- "hey there guys"
sentence2 = L.intercalate [0,0,0] [[1,2,3],[4,5,6],[7,8,9]] -- [1,2,3,0,0,0,4,5,6,0,0,0,7,8,9]

transposed1 = L.transpose [[1,2,3], [4,5,6], [7,8,9]] -- [[1,4,7], [2,5,8], [3,6,9]]
transposed2 = L.transpose ["hey", "there" ,"guys"] -- ["htg", "ehu", "yey", "rs", "e"]

-- foldl' and foldl1' are strict versions of foldl and foldl1 to prevent stack overflows with very long lists


concatenated1 = L.concat ["foo", "bar", "car"] -- "foobarcar"
concatenated2 = L.concat [[3,4,5],[2,3,4],[2,1,1]] -- [3,4,5,2,3,4,2,1,1]

mapThenConcat = L.concatMap (replicate 4)[1..3] -- [1,1,1,1,2,2,2,2,3,3,3,3]

-- all the list must contain True
andTrue1 = L.and $ map (>4) [5,6,7,8] -- True
andTrue2 = L.and $ map (==4) [4,4,4,3,4] -- False

-- at least one element in the list must contain True
orTrue1 = L.or $ map (==4) [2,3,4,5,6,1] -- True
orTrue2 = L.or $ map (>4) [1,2,3] -- False

anyTrue1 = L.any (==4) [2,3,4,5,6,1,4] -- True
allTrue1 = L.all (>4) [6,9,10] -- True

iterateOver1 = take 10 $ L.iterate (*2) 1 -- [1,2,4,8,16,32,64,128,256,512]

splitAt3 = L.splitAt 3 "heyman" -- ("hey", "man")
splitAt10 = L.splitAt 100 "heyman" -- ("heyman", "")

takeWhileInferior = L.takeWhile (>3) [6,5,5,5,5,4,2,3,4] -- [6,5,5,5,5,4]

dropWhileNotSpace = dropWhile (/=' ') "This is a sentence" -- " is a sentence"

-- similar to takewhile
spanOfNotSpace = let (fw, rest) = span (/=' ') "This is a sentence" in "First word: " ++ fw ++ ", the rest: " ++ rest -- First word: This, the rest: is a  sentence

-- similar to span not predicate
breakOfEqual = break (==4) [1,2,3,4,3,2] -- ([1,2,3],[4,3,2])

sortedList = L.sort [8,5,3,2,1,6,4,2] -- [1,2,2,3,4,5,6,8]

groupedList = L.group [1,1,1,1,2,2,2,2,2,3,3,2,2,2,5,6,7] -- [[1,1,1,1],[2,2,2,2,2],[3,3],[2,2,2],[5],[6],[7]]

listInits = L.inits "ABCDE" -- ["", "A", "AB", "ABC", "ABCD", "ABCDE"]
listTails = L.tails "ABCDE" -- ["ABCDE", "BCDE", "CDE", "DE", "E", ""]

-- search a sublist in a list
search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack =
  let nlen = length needle
  -- transform the list in a list of list with the start of each list corresponding to the next index in the original list
  -- the take the first nlen elements in the sublist and check if it's equal to the list searched
  -- it will pass all the elements thanks to tails
  in  foldl (\acc x -> if take nlen x == needle then True else acc) False (tails haystack)

-- equivalent to search
catIsInText1 = "cat" `L.isInfixOf` "im a cat burglar"
-- search at the head of the end of the list
catIsInText2 = "cat" `L.isPrefixOf` "cat burglar"
-- search at the last of the end of the list
catIsInText3 = "cat" `L.isSuffixOf` "what a cute cat"


isElementInList = 4 `L.elem` [2,3,4,4] -- True
isNotElementInList = 5 `L.notElem` [2,3,4] -- True
indexElementInList = 4 `L.elemIndex` [2,3,4,4] -- Just 2
indicesElementInList = 4 `L.elemIndices` [2,3,4,4] -- [2,3]


partitionOfUppercases = L.partition (`elem` ['A'..'Z']) "BOBsidneyMORGANeddy" -- ("BOBMORGAN", "sidneyeddy")
-- different from span and break because it does all the list, doesn't stop when predicate become True/False



firstElementMoreThan4 = L.find (>4) [1,2,3,4,5,6] -- Just 5
indexFirstElementMoreThan4 = findIndex (>4) [1,2,3,4,5,6] -- Just 5

-- zip3..zip7 and zipWith3..zipWith7 exists for zipping n lists in n tuple or with functions taking n arguments


listLines = L.lines "first line\nsecond line\nthird line" -- ["first line", "second line", "third line"]
unlistLines = L.unlines ["first line", "second line", "third line"] -- "first line\nsecond line\nthird line" 

listWords = L.words "foo bar toto" -- ["foo", "bar", "toto"]
unlistWords = L.unwords ["foo", "bar", "toto"] -- "foo bar toto"

deleteFirsth = delete 'h' "hello hugo" -- "ello hugo"

-- remove all occurences of elements from the right list in the left list
differenceLists = [1..10] L.\\ [2,5,9] -- [1,3,4,6,7,8,10]

-- appends to thefirst list every element of the second list not already present (only once for each value)
unionOfTwoLists = [1..7] `L.union` [5..10] -- [1,2,3,4,5,6,7,8,9,10]

intersectOfTwoLists = [1..7] `L.intersect` [5..10] -- [5,6,7]

insert4 = L.insert 4 [1,3,2,4,5,2,1] -- [1,3,2,4,4,5,2,1]

-- for historical reason, theses functions takes an Int instead of an Intergral or Num
-- length, take, drop, splitAt, !!, replicate
-- there exists generic equivalents
gLength = L.genericLength
gTake = L.genericTake
gDrop = L.genericDrop
gSplitAt = L.genericSplitAt
g!!s = L.genericIndex
gReplicate = L.genericReplicate


-- general versions for nub, delete, union, intersect, group
-- nubBy, deleteBy, unionBy, intersectBy, groupBy
-- they take a predicate instead of testing (==)
groupedByPassing0 =
  let values = [-4.3, -2.4, -1.2, 0.4, 2.3, 5.9, 10.5, 29.1, 5.3, -2.4, -14.5, 2.9, 2.3]
  in groupBy (\x y -> (x > 0) == (y > 0)) values -- [[-4.3,-2.4,-1.2],[0.4,2.3,5.9,10.5,29.1,5.3],[-2.4,-14.5],[2.9,2.3]]
-- (\x y -> (x > 0) == (y > 0)) is equivalent to ((==) `on` (> 0))

-- general versions for sort, insert, maximum, minimum
-- sortBy, insertBy, maximumBy, minimumBy
-- they take a function returning an Ordering (LT, EQ, GT) instead of testing (compare)
sortedByLength =
  let xs = [[5,4,5,4,4],[1,2,3],[3,5,4,3],[],[2],[2,2]]
  in sortBy (\x y ->length x `compare` length y) xs -- [[],[2],[2,2],[1,2,3],[3,5,4,3],[5,4,5,4,4]]
-- (\x y -> length x `compare` length y) is equivalent to (compare `on` length)
