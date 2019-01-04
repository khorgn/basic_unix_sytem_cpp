#include "DumbMath.hpp"
#include "gtest/gtest.h"

using namespace basicLib;

TEST(DumbMathTest, returnValue) {

  DumbMath dm(5);
  EXPECT_EQ(5, dm.value());

}


TEST(DumbMathTest, returnValue2) {

  EXPECT_EQ(4, get4());
}