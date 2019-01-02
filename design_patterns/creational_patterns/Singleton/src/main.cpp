#include <iostream>

#include "MazeGame.hpp"
#include "Maze.hpp"
#include "MazeFactory.hpp"
#include "EnchantedMazeFactory.hpp"
#include "BombedMazeFactory.hpp"
#include <cstdlib>

int main()
{
    std::cout << "Hello Maze Factory" << '\n';

    auto game = singleton::mazegame::MazeGame();

    setenv("MAZESTYLE", "", 1);
    auto maze = game.create_maze(*singleton::mazesingleton::MazeFactory::instance());

    setenv("MAZESTYLE", "bombed", 1);
    maze = game.create_maze(*singleton::mazesingleton::MazeFactory::instance());

    setenv("MAZESTYLE", "enchanted", 1);
    maze = game.create_maze(*singleton::mazesingleton::MazeFactory::instance());

    return 0;
}
