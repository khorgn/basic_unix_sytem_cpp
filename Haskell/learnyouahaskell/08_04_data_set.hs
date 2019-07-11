import qualified Data.Set as S
-- similar to maps with keys only
-- checking membership, inserting, deleting, etc. is much faster in sets than in lists
-- elements in a set must be of typeclass Ord

text1 = "I just had an anime dream. Anime... Reality... Are they so different?"  
text2 = "The old man left his garbage can out and now his trash is all over my lawn!" 

-- convert a set to a list
set1 = S.fromList text1 -- fromList " .?AIRadefhijlmnorstuy"
set2 = S.fromList text2 -- fromList " !Tabcdefghilmnorstuvwy"

-- get the common elements between two sets
interSet = S.intersection set1 set2 -- fromList " adefhilmnorstuy"

-- get the elements in set A not in set B
relativeComplement1 = S.difference set1 set2 -- fromList ".?AIRj"
relativeComplement2 = S.difference set2 set1 -- fromList "!Tbcgvw"

-- get elements in both sets
unionSet = S.union set1 set2 -- fromList " !.?AIRTabcdefghijlmnorstuvwy"

-- check if set A is a subset of B (less or equal)
aIsSubsetOfB1 = S.fromList [2, 3, 4] `S.isSubsetOf` S.fromList [1, 2, 3, 4, 5] -- True
-- check if set A is a proper subset of B (less)
aIsSubsetOfB1 = S.fromList [2, 3, 4] `S.isProperSubsetOf` S.fromList [2, 3, 4] -- False

-- null, size, member, empty, singleton, insert, delete works similarly as in List
-- idem for map and filter

-- convert a set to a list
backToList = S.toList $ S.singleton 3

-- to remove the duplicates from a list, one can use nub or pass by a set
noDuplicates1 = nub "AERBCAB" -- "AERBC"
noDuplicates2 = S.toList $ S.fromList "AERBCAB" -- "ABCER"
-- using a Set is faster than nub for long lists, but requires the type to implement Ord and will be sorted
-- using nub is slower for long lists, but only requires Eq, and keep the original order

