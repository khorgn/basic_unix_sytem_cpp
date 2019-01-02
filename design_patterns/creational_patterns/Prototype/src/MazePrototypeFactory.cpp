#include "MazePrototypeFactory.hpp"

using namespace prototype::mazeprototype;

Maze* MazePrototypeFactory::make_maze() const
{
    Maze* maze = m_prototypeMaze->clone();
    maze->initialize();
    return maze;
}

Wall* MazePrototypeFactory::make_wall() const
{
    return m_prototypeWall->clone();
}

Room* MazePrototypeFactory::make_room(int roomNumber) const
{
    Room* room = m_prototypeRoom->clone();
    room->initialize(roomNumber);
    return room;
}

Door* MazePrototypeFactory::make_door(Room* room1, Room* room2) const
{
    Door* door = m_prototypeDoor->clone();
    door->initialize(room1, room2);
    return door;
}