# Singleton
## Abstract
A class ensuring only one instance exists at all times


## Architecture
```ruby

class Singleton
    @@instance
    def initialize()
    end

    def self.instance
        if(@@instance == nil)
            @@instance = Singleton.new
        end
        @@instance
    end

    private_class_method :new
end

```


## Notes
In C++ a static variable in a function can sometime be better