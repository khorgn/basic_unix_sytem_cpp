#pragma once
#include "Point.hpp"
#include "Manipulator.hpp"

namespace adapter
{
/**
 * @brief The target class, a shape that can be manipulated
 * 
 */
class Shape
{
  public:
    Shape();
    /**
     * @brief Draw the shape according to two given coordinates
     * 
     * @param bottomLeft 
     * @param topRight 
     */
    virtual void boundingBox(Point &bottomLeft, Point &topRight) const;
    virtual Manipulator *createManipulator();
    void nonConstMethod() {}
};
} // namespace adapter