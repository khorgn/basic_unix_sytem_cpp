# setup flags
SET (CXX_FLAGS "-Wall -Wextra -pedantic")  
SET (CC_FLAGS "-Wall -Wextra -pedantic")


# setup debug and release builds
`mkdir Debug && cd "$_"`  
`cmake -DCMAKE_BUILDTYPE=Debug ..`  

`mkdir Release && cd "$_"`  
`cmake -DCMAKE_BUILDTYPE=Release ..`
