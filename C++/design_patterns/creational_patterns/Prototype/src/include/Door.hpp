#if !defined(DOOR_HPP)
#define DOOR_HPP

#include "Room.hpp"
#include "IMapSite.hpp"

namespace prototype::mazeprototype
{
    class Door : public IMapSite
    {
        private:
        Room* m_room1;
        Room* m_room2;
        bool m_isOpen;
        public:
        Door() : m_room1(nullptr), m_room2(nullptr) {}
        Door(Room* room1, Room* room2) : m_room1(room1), m_room2(room2) {}
        bool virtual enter() override;
        bool is_open();
        const Room* other_side_from(Room* room);

        Door* clone() const;
        void initialize(Room* room1, Room* room2);
    };
} // mazefactory


#endif // DOOR_HPP
