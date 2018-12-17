
#if !defined(IMAPSITE_HPP)
#define IMAPSITE_HPP

namespace builder::mazebuilder
{
    class IMapSite
    {
        public:
        virtual bool enter() = 0;
    };
}

#endif // IMAPSITE_HPP
