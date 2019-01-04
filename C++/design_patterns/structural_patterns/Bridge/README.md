# Bridge
## Abstract
Implement an abstraction through composition instead of inheritance  
The goal is to have the implementor weakly linked to the abstraction, allowing chidlren of the abstraction (refined abstractions) to call methods of the implementor and the methods overriden by its children (the concrete implementors)  
The relation between the main abstraction and the main implementor is the bridge between refined abstraction and concrete implementor



## Architecture
```ruby
# The abstract representation of a window
# typically provides higher-level operations using the primitive operations
class Window
    @imp # WindowImp
    def action1
        ...
        @imp.methodA
        ...
    end
end
# The concrete representation of a window
# typically only provides primitive operations whose details depend on a platform/context
class WindowImp
    def methodA
    end
    def methodB
    end
end
# The abstract representation of a subclass of window, an icon
class IconWindow < Window
    def action2
    end
end
# The concrete implementation of a window using the X framework
class XWindowImp < WindowImp
    def methodA
    end
    def methodB
    end
end

```


## Notes
The creation of the implementor object can be managed by an abstract factory building the abstraction and the implementor