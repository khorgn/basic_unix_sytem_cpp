# L-value R-value references
https://en.cppreference.com/w/cpp/language/reference
## L-value references
aliases
```c++
std::string s = "Ex";
std::string& r1 = s;
const std::string& r2 = s;

r1 += "ample";

std::cout << r2 << '\n';
```

pass-by-reference
```c++
void double_string (std::string& s)
{
	s += s;
}
int main()
{
	std::string str = "Test";
	double_string(str);
	std::cout << str << '\n';
}
```

return type
```c++
char& char_number (std::string& s, std::size_t n)
{
	return s.at(n);
}
int main()
{
	std::string str = "Test";
	char_number(str, 1) = 'a';
	std::cout << str << '\n';
}
```

## R-value reference
can be used to extend the lifetime of a temporary object (lvalue references to const can too, but can't be modified through them)  
can bind to pr-value and x-value
```c++
int main()
{
	std::string s1 = "Test";
	// std::string&& r1 = s1; // Error, can't bind to lvalue
	
	const std::string& r2 = s1 + s1;
	// r2 += "Test"; // Error, can't modify through const reference
	std::string&& r3 = s1 + s1;
	r3 += "Test";
	std::cout << r3 << '\n';
}
```
can bind to xvalue (non-temporary object)
```c++
int i2 = 42;
int&& rri = std::move(i2); // bind directly to i2
```


# GL-value X-value Pr-value
https://en.cppreference.com/w/cpp/language/value_category  
https://stackoverflow.com/questions/3601602/what-are-rvalues-lvalues-xvalues-glvalues-and-prvalues

The three primary type of values, all expression is exactly part of one of these value-type
