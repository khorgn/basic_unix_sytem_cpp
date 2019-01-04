
#if !defined(FIBONACCI_TEMPLATE_HPP)
#define FIBONACCI_TEMPLATE_HPP
namespace fibo_template
{
    // template<int steps> int fibonacci()
    // {
    //     if(steps < 0) return 0;
    //     if(steps == 0) return 1;
    //     if(steps == 1) return 1;
    //     return fibonacci<steps-1>() + fibonacci<steps-2>();
    // }

    template<int steps> struct fibonacci
    {
        static const int value = fibonacci<steps-1>::value + fibonacci<steps-2>::value;
    };

    template<> struct fibonacci<0>
    {
        static const int value = 1;
    };

    template<> struct fibonacci<1>
    {
        static const int value = 1;
    };

}

#endif // FIBONACCI_TEMPLATE_HPP
