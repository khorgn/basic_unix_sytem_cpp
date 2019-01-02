#pragma once
#include "Shape.hpp"
#include "TextView.hpp"
#include "Point.hpp"
#include "Coord.hpp"
#include "Manipulator.hpp"
/**
 * @file TextShape.hpp
 * The adapter of TextView, here the class version of the adapter is used, we could instead use the object version, with an instance of TextView in TextShape
 */
namespace adapter
{
    class TextShape : public Shape, private TextView
    {
        public:
        TextShape() = default;
        /**
         * @brief Converts TextView's interface to be usable throught Shape's interface
         * 
         * @param bottomLeft 
         * @param topRight 
         */
        virtual void boundingBox(Point& bottomLeft, Point& topRight) const;
        virtual bool isEmpty() const;
        /**
         * @brief Create a Manipulator object
         * Add a functionnality not existing in TextView, the ability to manipulate an object
         * @return Manipulator* 
         */
        virtual Manipulator* createManipulator();

    };
}