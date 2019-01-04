#include <iostream>
#include "MazeGame.hpp"
#include "MazePrototypeFactory.hpp"

#include "BombedWall.hpp"
#include "RoomWithABomb.hpp"
#include "EnchantedRoom.hpp"
#include "DoorNeedingSpell.hpp"

using namespace prototype;
namespace mp = mazeprototype;
namespace mg = mazegame;

int main(/* int argc, char const *argv[] */)
{
    std::cout << "Factory Method" << '\n';

    mg::MazeGame game;

    auto basicPrototype = mp::MazePrototypeFactory(new mp::Maze, new mp::Wall, new mp::Room, new mp::Door);
    auto basicMaze = game.create_maze(basicPrototype);

    auto bombedPrototype = mp::MazePrototypeFactory(new mp::Maze, new mp::BombedWall, new mp::RoomWithABomb, new mp::Door);
    auto bombedMaze = game.create_maze(bombedPrototype);

    auto enchantedPrototype = mp::MazePrototypeFactory(new mp::Maze, new mp::Wall, new mp::EnchantedRoom, new mp::DoorNeedingSpell);
    auto enchantedMaze = game.create_maze(enchantedPrototype);

    return 0;
}
