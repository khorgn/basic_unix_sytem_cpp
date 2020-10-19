module BaseModel where


-- | The state of the cell
data CellState
  = Alive -- ^ The cell is alive
  | Dead -- ^ The cell is dead
  deriving (Show, Eq, Ord)

data Coordinate = Coordinate { getYCoord :: Int, getXCoord :: Int } deriving (Show, Eq, Ord)

coordinate :: Int -> Int -> Coordinate
coordinate x y = Coordinate x y

data Cell = Cell { getCoordinate :: Coordinate, getCellState :: CellState } deriving (Show, Eq, Ord)


-- | Change cell state depending on the number of alive neighbors
changeCell :: Int -- ^ The number of alive neigbbors
           -> Cell -- ^ The cell whose state must be updated
           -> Cell -- ^ The cell with the updated state
changeCell 3 (Cell c Dead) = Cell c Alive
changeCell _n (Cell c Dead) = Cell c Dead
changeCell n (Cell c Alive)
  | n `elem` [2, 3] = Cell c Alive
  | otherwise = Cell c Dead