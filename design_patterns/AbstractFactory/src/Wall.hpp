
#if !defined(WALL_HPP)
#define WALL_HPP

#include "IMapSite.hpp"

namespace abstractfactory::mazefactory
{
class Wall : public IMapSite
{
  public:
    Wall() {}
    bool virtual enter() override;
};
} // namespace abstractfactory::mazefactory

#endif // WALL_HPP
