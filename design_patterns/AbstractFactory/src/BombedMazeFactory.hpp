
#if !defined(BOMBEDMAZEFACTORY_HPP)
#define BOMBEDMAZEFACTORY_HPP

#include "MazeFactory.hpp"
#include "Wall.hpp"
#include "Room.hpp"

namespace abstractfactory::mazefactory
{
    
    class BombedMazeFactory : public MazeFactory
    {
    private:
        
    public:
        BombedMazeFactory() {}
        virtual Wall* make_wall() const override;
        virtual Room* make_room(int roomNumber) const override;
    };
    
} // mazefactory


#endif // BOMBEDMAZEFACTORY_HPP
