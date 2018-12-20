#include "MazeGame.hpp"

#include "IMapSite.hpp"

using namespace factorymethod::mazegame;
using namespace factorymethod::mazefactorymethod;

const factorymethod::mazefactorymethod::Maze* MazeGame::create_maze()
{
    Maze* aMaze = make_maze();

    Room* r1 = make_room(1);
    Room* r2 = make_room(2);
    Door* d = make_door(r1, r2);

    aMaze->add_room(r1);
    aMaze->add_room(r2);

    r1->set_side(Room::North, make_wall());
    r1->set_side(Room::South, make_wall());
    r1->set_side(Room::West, make_wall());
    r1->set_side(Room::East, d);

    r2->set_side(Room::North, make_wall());
    r2->set_side(Room::South, make_wall());
    r2->set_side(Room::West, d);
    r2->set_side(Room::East, make_wall());

    return aMaze;
}
