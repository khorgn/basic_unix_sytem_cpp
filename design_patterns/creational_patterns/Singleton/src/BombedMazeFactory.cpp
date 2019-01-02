#include "BombedMazeFactory.hpp"


#include "BombedWall.hpp"
#include "RoomWithABomb.hpp"

using namespace singleton::mazesingleton;

Wall* BombedMazeFactory::make_wall() const
{
    return new BombedWall;
}

Room* BombedMazeFactory::make_room(int roomNumber) const
{
    return new RoomWithABomb(roomNumber);
}