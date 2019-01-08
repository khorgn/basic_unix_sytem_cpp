#include "string.hpp"

string::string()
{
	data = nullptr;
}

string::string(const char* p)
{
	std::size_t size = strlen(p) + 1;
	data = new char[size];
	memcpy(data, p, size);
}

string::~string()
{
	// a nullptr or a 0 will simply result in a no-operation if delete, so no problem
	delete[] data;
}

string::string(const string& that)
{
	std::size_t size = strlen(that.data) + 1;
	data = new char[size];
	memcpy(data, that.data, size);
}

string& string::operator=(string that)
{
	swap(*this, that); // the swap is safe for a copy assignment operator because we transmit the object by value, so its not modified
	return *this;
}

string::string(string&& that) : string() // initialize via the default constructor
{
	// can swap because this has already been constructed
	swap(*this, that);
}

/* other possibility
string::string(string&& that)
{
	// No swap here because this->data has no deterministic value before the constructor, so this operation would be undefined behavior
	data = that.data;
	that.data=nullptr;
}
*/

/*
string& string::operator=(string&& that)
{
	swap(*this, that);
	return *this;
}
*/
