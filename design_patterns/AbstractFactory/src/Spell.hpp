
#if !defined(SPELL_HPP)
#define SPELL_HPP

#include <string>

namespace abstractfactory::mazefactory
{
    class Spell
    {
        private:
        std::string m_spellName;
        public:
        Spell() : m_spellName("FooBar") {}
        std::string spell_name() { return m_spellName; }
    };
}

#endif // SPELL_HPP
