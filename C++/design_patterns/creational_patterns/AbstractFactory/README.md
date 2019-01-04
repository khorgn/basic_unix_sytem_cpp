# Abstract Factory
## Abstract
Implement an object that handle the choice of instanciation of the concrete object

The goal is to reduce inner complexity and increase modularity by delegating part of the creation.  



## Architecture
```ruby
# The abstract representation of the factory, the concrete implementation of each element hasn't been chosen
class AbstractFactory:
    public:
    createProductA()
    createProductB()
# The abstract representation of a product A
class AbstractProductA
# The abstract representation of a product B
class AbstractProductB

class ProductA1 extend AbstractProductA
class ProductA2 extend AbstractProductA

class ProductB1 extend AbstractProductB
class ProductB2 extend AbstractProductB

class Factory1 extend AbstractFactory :
    public:
    createProductA()
    createProductB()

class Factory2 extend AbstractFactory :
    public:
    createProductA()
    createProductB()

# calls AbstractFactory to construct a concrete product
class Client

```


## Notes
