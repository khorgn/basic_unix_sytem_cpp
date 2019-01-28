# Flyweight
## Abstract
A way of representing objects by separating intrinsic data (information independent of the flyweight's context) to extrinsic data (information dependent on its context).  
The intrinsic data can be shared between objects, reducing space.  
The extrinsic data cannot be shared.  
> Ex: a text document, each character is an object, but each object "a" doesn't need to store that is represent "a"


## Architecture
```ruby
#========== Class Diagram ==========#
# calls the FlyweightFactory to get new flyweights
# Maintain a reference to the different flyweights
# compute or store the extrinsic state of flyweights
class Client
end

class FlyweightFactory
    def initialize
        @flyweights = new HashMaps<Flyweight>()
    end

    def self.getFlyweight(key)
        if @flyweights.contains(key)
            return @flyweights.get(key)
        else
            f = createFlyweight(key)
            if canBeShared(f)
                @flyweights.put(key, f)
            end
            return f
        end
    end

    private
    begin
        def self.createFlyweight(key)
            # create the new flyweight
        end
        def self.canBeShared(flyweight)
        end
    end
end

# The object enabling sharing for its children
class Flyweight
    def operation(extrinsic_state)
        # Do operation that depends on the state of the flyweight
    end
end

# The object containing only intrinsic data, thus being shareable
class ConcreteFlyweight > Flyweight
    def initialize(intrinsic_state)
        @intrinsic_state = intrinsic_state
    end
    def operation(extrinsic_state)
    end
end

# The object containing extrinsic data, and not being shareable
# A common representation is to have shared objects as children
class UnsharedConcreteFlyweight > Flyweight
    def initialize(all_state)
        @all_state = all_state
    end
    def operation(extrinsic_state)
        # doesn't really care about the extrinsic_state, since it already store it in @all_state
    end
end
```


## Notes
* Ideally, the extrinsic state can be computed from a much smaller data structure.  
* In the case of composite objects, like graphs were the leaves are shared, the leaves can't keep a reference to their parent (being shared) and will get it from the extrinsic state passed as parameter instead.  
* The shared objects lifetime needs to be managed. In case of small enough number of shared objects (ASCII chars), they can be static. Else there need to be reference counting to remove them when not needed.