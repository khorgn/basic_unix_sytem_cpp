# Facade
## Abstract
A gathering of the interfaces of a subsystem into a single simplified interface for general facilities and operations of the subsystem, to simplify access for other subsystems and hide inner architecture. The general interface can stay usable, when more complex operations are required.

It can be also be used to decouple subsystem with dependencies to other subsystems. By making their dependencies pass through the facade, it simplify the possibly complex nature of their dependencies and make them more weakly linked  
(idem if one wants multiple layers of subsystem incrementally more atomic, communication can be handled through the facades)

## Architecture
```ruby

class Client
    def initialize
    end

    def self.action
        @facade.action1
    end
end

class Facade
    def action1
        # succession of calls to complex operations in the classes of the subsystem
    end
end

class Subsystem1
    # ...
end

# ...

class SubsystemN
    # ...
end
```


## Notes
The classes of the subsystem have no knowledge of the facade