#include "MazeFactory.hpp"
#include "MazeGame.hpp"
#include "Maze.hpp"

#include "gtest/gtest.h"
#include "gmock/gmock.h"

using namespace singleton;
using ::testing::AtLeast;
using ::testing::Exactly;
using ::testing::_;
using ::testing::Return;

class MazeFactoryMock : public mazesingleton::MazeFactory
{
    public:
    MOCK_CONST_METHOD0(make_maze, mazesingleton::Maze*());
    MOCK_CONST_METHOD0(make_wall, mazesingleton::Wall*());
    MOCK_CONST_METHOD1(make_room, mazesingleton::Room*(int roomNumber));
    MOCK_CONST_METHOD2(make_door, mazesingleton::Door*(mazesingleton::Room* room1, mazesingleton::Room* room2));
};


TEST(BasicTest, returnValue)
{
    auto factory = mazesingleton::MazeFactory::instance();

    mazesingleton::Maze *maze;

    mazegame::MazeGame game;
    maze = game.create_maze(*factory);

    auto* r1 = maze->room_no(1);
    auto* r2 = maze->room_no(2);

    EXPECT_EQ(r1->get_side(mazesingleton::Room::East), r2->get_side(mazesingleton::Room::West));
}


TEST(BasicTest, testMock)
{
    MazeFactoryMock *factory = new MazeFactoryMock;

    //NOTE: Return(new ...) can be replaced with ReturnNew<Type>(arg1, ...)
    EXPECT_CALL(*factory, make_maze()).Times(Exactly(1)).WillRepeatedly(Return(new mazesingleton::Maze));
    EXPECT_CALL(*factory, make_wall()).Times(AtLeast(2)).WillRepeatedly(Return(new mazesingleton::Wall));
    EXPECT_CALL(*factory, make_room(1)).Times(AtLeast(1)).WillOnce(Return(new mazesingleton::Room(1)));
    EXPECT_CALL(*factory, make_room(2)).Times(AtLeast(1)).WillOnce(Return(new mazesingleton::Room(1)));
    EXPECT_CALL(*factory, make_door(_, _)).Times(AtLeast(1)).WillRepeatedly(Return(new mazesingleton::Door(nullptr, nullptr)));


    mazegame::MazeGame game;
    auto* maze = game.create_maze(*factory);


    delete(factory);
}