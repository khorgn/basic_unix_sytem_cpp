#include <iostream>
#include "string.hpp"

// to prevent compiler optimisation of constructors (and not call copy/move constructors when it's not necessary):
// -fno-elide-constructors
// https://stackoverflow.com/questions/3106110/what-are-move-semantics
// https://stackoverflow.com/questions/3279543/what-is-the-copy-and-swap-idiom

int main()
{
	string s1;


	return 0;
}
