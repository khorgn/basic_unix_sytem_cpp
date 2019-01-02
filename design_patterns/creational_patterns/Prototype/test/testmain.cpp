

#include "gtest/gtest.h"
#include "gmock/gmock.h"

// using namespace mazeprototype;
// using ::testing::AtLeast;
// using ::testing::Exactly;
// using ::testing::_;
// using ::testing::Return;

// class MazeFactoryMock : public mazefactory::MazeFactory
// {
//     public:
//     MOCK_CONST_METHOD0(make_maze, mazefactory::Maze*());
//     MOCK_CONST_METHOD0(make_wall, mazefactory::Wall*());
//     MOCK_CONST_METHOD1(make_room, mazefactory::Room*(int roomNumber));
//     MOCK_CONST_METHOD2(make_door, mazefactory::Door*(mazefactory::Room* room1, mazefactory::Room* room2));
// };


// TEST(BasicTest, returnValue)
// {
//     auto factory = mazefactory::MazeFactory();

//     mazefactory::Maze *maze;

//     mazegame::MazeGame game;
//     maze = game.create_maze(factory);

//     auto* r1 = maze->room_no(1);
//     auto* r2 = maze->room_no(2);

//     EXPECT_EQ(r1->get_side(mazefactory::Room::East), r2->get_side(mazefactory::Room::West));
// }


// TEST(BasicTest, testMock)
// {
//     MazeFactoryMock *factory = new MazeFactoryMock;

//     //NOTE: Return(new ...) can be replaced with ReturnNew<Type>(arg1, ...)
//     EXPECT_CALL(*factory, make_maze()).Times(Exactly(1)).WillRepeatedly(Return(new mazefactory::Maze));
//     EXPECT_CALL(*factory, make_wall()).Times(AtLeast(2)).WillRepeatedly(Return(new mazefactory::Wall));
//     EXPECT_CALL(*factory, make_room(1)).Times(AtLeast(1)).WillOnce(Return(new mazefactory::Room(1)));
//     EXPECT_CALL(*factory, make_room(2)).Times(AtLeast(1)).WillOnce(Return(new mazefactory::Room(1)));
//     EXPECT_CALL(*factory, make_door(_, _)).Times(AtLeast(1)).WillRepeatedly(Return(new mazefactory::Door(nullptr, nullptr)));


//     mazegame::MazeGame game;
//     auto* maze = game.create_maze(*factory);


//     delete(factory);
// }