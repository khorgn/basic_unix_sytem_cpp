#ifndef DUMBMATH_HPP
#define DUMBMATH_HPP

#define DLL_PUBLIC __attribute__ ((visibility("default")))
#define DLL_LOCAL __attribute__ ((visibility("hidden")))

/// \file DumbMath.hpp
/// \brief a basic header file for testing purposes

/// \brief the namespace containg the basicLib library
namespace basicLib
{
    /// \brief a class allowing to do some dumb math
    class DLL_PUBLIC DumbMath
    {
        public:
        /// \brief A basic contstructor
        /// \param value the value of the object
        DumbMath(int value=0);
        int multiplyBy(int x); //§< multiplies the value by x and returns the result
        int value(); ///< returns the value
        void setValue(int value);///< set the value
        private:
        /// The inner value
        int m_value;
    };

    DLL_LOCAL inline int get4() {return 4;}
}


#endif