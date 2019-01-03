# Factory Method
## Abstract
A method returning an interface, it allows the children of the owning class to decides which implementation of the interface should be used

It is different from template method in that it doesn't direct a process or clarify the order of an action, it only decides which implementation to instanciate

## Architecture
```ruby
# The class/interface declaring the factory method
class Creator
begin
    aFactoryMethod()
    anOperation()
    begin
        product = aFactoryMethod()
    end
end
# A subclass/implementation of the Creator
class ConcreteCreator extend Creator
begin
    override aFactoryMethod()
    begin
        return new ConcreteProduct
    end
end
# An abstract product
class Product
# A concrete product
class ConcreteProduct extend Product

```


## Notes
The factory method can also be parameterized, to allow differents instances and kind of products to be instanciated depending on the parameters

In the default architecture, a new concrete product requires subclassing the creator again, even in the case were the only thing changing is the type of the object instanciated.  
In this kind of situation, the creator can be templated to not require subclassing if nothing else needs to be changed.  
ex:
```c++
template<class TheProduct> class StandardCreator : public Creator
{
    public:
    virtual Product* createProduct()
    {
        return new TheProduct;
    }
};
```

Abstract factories are often implemented with factory methods, and factory methods are often called in template methods