#include <iostream>

#include "MazeGame.hpp"
#include "Maze.hpp"
#include "StandardMazeBuilder.hpp"

int main()
{
    std::cout << "Hello Maze Factory" << '\n';

    auto game = builder::mazegame::MazeGame();

    auto maze = game.create_maze(*(new builder::mazebuilder::StandardMazeBuilder));


    return 0;
}
