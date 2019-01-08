# Constructors

* copy constructors
  ```c++
  T(T data);
  
  T second(first) # copy constructor
  T third(first) # copy constructor
  ```
* copy assignment operator
  ```c++
  T& operator=(const T& data);
  T& operator=(T data);
  
  second = third # copy assignment operator
  ```
* move constructor
  ```c++
  T(T&& data);
  ```

* move assignment operator
  ```c++
  T& operator=(T&& data);
  ```


* Conversion constructor (called by static_cast)
  ```c++
  T(T2&);
  ```

* Conversion operator (called by static_cast)
  ```c++
  T2& operator T2();
  ```
