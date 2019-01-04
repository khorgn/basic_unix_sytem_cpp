
#if !defined(DOORNEEDINGSPELL_HPP)
#define DOORNEEDINGSPELL_HPP

#include "Room.hpp"
#include "Door.hpp"

namespace singleton::mazesingleton
{
    
    class DoorNeedingSpell : public Door
    {
    private:
        
    public:
        DoorNeedingSpell(Room* room1, Room* room2) : Door(room1, room2) {}
    };
    
}

#endif // DOORNEEDINGSPELL_HPP
