#pragma once

namespace bridge
{
class Coord
{
  private:
    double m_value;

  public:
    explicit Coord() : m_value(0) {}
    explicit Coord(double value) : m_value(value) {}
    double value() const { return m_value; }
    Coord operator+(const Coord& obj) { return Coord(value()+obj.value()); }
    explicit operator double() { return m_value; }
};
} // namespace adapter