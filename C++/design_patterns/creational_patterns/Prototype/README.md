# Prototype
## Abstract
A class giving access to cloning and initializing itself, for when new allocation are more expensive (not frequent)

It ressemble abstract factory and can be used in similar ways

## Architecture
```ruby

class Client
    @prototype
    def initialize()
        @prototype = Prototype.new
    end

    def operation()
        p = @prototype.clone
        p.action
    end
end

class Prototype
    def clone()
    end
    def action()
    end
end

class ConcretePrototype1 < Prototype
    def clone()
        # return copy of self
    end
    def action()
        # ...
    end
end

class ConcretePrototype2 < Prototype
    def clone()
        # return copy of self
    end
    def action()
        # ...
    end
end

```


## Notes
