#include <iostream>

#include "MazeGame.hpp"
#include "Maze.hpp"
#include "MazeFactory.hpp"
#include "EnchantedMazeFactory.hpp"
#include "BombedMazeFactory.hpp"

int main()
{
    std::cout << "Hello Maze Factory" << '\n';

    auto game = abstractfactory::mazegame::MazeGame();

    auto maze = game.create_maze(*(new abstractfactory::mazefactory::MazeFactory));

    maze = game.create_maze(*(new abstractfactory::mazefactory::EnchantedMazeFactory));

    maze = game.create_maze(*(new abstractfactory::mazefactory::BombedMazeFactory));


    return 0;
}
