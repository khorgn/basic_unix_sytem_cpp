# Adapter
## Abstract
Converts the interface of a class into another interface needed by the client

Different from bridge in the goal. Adapter take an existing interface and converts it to be used as implementation of another interface.  
Bridge is knowingly made this way from the start, to only have a weak link between an abstraction/its refinements and the concrete implementations


## Architecture
```ruby

class Client
    def initialize()
    end

    def self.action
        # calls the target's interface
    end
end

class Target
    def request
    end
end

class Adapter < Target
    def initialize
        @adaptee = Adaptee.new
    end
    def request
        @adaptee.specificRequest
    end
end

class Adaptee
    def specificRequest
        # ...
    end
end

```


## Notes
