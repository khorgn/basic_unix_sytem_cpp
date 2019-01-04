#pragma once
#include "Equipment.hpp"

namespace equipmentcomposite
{
class FloppyDisk : public Equipment
{
  public:
    FloppyDisk(const char *);
    virtual ~FloppyDisk();

    virtual double power() override;
    virtual double netPrice() override;
    virtual double discountPrice() override;
};
} // namespace equipmentcomposite