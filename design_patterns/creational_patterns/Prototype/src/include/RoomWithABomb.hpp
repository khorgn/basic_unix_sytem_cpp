
#if !defined(ROOMWITHABOMB_HPP)
#define ROOMWITHABOMB_HPP

#include "Room.hpp"

namespace prototype::mazeprototype
{
    class RoomWithABomb : public Room
    {
        public:
        RoomWithABomb() = default;
        RoomWithABomb(int roomNumber) : Room(roomNumber) {}
    };
}

#endif // ROOMWITHABOMB_HPP
