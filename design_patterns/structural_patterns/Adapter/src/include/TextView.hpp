#pragma once
#include "Coord.hpp"

namespace adapter
{
/**
 * @brief The adaptee, a textview to represent a text object
 * 
 */
class TextView
{
  public:
    TextView() = default;
    void getOrigin(Coord &x, Coord &y) const;
    void getExtent(Coord &width, Coord &height) const;
    virtual bool isEmpty() const;
};
} // namespace adapter