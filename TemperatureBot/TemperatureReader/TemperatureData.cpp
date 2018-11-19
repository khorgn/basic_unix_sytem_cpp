#include "TemperatureData.hpp"

using namespace TemperatureBot;

TemperatureData::TemperatureData(double temperature, std::string location, std::tm datetime) : temperature(temperature), location(location), datetime(datetime)
{

}