#ifndef TEMPERATURE_READER_HPP
#define TEMPERATURE_READER_HPP

#include "TemperatureData.hpp"

#include "EmptyContainerException.hpp"
#include <fstream>
#include <queue>
#include <vector>
#include <exception>

namespace TemperatureBot
{
    //! Read and process the temperature given as input
    class TemperatureReader
    {
    private:
        std::queue<TemperatureData> _temperaturesRecovered; //! The queue of temperatures recovered
    public:
         TemperatureReader();
        ~TemperatureReader();

        void RecoverData(std::string file); //! Recover all the data in the stream
        TemperatureData GetNext(); //! Get the next temperature recovered
        bool empty();
        size_t GetSize(); //! Get the number of temperatures recovered left
        std::vector<TemperatureBot::TemperatureData> GetAll();
    };

}

#endif