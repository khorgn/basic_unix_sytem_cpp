#pragma once

#include "MazeGame.hpp"
#include "BombedWall.hpp"
#include "RoomWithABomb.hpp"

namespace prototype::mazegame
{
    class BombedMazeGame : public MazeGame
    {
        public:
        BombedMazeGame() = default;
        virtual mazefactorymethod::Wall* make_wall() const override { return new mazefactorymethod::BombedWall; }
        virtual mazefactorymethod::Room* make_room(int roomNumber) const override { return new mazefactorymethod::RoomWithABomb(roomNumber); }
    };
}