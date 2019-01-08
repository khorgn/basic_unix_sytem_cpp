#pragma once
#include <utility>
#include <cstdlib>
#include <cstring>

class string
{
	char* data;

	public:
	string(const char* p); // constructor

	string();
	~ string(); // destructor

	string(const string& that); // copy constructor

	string& operator=(string that); // copy assignement operator

	// declares a non-member function, and makes it a friend at the same time (always inline in this case), similar to declaring it outside the class and then declaring it as friend in the class.
	friend void swap(string& first, string& second) // the friend function swap
	// swap cannot be defined in the cpp, because its a friend direclty declared in the class, it can only be found by ADL (Argument-Dependent Lookup)
	{
		// we don't need to do a self-assignment check since there is virtually no const either way
		using std::swap; // necessary to enable ADL for the following swaps
		// for basic types, std::swap works perfectly, so by allowing it in the main namespace we let the compiler override its call when necessary

		// we swaps the members of the two objects, and through ADL further swap redifinition will be called if the members needs it (are not basic types
		swap(first.data, second.data);
	}

	string(string&& that); // move constructor

	// Not needed, because we have the copy assignment operator, the copy constructor and the move constructor.
	// As soon as one of the special member functions are declared (destructor, copy/move constructor, copy/move operator) none of them are implicitly declared, if they are not explicitly declared they don't exist
	// Since the move operator doesn't exist the copy operator is called
	// Since the copy operator takes a parameter by value, this parameter needs to be constructed (to pass it by value)
	// With lvalues, the copy constructor is called (basic behavior
	// With rvalues, the move constructor is called (if it is forced with a std::move/rvalue reference, or if the compiler juges it more efficient than the copy constructor (deep objects))
	// Thus, if the parameter is a rvalue, the object passed is actually not copied but moved from the origin, which is useless anyway
	// string& operator=(string&& that); // move assignment operator
};
