-- === import modules === --

-- to import nothing but the instances of typeclasses
-- instances of typeclasses are always imported
import Prelude ()

-- to import all the functions
import Data.List
-- to import only certain functions
import Data.List (nub, sort)
-- to import all the function but a select few
import Data.List hiding (nub)
-- to import all the functions in a qualified manner
-- Data.Map.filter
import qualified Data.Map
-- to import all the function in a qualified manner with a defined identifier
import qualified Data.Map as M

-- ======= --
import qualified Data.Char as C
import qualified Data.Map as M
import qualified Data.Set as S
-- ======= --

-- to import some of the data constructors
import Control.Applicative (ZipList(ZipList))
-- to import all of the data constructors
import Data.Either (Either(..))


-- to import a module in the ghci:
{-
:m + Data.list Data.Map Data.Set
-}

-- To note: a module can be imported multiple times, to for example directly import the operators and qualified import the functions
