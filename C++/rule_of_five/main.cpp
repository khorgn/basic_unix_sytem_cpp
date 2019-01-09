#include <iostream>
#include "string.hpp"
#include <iostream>
#include <utility>

// to prevent compiler optimisation of constructors (and not call copy/move constructors when it's not necessary):
// -fno-elide-constructors
// https://stackoverflow.com/questions/3106110/what-are-move-semantics
// https://stackoverflow.com/questions/3279543/what-is-the-copy-and-swap-idiom

int main()
{
//	std::cout << "string s1;" << '\n';
//	string s1;
//	std::cout << '\n';
	string s1("");

	std::cout << "string s2(\"foobar\");" << '\n';
	string s2("foobar");
	std::cout << '\n';

	// with elision, it only call the constructor
	// without, it calls the constructor, then the default constructor (because move constructor calls it), then the move constructor
	std::cout << "string s3 = \"foobar\";" << '\n';
	string s3 = "foobar2";
	std::cout << '\n';

	std::cout << "s1 = s2;" << '\n';
	s1 = s2;
	std::cout << '\n';

	std::cout << "string s4(s2);" << '\n';
	string s4(s2);
	std::cout << '\n';

	std::cout << "string s5 = s2;" << '\n';
	string s5 = s2;
	std::cout << '\n';

	std::cout << "s2: " << (s2.data != nullptr ? s2.data : "nullptr") << '\n';
	std::cout << "string s6 = std::move(s2);" << '\n';
	string s6 = std::move(s2); // Move constructor is called

	std::cout << "s6: " << (s6.data != nullptr ? s6.data : "nullptr") << '\n';
	std::cout << "s2: " << (s2.data != nullptr ? s2.data : "nullptr") << '\n';
	std::cout << '\n';

	std::cout << "string s7;" << '\n';
	string s7("");
	std::cout << "s7 = std::move(s6);" << '\n';
	s7 = std::move(s6); // move constructor is called, and passed to the copy operator
	std::cout << "s7: " << (s7.data != nullptr ? s7.data : "nullptr") << '\n';
	std::cout << "s6: " << (s6.data != nullptr ? s6.data : "nullptr") << '\n';
	std::cout << '\n';

	std::cout << "string&& s8 = std::move(s7);" << '\n';
	string&& s8 = std::move(s7); // doesn't move, it binds directly the rvalue reference to s7
	std::cout << "s8: " << (s8.data != nullptr ? s8.data : "nullptr") << '\n';
	std::cout << "s7: " << (s7.data != nullptr ? s7.data : "nullptr") << '\n';
	std::cout << "string s9 = s8;" << '\n';
	string s9 = s8; // doesn't move, a rvalue reference is a lvalue
	std::cout << "s9: " << (s9.data != nullptr ? s9.data : "nullptr") << '\n';
	std::cout << "s8: " << (s8.data != nullptr ? s8.data : "nullptr") << '\n';
	std::cout << "s7: " << (s7.data != nullptr ? s7.data : "nullptr") << '\n';
	string s10 = std::move(s8); // doesn't move, a rvalue reference is a lvalue
	std::cout << "string s10 = std::move(s8);" << '\n'; // move constructor
	std::cout << "s10: " << (s10.data != nullptr ? s10.data : "nullptr") << '\n';
	std::cout << "s9: " << (s9.data != nullptr ? s9.data : "nullptr") << '\n';
	std::cout << "s8: " << (s8.data != nullptr ? s8.data : "nullptr") << '\n';
	std::cout << "s7: " << (s7.data != nullptr ? s7.data : "nullptr") << '\n';
	std::cout << '\n';


	return 0;
}
