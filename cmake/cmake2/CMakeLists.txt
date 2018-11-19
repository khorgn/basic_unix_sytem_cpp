cmake_minimum_required (VERSION 3.10)

project (hello_cmake)

if (UNIX)
	add_compile_options(-Wall -Wextra -pedantic -Werror)
else ()

endif()

add_subdirectory(thirdparty/catch)
add_subdirectory(src)
add_subdirectory(test)

