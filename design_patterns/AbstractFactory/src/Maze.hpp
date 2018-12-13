#if !defined(MAZE_HPP)
#define MAZE_HPP

#include "Room.hpp"

#include <vector>

namespace abstractfactory::mazefactory
{

class Maze
{
  private:
    std::vector<Room*> m_rooms;
  public:
    Maze() {}
    void add_room(Room *room);
    const Room* room_no(int roomNumber) const;
};

} // abstractfactory::factory

#endif // MAZE_HPP