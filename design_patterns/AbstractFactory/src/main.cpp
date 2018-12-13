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

    game.create_maze(*(new abstractfactory::mazefactory::MazeFactory));

    game.create_maze(*(new abstractfactory::mazefactory::EnchantedMazeFactory));

    game.create_maze(*(new abstractfactory::mazefactory::BombedMazeFactory));


    return 0;
}
