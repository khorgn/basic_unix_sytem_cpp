module Board where

sizeY = 10
sizeX = 10

type CoordY = Integer
type CoordX = Integer
newtype Position = Position {getPosition :: (CoordY, CoordX)} deriving (Eq, Show)

data Direction = North | South | West | East deriving (Eq, Show)

type BoardState = [Position]


moveAlone :: Direction -> Integer -> Position -> Position
moveAlone dir steps pos = Position (newCY, newCX)
  where (cY, cX) = getPosition pos
        getIf pred def v = if pred v then v else def
        inBoardY y = y >= 0 && y < sizeY
        inBoardX x = x >= 0 && x < sizeX
        (newCY, newCX) = case dir of
                         North -> (getIf inBoardY 0 (cY - steps), cX)
                         South -> (getIf inBoardY (sizeY - 1) (cY + steps), cX)
                         West -> (cY, getIf inBoardX 0 (cX - steps))
                         East -> (cY, getIf inBoardX (sizeX - 1) (cX + steps))

move state dir steps pos = if elem c state then undefined else p
  where p@(Position c) = moveAlone dir steps pos
