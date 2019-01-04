#pragma once
#include "BombedMazeFactory.hpp"
#include "MazeFactory.hpp"

namespace singleton::mazesingleton
{
class BombedMazeFactoryAttorneyMazeFactory
{
  private:
    friend class MazeFactory;

    static BombedMazeFactory *callBombedMazeFactory()
    {
        return new BombedMazeFactory();
    }
};
} // namespace singleton::mazesingleton