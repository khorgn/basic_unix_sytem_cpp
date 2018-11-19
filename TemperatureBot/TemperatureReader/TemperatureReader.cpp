// TemperatureReader.cpp : Defines the exported functions for the DLL application.
//

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <ctime>
#include <cerrno>
#include <rapidxml/rapidxml.hpp>
#include <rapidxml/rapidxml_utils.hpp>

#include "TemperatureReader.hpp"


namespace tpb = TemperatureBot;

tpb::TemperatureReader::TemperatureReader()
{
}


tpb::TemperatureReader::~TemperatureReader()
{
	_temperaturesRecovered.empty(); // TO CHECK IF NECESSARY
}

void tpb::TemperatureReader::RecoverData(std::string file)
{
	std::ifstream stream(file);
	if (!stream.is_open())
	{
		std::cout << "file is not open" << std::endl;
	}
	std::string text;
	std::string line;
	while (std::getline(stream, line))
	{
		text += line + '\n';
	}

	std::vector<char> writable(text.begin(), text.end()); // it doesn't take a string, it needs to be the first pointer of an array of chars with a \0 at the end, like C strings. c_str() doesn't suffise because it makes a const char*, which doesn't work here because the array is modified
	writable.push_back('\0');

	rapidxml::xml_document<char> doc;
	try
	{
	doc.parse<0>(&writable[0]);
	}
	catch (rapidxml::parse_error e)
	{
		return;
	}

	if (doc.first_node() == NULL)
	{
		std::cout << "Error: " << "no first node" << std::endl;
		return;
	}
	std::cout << "node: " << doc.first_node()->name() << std::endl;
	rapidxml::xml_node<> *rootNode = doc.first_node("Temperatures");
	rapidxml::xml_node<> *temperatureNode = rootNode->first_node("Temperature");
	while (temperatureNode != NULL)
	{
		rapidxml::xml_node<> *tempNode = temperatureNode->first_node("Temp");
		rapidxml::xml_node<> *locNode = temperatureNode->first_node("Location");
		rapidxml::xml_node<> *timeNode = temperatureNode->first_node("DateTime");

		// Get temp
		double temp = std::stod(tempNode->value());
		// Get location
		std::string loc = locNode->value();
		// Get DateTime
		std::string dt_s = timeNode->value();

		// split the string into date and time
		std::stringstream ssDT(dt_s);
		std::string item;
		std::vector<std::string> splittedString;
		while (std::getline(ssDT, item, 'T'))
		{
			splittedString.push_back(item);
		}

		// split the date string into year, month, day
		std::stringstream ssD(splittedString[0]);
		std::vector<std::string> splittedDate;
		while (std::getline(ssD, item, '-'))
		{
			splittedDate.push_back(item);
		}
		int year = std::stoi(splittedDate[0]);
		int month = std::stoi(splittedDate[1]);
		int day = std::stoi(splittedDate[2]);

		// split the time string into hour, minute, second
		std::stringstream ssT(splittedString[1]);
		std::vector<std::string> splittedTime;
		while (std::getline(ssT, item, ':'))
		{
			splittedTime.push_back(item);
		}
		int hour = std::stoi(splittedTime[0]);
		int minute = std::stoi(splittedTime[1]);
		int second = std::stoi(splittedTime[2]);

		// fill the std::tm
		std::tm datetime;
		time_t rawtime;
		time(&rawtime);
		// Convert to local time
		//errno_t err = localtime_s(&datetime, &rawtime);
		// if (err) {
		// 	exit(1);
		// }
		// need to find a thread-safe way of doing that on linux
		
		datetime = *localtime(&rawtime);

		datetime.tm_year = year;
		datetime.tm_mon = month;
		datetime.tm_mday = day;
		datetime.tm_hour = hour;
		datetime.tm_min = minute;
		datetime.tm_sec = second;

		// Save it
		_temperaturesRecovered.push(TemperatureBot::TemperatureData(temp, loc, datetime)); // TODO check all that


		temperatureNode = temperatureNode->next_sibling("Temperature");
	}

}

tpb::TemperatureData tpb::TemperatureReader::GetNext()
{
	if (_temperaturesRecovered.empty()) throw TemperatureBot::EmptyContainerException("Container of TemperatureReader is empty, tried to get next item");
	auto output = _temperaturesRecovered.front();
	_temperaturesRecovered.pop();
	return output;
}

bool TemperatureBot::TemperatureReader::empty()
{
	return _temperaturesRecovered.empty();
}

size_t TemperatureBot::TemperatureReader::GetSize()
{
	return _temperaturesRecovered.size();
}

std::vector<TemperatureBot::TemperatureData> TemperatureBot::TemperatureReader::GetAll()
{
	std::vector<TemperatureBot::TemperatureData> output;
	while (!empty())
	{
		output.push_back(GetNext());
	}

	return output;
}
