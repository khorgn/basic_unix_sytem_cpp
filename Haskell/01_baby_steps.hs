-- in ghci, run :l doubleMe.hs to load the file, and :r to reload it

doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
then x
else x*2

-- ' is a valid character
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1

-- a difinition (function with no parameters)
hello = "Hello World!"
-- in ghci, let <definition> = <value> allows to define like here in scripts

numbers = [4, 8, 15, 16, 23, 42]

sameAsString = ['H', 'e', 'l', 'l', 'o', ' ', 'W', 'o', 'r', 'l', 'd', '!']

concatTwoStrings l1 l2 = l1 ++ l2
-- can also call it with "AA" `concatTwoStrings` "BB"

insertAtStart char list = char : list

syntaxicSugarList = [1, 2,3]
realDefinitionOfAList = 1:2:3:[]

getElementAt list index = list !! index

areDifferents x y = x/= y

getFirstElement list = head list
getAllButFirstElement list = tail list
getLastElement list = last list
getAllButLastElement list = init list
getLenghtList list = length list
isListEmpty list = null list -- [] is the empty list
reverseList list = reverse list
takeElementsFromStart list elementNumber = take elementNumber list
dropElementsFromStart list elementNumber = drop elementNumber list
maximumInList list = maximum list
minimumInList list = minimum list
sumOfList list = sum list
productOfList list = product list
isElementInList element list = element `elem` list

list20Numbers = [1..20]
invertedlist20Numbers = [20,19..1]
alphabet = ['a'..'z']
list20EvenNumber = [2,4..20]

first24MultipleOf13 = take 24 [13,26..]

first10ElementsOfACycle = take 10 (cycle [1,2,3])
first10RepetitionsOf5 = take 10 (repeat 5)
replicate10threeTimes = replicate 3 10

-- listComprehension
listComprehension1 = [x*2 | x <- [1..10], x*2 >= 12]
--    output function ^   input set^      ^predicat
listComprehension2 = [x | x <- [50..100], x `mod` 7 == 3]
listComprehension3 = [if x < 10 then "A" else "B" | x <- [7..13], odd x]
listComprehension4 = [x | x <- [10..20], x /= 13, x /= 15, x /= 19]
listComprehension5 = [x*y | x <- [2, 5, 10], y <- [8, 10, 11], x*y > 50]

listComprehensionLength xs = sum [ 1 | _ <- xs]

aTuple = ("A", 1)

zipTogetherLists = zip [1,2..] [5,5,5,5,5]
-- returns [(1,5), (2,5), (3,5), (4,5), (5,5)]


show' = show 3 -- returns "3"
read' = read "3" + 1 -- returns True
