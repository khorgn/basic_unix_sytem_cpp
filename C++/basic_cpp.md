# Constructors

* copy constructors
```C++
T(T data);

T second(first) # copy constructor
T third(first) # copy constructor
```
* copy assignment operator
```C++
T& operator=(const T& data);
T& operator=(T data);

second = third # copy assignment operator
```
* move constructor
```
T(T&& data);
```

* move assignment operator
```
T& operator=(T&& data);
```


* Conversion constructor (called by static_cast)
```
T(T2&);
```

* Conversion operator (called by static_cast)
```
T2& operator T2();
```
