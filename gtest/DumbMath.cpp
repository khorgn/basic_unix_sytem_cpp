#include "DumbMath.hpp"

using namespace basicLib;

DumbMath::DumbMath(int value) : m_value(value)
{}

int DumbMath::multiplyBy(int x)
{
    return m_value*x;
}

int DumbMath::value()
{
    return m_value;
}

void DumbMath::setValue(int value)
{
    m_value = value;
}