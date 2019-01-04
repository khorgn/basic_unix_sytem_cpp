#pragma once
#include "Equipment.hpp"
#include "list"
#include "Iterator.hpp"

using Watt = double;
using Currency = double;
namespace equipmentcomposite
{
class CompositeEquipment : public Equipment
{
  public:
    virtual ~CompositeEquipment();

    virtual Watt power() override;
    virtual Currency netPrice() override;
    virtual Currency discountPrice() override;

    virtual void add(Equipment *) override;
    virtual void remove(Equipment *) override;
    virtual Iterator *createIterator() override;

  protected:
    CompositeEquipment(const char *);

  private:
    std::list<Equipment> m_equipments;
};
} // namespace equipmentcomposite