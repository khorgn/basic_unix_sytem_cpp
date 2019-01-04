
#if !defined(WALL_HPP)
#define WALL_HPP

#include "IMapSite.hpp"

namespace prototype::mazeprototype
{
class Wall : public IMapSite
{
  public:
    Wall() {}
    bool virtual enter() override;
    Wall* clone() const;
};
} // namespace prototype::mazeprototype

#endif // WALL_HPP
