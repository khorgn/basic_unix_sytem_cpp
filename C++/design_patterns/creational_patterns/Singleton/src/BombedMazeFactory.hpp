
#if !defined(BOMBEDMAZEFACTORY_HPP)
#define BOMBEDMAZEFACTORY_HPP

#include "MazeFactory.hpp"
#include "Wall.hpp"
#include "Room.hpp"

namespace singleton::mazesingleton
{
class BombedMazeFactoryAttorneyMazeFactory;
class BombedMazeFactory : public MazeFactory
{
  private:
    // friend MazeFactory *MazeFactory::instance();
    friend class BombedMazeFactoryAttorneyMazeFactory;

  private:
  public:
    virtual Wall *make_wall() const override;
    virtual Room *make_room(int roomNumber) const override;

  protected:
    BombedMazeFactory() = default;
};

} // namespace singleton::mazesingleton

#endif // BOMBEDMAZEFACTORY_HPP
