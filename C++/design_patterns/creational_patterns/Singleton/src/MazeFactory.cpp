#include "MazeFactory.hpp"
#include "BombedMazeFactory.hpp"
#include "EnchantedMazeFactory.hpp"
#include "BombedMazeFactoryAttorneyMazeFactory.hpp"
#include "EnchantedMazeFactoryAttorneyMazeFactory.hpp"

#include <cstdlib>
#include <cstring>

using ::singleton::mazesingleton::MazeFactory;

MazeFactory *MazeFactory::ms_instance = nullptr;

MazeFactory *MazeFactory::instance()
{
    if (ms_instance == nullptr)
    {
        const char *mazeStyle = getenv("MAZESTYLE");

        if (strcmp(mazeStyle, "bombed"))
        {
            // ms_instance = new BombedMazeFactory;
            ms_instance = BombedMazeFactoryAttorneyMazeFactory::callBombedMazeFactory();
        }
        else if (strcmp(mazeStyle, "enchanted"))
        {
            // ms_instance = new EnchantedMazeFactory;
            ms_instance = EnchantedMazeFactoryAttorneyMazeFactory::callEnchantedMazeFactory();
        }
        else
        {
            ms_instance = new MazeFactory;
        }
    }
    return ms_instance;
}