project (Catch)

# Header only library, therefore INTERFACE
# equivalent to add_executable for libraries
add_library(catch INTERFACE)

# INTERFACE targets only have INTERFACE properties
# means it's not used for the target itself, it's passed to any user of the target
target_include_directories (catch INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/include)

target_compile_features(catch INTERFACE cxx_std_11)
