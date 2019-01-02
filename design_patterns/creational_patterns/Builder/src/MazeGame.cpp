#include "MazeGame.hpp"

#include "IMapSite.hpp"

using namespace builder::mazegame;
using ::builder::mazebuilder::AMazeBuilder;
using namespace builder;

const builder::mazebuilder::Maze* MazeGame::create_maze(builder::mazebuilder::AMazeBuilder& builder)
{
    builder.build_maze();
    builder.build_room(1);
    builder.build_room(2);
    builder.build_door(1, 2);

    return builder.maze();
}
