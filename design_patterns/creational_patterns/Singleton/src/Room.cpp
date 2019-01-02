#include "Room.hpp"

#include <iostream>

using namespace singleton::mazesingleton;

void Room::set_side(Room::ERoomSide side, IMapSite* roomBorder)
{
    switch (side)
    {
        case Room::ERoomSide::North:
        m_northBorder = roomBorder;
        break;
        case Room::ERoomSide::South:
        m_southBorder = roomBorder;
        break;
        case Room::ERoomSide::West:
        m_westBorder = roomBorder;
        break;
        case Room::ERoomSide::East:
        m_eastBorder = roomBorder;
        break;
    }
}

const IMapSite* Room::get_side(Room::ERoomSide side) const
{
    switch (side)
    {
        case Room::ERoomSide::North:
        return m_northBorder;
        break;
        case Room::ERoomSide::South:
        return m_southBorder;
        break;
        case Room::ERoomSide::West:
        return m_westBorder;
        break;
        case Room::ERoomSide::East:
        return m_eastBorder;
        break;
    }
}

bool Room::enter()
{
    std::cout << "entered room number " << m_roomNumber << '\n';
    return true;
}