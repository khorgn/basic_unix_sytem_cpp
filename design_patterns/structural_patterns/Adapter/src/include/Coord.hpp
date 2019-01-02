#pragma once

namespace adapter
{
class Coord
{
  private:
    double m_value;

  public:
    Coord() : m_value(0) {}
    Coord(double value) : m_value(value) {}
    double value() const { return m_value; }
    Coord operator+(const Coord& obj) { return Coord(value()+obj.value()); }
};
} // namespace adapter