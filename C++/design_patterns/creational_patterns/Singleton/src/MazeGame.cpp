#include "MazeGame.hpp"

#include "IMapSite.hpp"

using namespace singleton::mazegame;


singleton::mazesingleton::Maze* MazeGame::create_maze(mazesingleton::MazeFactory& factory)
{
    mazesingleton::Maze* aMaze = factory.make_maze();
    mazesingleton::Room* r1 = factory.make_room(1);
    mazesingleton::Room* r2 = factory.make_room(2);
    mazesingleton::Door* aDoor = factory.make_door(r1, r2);


    r1->set_side(mazesingleton::Room::ERoomSide::North, factory.make_wall());
    r1->set_side(mazesingleton::Room::ERoomSide::South, factory.make_wall());
    r1->set_side(mazesingleton::Room::ERoomSide::West, factory.make_wall());
    r1->set_side(mazesingleton::Room::ERoomSide::East, aDoor);

    r2->set_side(mazesingleton::Room::ERoomSide::North, factory.make_wall());
    r2->set_side(mazesingleton::Room::ERoomSide::South, factory.make_wall());
    r2->set_side(mazesingleton::Room::ERoomSide::West, aDoor);
    r2->set_side(mazesingleton::Room::ERoomSide::East, factory.make_wall());

    aMaze->add_room(r1);
    aMaze->add_room(r2);

    return aMaze;
}
