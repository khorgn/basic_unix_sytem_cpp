#include "EnchantedMazeFactory.hpp"

#include "DoorNeedingSpell.hpp"
#include "EnchantedRoom.hpp"
#include "Spell.hpp"

using namespace singleton::mazesingleton;

Room *EnchantedMazeFactory::make_room(int roomNumber) const
{
    return new EnchantedRoom(roomNumber, cast_spell());
}
Door *EnchantedMazeFactory::make_door(Room *room1, Room *room2) const
{
    return new DoorNeedingSpell(room1, room2);
}

Spell* EnchantedMazeFactory::cast_spell() const
{
    return new Spell;
}