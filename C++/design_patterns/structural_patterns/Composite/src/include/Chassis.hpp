#pragma once
#include "Equipment.hpp"

using Watt = double;
using Currency = double;
namespace equipmentcomposite
{
class Chassis : public Equipment
{
  public:
    Chassis(const char *);
    virtual ~Chassis();

    virtual Watt power();
    virtual Currency netPrice();
    virtual Currency discountPrice();
};
} // namespace equipmentcomposite