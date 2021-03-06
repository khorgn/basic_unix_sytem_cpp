#include "string.hpp"

/*
string::string()
{
	std::cout << "In default constructor : start" << '\n';
	data = nullptr;
	std::cout << "In default constructor : end" << '\n';
}
*/

string::string(const char* p)
{
	std::cout << "In constructor("<< p << ") : start" << '\n';
	std::size_t size = strlen(p) + 1;
	data = new char[size];
	memcpy(data, p, size);
	std::cout << "In constructor : end" << '\n';
}

string::~string()
{
	std::cout << "In destructor : start" << '\n';
	// a nullptr or a 0 will simply result in a no-operation if delete, so no problem
	delete[] data;
	std::cout << "In destructor : end" << '\n';
}

string::string(const string& that)
{
	std::cout << "In copy constructor(" << that.data << ") : start" << '\n';
	std::size_t size = strlen(that.data) + 1;
	data = new char[size];
	memcpy(data, that.data, size);
	std::cout << "In copy constructor : end" << '\n';
}

string& string::operator=(string that)
{
	std::cout << "In copy assignment operator (old:" << (data != nullptr ? data : "\0") << ", new:" << that.data << ") : start" << '\n';
	swap(*this, that); // the swap is safe for a copy assignment operator because we transmit the object by value, so its not modified
	std::cout << "In copy assignment operator : end" << '\n';
	return *this;
}

// string::string(string&& that) : string() // initialize via the default constructor
// {
// 	std::cout << "In move constructor (" << that.data << ") : start" << '\n';
// 	// can swap because this has already been constructed
// 	swap(*this, that);
// 	std::cout << "In move constructor : end" << '\n';
// }

// other possibility
string::string(string&& that)
{
	std::cout << "In move constructor (" << that.data << ") : start" << '\n';
	// No swap here because this->data has no deterministic value before the constructor, so this operation would be undefined behavior
	data = that.data;
	that.data=nullptr;
	std::cout << "In move constructor : end" << '\n';
}


/*
string& string::operator=(string&& that)
{
	swap(*this, that);
	return *this;
}
*/
