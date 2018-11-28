#include <iostream>

#include "Fibonacci.hpp"
#include "Fibonacci_template.hpp"

#include <chrono>

int main(int, char**) {
    std::cout << "Hello, world!\n";

    auto timebefore = std::chrono::system_clock::now();
    std::cout << "fibo:\n0 = " << fibo::fibonacci(0) << "\n1 = " << fibo::fibonacci(1) << "\n2 = " << fibo::fibonacci(2) << "\n3 = " << fibo::fibonacci(3) << "\n4 = " << fibo::fibonacci(4) << "\n5 = " << fibo::fibonacci(5) << "\n20 = " << fibo::fibonacci(20) << "\n";
    auto timeafter = std::chrono::system_clock::now();

    std::cout << "time taken " << (std::chrono::duration<double, std::milli> (timeafter - timebefore).count()) << "ms \n";
    
    timebefore = std::chrono::system_clock::now();
    std::cout << "fibo_template:\n0 = " << fibo_template::fibonacci<0>::value << "\n1 = " << fibo_template::fibonacci<1>::value << "\n2 = " << fibo_template::fibonacci<2>::value << "\n3 = " << fibo_template::fibonacci<3>::value << "\n4 = " << fibo_template::fibonacci<4>::value << "\n5 = " << fibo_template::fibonacci<5>::value << "\n20 = " << fibo_template::fibonacci<20>::value << "\n";
    timeafter = std::chrono::system_clock::now();

    std::cout << "time taken " << (std::chrono::duration<double, std::milli> (timeafter - timebefore).count()) << "ms \n";


    // std::cout << "fibo_template:\n0 = " << fibo_template::fibonacci<0>() << "\n1 = " << fibo_template::fibonacci<1>() << "\n2 = " << fibo_template::fibonacci<2>() << "\n3 = " << fibo_template::fibonacci<3>() << "\n4 = " << fibo_template::fibonacci<4>() << "\n5 = " << fibo_template::fibonacci<5>() << "\n6 = " << fibo_template::fibonacci<6>() << "\n";

    return 0;
}
