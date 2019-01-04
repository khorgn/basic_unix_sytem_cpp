#include "TextShape.hpp"
#include "TextManipulator.hpp"

using namespace adapter;

void TextShape::boundingBox(Point& bottomLeft, Point& topRight) const
{
    Coord bottom, left, width, height;

    getOrigin(bottom, left);
    getExtent(width, height);

    bottomLeft = Point(bottom, left);
    topRight = Point(bottom+height, left+width);
}

bool TextShape::isEmpty() const
{
    return TextView::isEmpty();
}

Manipulator* TextShape::createManipulator()
{
    return new TextManipulator(this);
}