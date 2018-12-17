
#if !defined(WALL_HPP)
#define WALL_HPP

#include "IMapSite.hpp"

namespace builder::mazebuilder
{
class Wall : public IMapSite
{
  public:
    Wall() {}
    bool virtual enter() override;
};
} // namespace builder::mazebuilder

#endif // WALL_HPP
