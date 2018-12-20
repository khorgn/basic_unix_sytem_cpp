#pragma once

#include "MazeGame.hpp"
#include "DoorNeedingSpell.hpp"
#include "EnchantedRoom.hpp"
#include "Spell.hpp"

namespace factorymethod::mazegame
{
    class BombedMazeGame : public MazeGame
    {
        public:
        BombedMazeGame() = default;
        virtual mazefactorymethod::Door* make_door(mazefactorymethod::Room* room1, mazefactorymethod::Room* room2) const override { return new mazefactorymethod::DoorNeedingSpell(room1, room2); }
        virtual mazefactorymethod::Room* make_room(int roomNumber) const override { return new mazefactorymethod::EnchantedRoom(roomNumber, cast_spell()); }
        mazefactorymethod::Spell* cast_spell() const { return new mazefactorymethod::Spell; }
    };
}
