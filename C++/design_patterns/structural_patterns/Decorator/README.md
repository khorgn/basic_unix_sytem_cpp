# Decorator
## Abstract
A hierarchical representation of an object, to allow a modular behavior

The object's components are separated into a concrete component, which is at the bottom of the hierarchy, and decorator components, containing other decorator or a concrete component

Different from _Strategy_ in its order and general use, a strategy would the equivalent of the component containing the chosen strategy (and possible substrategies owned by strategies, similar to decorators) it forces the main class to be heavier, because it must take into account possible new strategies, but can be better when it's already too heavy to use _Decorator_

## Architecture
```ruby

class Client
    def initialize()
    end

    def self.action
    end
end

class Component
    # an operation that allows added behavior
    def operation
    end
end

class ConcreteComponent < Component
    def operation
        # a concrete action, e.g displays a text
    end
end

class Decorator < Component
    def initialize(component)
        @component = component
    end
    def operation
        @component.operation
    end
    private
    @component # Component
end

class ConcreteDecoratorA < Component
    def initialize(component, parameter)
        # ...
    end
    def operation
        super
        # uses/modifies the state
    end
    private
    @addedState
end

class ConcreteDecoratorB < Component
    def initialize(component, event)
        # ...
    end
    def operation
        super
        addedBehavior
    end
    def addedBehavior
    end
end

```

## Example object

```ruby

object = ConcreteComponent.new
content = ConcreteDecoratorA.new(ConcreteDecoratorB.new(object))

content.operation
=begin
ConcreteComponent.operation ; ConcreteDecoratorB.operation ; ConcreteDecoratorA.operation
=end

__END__
The client directly has access to the object for when it needs to do actions that are not in the Component interface.  
It doesn't know the existence of the decorators and will use content when it needs to do actions present in the general interface.

```


## Notes
The super can also be put at the end or in the middle of the overridden method, depending on the wished order of execution for the components

A _Decorator_ lets you change the "skin" of an object, while a _Strategy_ lets you change the guts