#ifndef TEMPERATURE_DATA_HPP
#define TEMPERATURE_DATA_HPP

#include <string>
#include <chrono>

namespace TemperatureBot
{
    /// Data representing a temperature after being processed by the TemperatureReader
    /// @sa TemperatureReader
    struct TemperatureData
    {
        double temperature; ///< The temperature taken
        std::string location; ///< The location where the temperature has been taken
        std::tm datetime; ///< The date time when the temperature has been taken

        /// @brief The constructor of the structure
        TemperatureData(double temperature, std::string location, std::tm datetime);
    };
}

#endif