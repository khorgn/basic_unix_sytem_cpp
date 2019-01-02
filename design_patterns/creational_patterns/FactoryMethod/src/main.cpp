#include <iostream>
#include "MazeGame.hpp"
#include "BombedMazeGame.hpp"
#include "EnchantedMazeGame.hpp"

using namespace factorymethod;
namespace mf = mazefactorymethod;
namespace mg = mazegame;

int main(/* int argc, char const *argv[] */)
{
    std::cout << "Factory Method" << '\n';

    mg::MazeGame basicMazeGame;
    mg::BombedMazeGame bombedMazeGame;
    mg::EnchantedMazeGame enchantedMazeGame;


    const mf::Maze* basicMaze = basicMazeGame.create_maze();
    const mf::Maze* bombedMaze = bombedMazeGame.create_maze();
    const mf::Maze* enchantedMaze = enchantedMazeGame.create_maze();


    return 0;
}
