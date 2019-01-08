# L-value R-value references
[reference values](https://en.cppreference.com/w/cpp/language/reference)
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
```c++
int v[20];
int& g(int i) { return v[i]; }
g(3) = 7;
```
```c++
struct link { link* next; };
link* first;
void h(link*& p) { // p is a reference to pointer
	p->next = first;
	first = p;
	p = 0;
}

void k() {
	link* q = new link;
	h(q);
}
```

## R-value reference
can be used to extend the lifetime of a temporary object (lvalue references to const can too, but can't be modified through them)  
can bind to __pr-value__ and __x-value__ 
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
can bind to __xvalue__ (non-temporary object)
```c++
int i2 = 42;
int&& rri = std::move(i2); // bind directly to i2
```

a __named rvalue reference__ is an lvalue
```c++
void foo(int&& t) {
	// t is initialized with an rvalue expression
	// but is actually an lvalue expression itself
}
```
```c++
Foo::Foo(T&& _t) : t{_t} {} // copies _t to t, because _t is an lvalue
Foo::Foo(T&& _t) : t{std::move(_t)} {} // needs to force move if you want to move
```


# L-value X-value Pr-value / GL-value R-value
[https://en.cppreference.com/w/cpp/language/value_category]  
[https://stackoverflow.com/questions/3601602/what-are-rvalues-lvalues-xvalues-glvalues-and-prvalues]

```

      expression
    ______ ______
   /      X      \
  /      / \      \
 |   l  | x |  pr  |
  \      \ /      /
   \______X______/
       gl    r

```

The three primary type of values, all expression is exactly part of one of these value-type

## lvalue ("left value")
__lvalue__ designates a function or an object -
*e.g.* for E a pointer type expression, then `*E` is an lvalue expression refering to the object pointed by `E`  

## prvalue (pure rvalue)
__prvalues__ are values who have no identification (no given address or name) and can be moved (implicitly) (because they will disapear anyway if not moved).  
*e.g.* 12, 7.3e5, true, a return value that is not a reference
## xvalue (expiring value)
__xvalue__ refers to an object, like lvalue, that is at the end of its lifetime (and can thus be implicitly moved).  
an __xvalue__ is the result of certain kind of expressions involving rvalue references (such as a function returning a rvalue reference (T&&))

## glvalue (global lvalue)
an __glvalue__ is an __lvalue__  

## rvalue ("right value")
an __rvalue__ is an __xvalue__ (a temporary object) or a value not associated with an object


# Notes
the existance of these five value categories come from the difference between __named rvalue reference__ and __unnamed rvalue reference__.  
* a __named rvalue reference__ is an lvalue, because it can't be moved implicitly  
* an __unnamed rvalue reference__ is an xvalue, because it can be moved implicitly (std::move returns this, so it needs to be movable => not an lvalue)  
  in the case of POD objects, it can be on the left side of an expression in opposision to a prvalue => not a prvalue (the ex-rvalue)  
  in the case of non-POD objects, it's more complicated, because prvalues can be on the left side
  ```c++
  class X {};
  X foo() { returnX(); }
  
  int main()
  {
      foo() = X();
  }
  ```
  the difference comes from lifetime extension. A prvalue can gets its lifetime extended by being binded to a rvalue reference, which will not happen with a xvalue
  ```c++
  class X
  {
      X() : x(5) {}
      int x;
  };

  X foo() { return X(); }
  X&& goo() { return std::move(X()); } // terrible coding, but makes the point

  int main()
  {
      foo() = X();
      X&& x1 = foo(); // prvalue - lifetime extended. Object resides directly on stack as return value (its static type is guaranted to be its dynamic type)
      X&& x2 = goo(); // xvalue - lifetime not extended. Object resides somewhere else (and its type could be polymorphic, its dynamic type is unknown at compile time)
      x1.x = 6;
      x2.x = 7; // Danger

      std::cout << x1.x << std::endl; // Just fine
      std::cout << x2.x << std::endl; // Undefined behavior (print random values)
  }
  ```


*[POD]: Plain Old Data, references plain types, structures without constructors/destructors, and classes acting as structures
