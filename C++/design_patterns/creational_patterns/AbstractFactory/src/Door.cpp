#include "Door.hpp"

#include <iostream>

using namespace abstractfactory::mazefactory;

bool Door::enter()
{
    if(is_open())
    {
        std::cout << "you enter the room" << '\n';
        return true;
    }
    else
    {
        std::cout << "you hit a door" << '\n';
        return false;
    }
}

bool Door::is_open()
{
    return m_isOpen;
}


const Room* Door::other_side_from(Room* room)
{
    if(room == m_room1)
    {
        return m_room2;
    }
    else if(room == m_room2)
    {
        return m_room1;
    }
    else
    {
        return nullptr;
    }
}