#include "StandardMazeBuilder.hpp"
#include "Wall.hpp"
#include "Door.hpp"

using ::builder::mazebuilder::StandardMazeBuilder;
using ::builder::mazebuilder::Room;

StandardMazeBuilder::~StandardMazeBuilder()
{
    if(m_maze != nullptr)
    {
        delete(m_maze);
    }
}

void StandardMazeBuilder::build_maze()
{
    m_maze = new Maze;
}

void StandardMazeBuilder::build_room(int roomNumber)
{
    if(m_maze->room_no(roomNumber))
        return;
    
    Room* room = new Room(roomNumber);
    m_maze->add_room(room);

    room->set_side(Room::North, new Wall);
    room->set_side(Room::West, new Wall);
    room->set_side(Room::East, new Wall);
    room->set_side(Room::South, new Wall);
}

void StandardMazeBuilder::build_door(int room1, int room2)
{
    //TODO check if the use of variables doesn't mess with the scope of the pointers
    Room r1 = *m_maze->room_no(room1);
    Room r2 = *m_maze->room_no(room2);
    

    Door* d = new Door(&r1, &r2);
    
    r1.set_side(Room::West, d);
    r2.set_side(Room::East, d);
}

Room::ERoomSide StandardMazeBuilder::common_wall(Room* room1, Room* room2) const
{
     //TODO implement

     return Room::North;
}