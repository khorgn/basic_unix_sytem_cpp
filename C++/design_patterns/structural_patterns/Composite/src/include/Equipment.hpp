#pragma once
#include "Iterator.hpp"

using Watt = double;
using Currency = double;
namespace equipmentcomposite
{
class Equipment
{
  public:
    virtual ~Equipment();
    const char *name() { return m_name; }

    virtual Watt power();
    virtual Currency netPrice();
    virtual Currency discountPrice();

    virtual void add(Equipment *);
    virtual void remove(Equipment *);
    virtual Iterator *createIterator();

  protected:
    Equipment(const char *);

  private:
    const char *m_name;
};
} // namespace equipmentcomposite