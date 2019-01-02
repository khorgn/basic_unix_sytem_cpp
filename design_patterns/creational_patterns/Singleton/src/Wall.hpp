
#if !defined(WALL_HPP)
#define WALL_HPP

#include "IMapSite.hpp"

namespace singleton::mazesingleton
{
class Wall : public IMapSite
{
  public:
    Wall() {}
    bool virtual enter() override;
};
} // namespace singleton::mazesingleton

#endif // WALL_HPP
