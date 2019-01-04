
#if !defined(ROOM_HPP)
#define ROOM_HPP

#include "IMapSite.hpp"

namespace abstractfactory::mazefactory
{
    class Room : public IMapSite
    {
        public:
        enum ERoomSide { North, South, West, East };

        private:
        int m_roomNumber;
        IMapSite *m_northBorder, *m_southBorder, *m_westBorder, *m_eastBorder;
        
        public:
        Room(int roomNumber) : m_roomNumber(roomNumber) {}
        void set_side(ERoomSide side, IMapSite* mapSite);
        const IMapSite* get_side(ERoomSide side) const;
        bool virtual enter() override;
        int room_number() const { return m_roomNumber; }

    };
} // mazefactory


#endif // ROOM_HPP
