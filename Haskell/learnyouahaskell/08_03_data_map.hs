import qualified Data.Map as M

-- create a map
newMap = M.fromList [("AAA", 1), ("BBB", 2), ("C", 56)]

-- create an empty map
emptyMap = M.empty

-- insert in a map
newMap2 = M.insert 3 100 M.empty
newMap2' = M.insert 5 600 . M.insert 4 200 . M.insert 3 100 $ M.empty


-- implement fromList
fromList' :: (Ord k) => [(k, v)] -> M.Map k v
fromList' = foldr (\(k, v) acc -> M.insert k v acc) M.empty

-- check if map is empty
isNull = M.null M.empty

-- check size of the map
size = M.size $ M.fromList [(1,1),(2,2),(3,3)]

-- create a map with one entry
singleEntry = M.singleton 3 9 -- fromList [(3,9)]


-- lookup for a value
just5 = M.lookup 1 M.empty -- Nothing


-- check if a key is in the map
isMember = M.member 3 $ M.fromList [(1,1),(2,2),(3,1)] -- True


-- map and filter
mapping = M.map (*100) $ M.fromList [(1,1),(2,2),(3,3)] -- [(1,100),(2,200),(3,300)']


-- convert to a list
list = M.toList . M.insert 9 2 $ M.singleton 4 3


-- get keys and elems
mapKeys = M.keys $ M.singleton 3 4
mapElems = M.elems $ M.singleton 3 4


-- fromList with a function to deal with duplicates
phoneBook =   
    [("betty","555-2938")  
    ,("betty","342-2492")  
    ,("bonnie","452-2928")  
    ,("patsy","493-2928")  
    ,("patsy","943-2929")  
    ,("patsy","827-9162")  
    ,("lucille","205-2928")  
    ,("wendy","939-8282")  
    ,("penny","853-2492")  
    ,("penny","555-2111")  
    ]

-- if two entries have the same key, the values are concatenated
intoMap = M.fromListWith (\number1 number2 -> number1 ++ ", " ++ number2) phoneBook
intoMap' = M.fromListWith (++) $ map (\(k, v) -> (k, [v])) phoneBook

intoMap2 = M.fromListWith max [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]

intoMap3 = M.fromListWith (+) [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]


-- insert with a function to deal with duplicates
addToMap = M.insertWith (+) 3 100 $ M.fromList [(3,4), (5, 103), (6, 339)]

