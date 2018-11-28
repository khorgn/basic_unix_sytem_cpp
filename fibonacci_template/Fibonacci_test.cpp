#include "gtest/gtest.h"

#include "Fibonacci.hpp"


TEST(FibonacciTest, equal) {
    ASSERT_EQ(fibo::fibonacci(0), 1);
    ASSERT_EQ(fibo::fibonacci(1), 1);
    ASSERT_EQ(fibo::fibonacci(3), 3);
    ASSERT_EQ(fibo::fibonacci(7), 21);
}

TEST(FibonacciTest, notnegative) {
    ASSERT_EQ(fibo::fibonacci(-1), -1);
}