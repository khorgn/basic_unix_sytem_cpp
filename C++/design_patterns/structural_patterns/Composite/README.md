# Composite
## Abstract
An architecture representing a complex object with recursive ownership


## Architecture
```ruby

class Client
    # uses the Component
end

class Component
    def operation
    end

    def add(component)
    end

    def remove(component)
    end

    def getChild(n)
    end

    def getParent
    end
end

class Leaf < Component
    def operation
    end
end

class Composite < Component
    @children # list of component

    def operation
        for g in @children
            g.operation
        end
    end

    def add(component)
    end

    def remove(component)
    end

    def getChild(n)
    end
end

```


## Notes
