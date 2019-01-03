# Builder
## Abstract
Implement an object that handle the construction of complex objects and allow flexibility in the construction process

The difference between a builder and an abstract factory and a builder is in their goal and their use.  
An abstract factory allows you to choose (or chooses for you depending on the system/context) a child of the abstract object and recover it.  
A builder handles the complexe actions, you tell it to build a room, it adds it to the maze, handle the connections, the walls, ...  

A builder constructs an object steps by steps, while an abstract factory concentrates on the families of the objects, simple or complex


## Architecture
```ruby
# The abstract interface for creating the complex object
class Builder
begin
	public:
	buildPart()
end
# The concrete implementation of the builder, defines clearly a way to build the object, and gives access to a method so the client can recover the results
class ConcreteBuilder extend Builder
begin
    public:
    override buildPart()
    getResult()
    begin
        return m_product
    end

    private:
    Product m_product
end
# Not the client, the one ordering in which order the differents methods of the builder will be called
class Director
begin
    construct()
    begin
        ...
        for i in range
        begin
            m_builder.buildPart()
        end
    end

    private:
    Builder m_builder
end
# The complex product (often composite) being constructed
class Product
# The client ordering the director to construct the object, and gives it an instance of a builder to use. It will then uses the modified builder to access the data it needs (or the data returned by the director, for example the product that will be returned with any concrete builder)
class Client
```


## Notes
