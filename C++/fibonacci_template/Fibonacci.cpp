#include "Fibonacci.hpp"

using namespace fibo;

/// calculate the fibonacci sequence, returns -1 if the step given is less than 0
int32_t fibo::fibonacci(int steps)
{
    if(steps < 0) return -1;
    if(steps == 0) return 1;
    if(steps == 1) return 1;
    return fibonacci(steps-2) + fibonacci(steps-1);
}