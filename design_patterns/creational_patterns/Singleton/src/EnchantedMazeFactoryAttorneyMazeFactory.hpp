#pragma once
#include "EnchantedMazeFactory.hpp"
#include "MazeFactory.hpp"

namespace singleton::mazesingleton
{
class EnchantedMazeFactoryAttorneyMazeFactory
{
  private:
    friend class MazeFactory;

    static EnchantedMazeFactory* callEnchantedMazeFactory()
    {
        return new EnchantedMazeFactory();
    }
};

} // namespace singleton::mazesingleton