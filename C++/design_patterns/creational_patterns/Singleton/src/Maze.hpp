#if !defined(MAZE_HPP)
#define MAZE_HPP

#include "Room.hpp"

#include <vector>

namespace singleton::mazesingleton
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

} // singleton::factory

#endif // MAZE_HPP