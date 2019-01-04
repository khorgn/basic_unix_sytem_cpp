#include "TemperatureReader/src/TemperatureData.hpp"
#include "gtest/gtest.h"

#include <chrono>

using namespace TemperatureBot;

TEST(BasicTest, returnValue)
{
  std::tm time;
  time.tm_year = 1000;
  time.tm_mon = 2;
  time.tm_mday = 13;
  TemperatureBot::TemperatureData a(10.0, "Cherbourg", time);
  EXPECT_EQ(2, a.datetime.tm_mon);
  EXPECT_EQ("Cherbourg", a.location);
}