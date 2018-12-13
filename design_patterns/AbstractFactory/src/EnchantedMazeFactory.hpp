
#if !defined(ENCHANTEDMAZEFACTORY_HPP)
#define ENCHANTEDMAZEFACTORY_HPP

#include "MazeFactory.hpp"
#include "Wall.hpp"
#include "Room.hpp"
#include "Spell.hpp"

namespace abstractfactory::mazefactory
{
class EnchantedMazeFactory : public MazeFactory
{

  public:
    EnchantedMazeFactory() {}
    virtual Room *make_room(int roomNumber) const;
    virtual Door *make_door(Room *room1, Room *room2) const;

  protected:
    Spell *cast_spell() const;
};
} // namespace abstractfactory::mazefactory

#endif // ENCHANTEDMAZEFACTORY_HPP
