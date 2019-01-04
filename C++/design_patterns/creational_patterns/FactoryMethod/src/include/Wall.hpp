
#if !defined(WALL_HPP)
#define WALL_HPP

#include "IMapSite.hpp"

namespace factorymethod::mazefactorymethod
{
class Wall : public IMapSite
{
  public:
    Wall() {}
    bool virtual enter() override;
};
} // namespace factorymethod::mazefactorymethod

#endif // WALL_HPP
