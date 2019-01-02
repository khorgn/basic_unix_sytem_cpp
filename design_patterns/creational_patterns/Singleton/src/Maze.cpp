#include "Maze.hpp"

using namespace singleton::mazesingleton;

void Maze::add_room(Room* room)
{
    m_rooms.push_back(room);
}

const Room* Maze::room_no(int roomNumber) const
{
    
    for(const auto room : m_rooms)
    {
        if(room->room_number() == roomNumber)
        {
            return room;
        }
    }
    
    return nullptr;
}