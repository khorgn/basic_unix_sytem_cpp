#include "Shape.hpp"
#include "Manipulator.hpp"

using ::adapter::Shape;
using ::adapter::Manipulator;

Manipulator* Shape::createManipulator()
{
    // here this is of type Shape* because the method is non-const, if the method is const, this is of type const Shape*
    return new Manipulator(this);
}