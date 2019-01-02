
#if !defined(ENCHANTEDMAZEFACTORY_HPP)
#define ENCHANTEDMAZEFACTORY_HPP

#include "MazeFactory.hpp"
#include "Wall.hpp"
#include "Room.hpp"
#include "Spell.hpp"

namespace singleton::mazesingleton
{
class EnchantedMazeFactoryAttorneyMazeFactory;
class EnchantedMazeFactory : public MazeFactory
{
  private:
    // friend MazeFactory *MazeFactory::instance();
    friend class EnchantedMazeFactoryAttorneyMazeFactory;

  public:
    virtual Room *make_room(int roomNumber) const;
    virtual Door *make_door(Room *room1, Room *room2) const;

  protected:
    EnchantedMazeFactory() = default;
    Spell *cast_spell() const;
};
} // namespace singleton::mazesingleton

#endif // ENCHANTEDMAZEFACTORY_HPP
