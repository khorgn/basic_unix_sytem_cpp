#include "Maze.hpp"

using namespace prototype::mazeprototype;

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

Maze* Maze::clone() const
{
    return new Maze;
}

void Maze::initialize()
{
    m_rooms = std::vector<Room*>();
}