#include "EnchantedRoom.hpp"

#include <iostream>
#include <string>

bool singleton::mazesingleton::EnchantedRoom::enter()
{
    std::cout << "you enter the room " << room_number() << ", there is a spell " << spell_casted() << '\n';

    return true;
}