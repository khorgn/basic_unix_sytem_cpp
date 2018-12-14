
#if !defined(ENCHANTEDROOM_HPP)
#define ENCHANTEDROOM_HPP

#include "Room.hpp"
#include "Spell.hpp"

namespace abstractfactory::mazefactory
{
    
    class EnchantedRoom : public Room
    {
    private:
        Spell* m_spellCasted;
    public:
        EnchantedRoom(int roomNumber, Spell* spellCasted) : Room(roomNumber), m_spellCasted(spellCasted) {}
        virtual bool enter() override;
        const Spell* spell_casted() { return m_spellCasted; }
    };
    
} // mazefactory


#endif // ENCHANTEDROOM_HPP