# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/hugo/Documents/Programming/C++/cmake/cmake1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hugo/Documents/Programming/C++/cmake/cmake1/build

# Include any dependencies generated for this target.
include CMakeFiles/HelloCMake.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/HelloCMake.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/HelloCMake.dir/flags.make

CMakeFiles/HelloCMake.dir/main.cpp.o: CMakeFiles/HelloCMake.dir/flags.make
CMakeFiles/HelloCMake.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hugo/Documents/Programming/C++/cmake/cmake1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/HelloCMake.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/HelloCMake.dir/main.cpp.o -c /home/hugo/Documents/Programming/C++/cmake/cmake1/main.cpp

CMakeFiles/HelloCMake.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HelloCMake.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hugo/Documents/Programming/C++/cmake/cmake1/main.cpp > CMakeFiles/HelloCMake.dir/main.cpp.i

CMakeFiles/HelloCMake.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HelloCMake.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hugo/Documents/Programming/C++/cmake/cmake1/main.cpp -o CMakeFiles/HelloCMake.dir/main.cpp.s

CMakeFiles/HelloCMake.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/HelloCMake.dir/main.cpp.o.requires

CMakeFiles/HelloCMake.dir/main.cpp.o.provides: CMakeFiles/HelloCMake.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/HelloCMake.dir/build.make CMakeFiles/HelloCMake.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/HelloCMake.dir/main.cpp.o.provides

CMakeFiles/HelloCMake.dir/main.cpp.o.provides.build: CMakeFiles/HelloCMake.dir/main.cpp.o


CMakeFiles/HelloCMake.dir/hello.cpp.o: CMakeFiles/HelloCMake.dir/flags.make
CMakeFiles/HelloCMake.dir/hello.cpp.o: ../hello.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hugo/Documents/Programming/C++/cmake/cmake1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/HelloCMake.dir/hello.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/HelloCMake.dir/hello.cpp.o -c /home/hugo/Documents/Programming/C++/cmake/cmake1/hello.cpp

CMakeFiles/HelloCMake.dir/hello.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HelloCMake.dir/hello.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hugo/Documents/Programming/C++/cmake/cmake1/hello.cpp > CMakeFiles/HelloCMake.dir/hello.cpp.i

CMakeFiles/HelloCMake.dir/hello.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HelloCMake.dir/hello.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hugo/Documents/Programming/C++/cmake/cmake1/hello.cpp -o CMakeFiles/HelloCMake.dir/hello.cpp.s

CMakeFiles/HelloCMake.dir/hello.cpp.o.requires:

.PHONY : CMakeFiles/HelloCMake.dir/hello.cpp.o.requires

CMakeFiles/HelloCMake.dir/hello.cpp.o.provides: CMakeFiles/HelloCMake.dir/hello.cpp.o.requires
	$(MAKE) -f CMakeFiles/HelloCMake.dir/build.make CMakeFiles/HelloCMake.dir/hello.cpp.o.provides.build
.PHONY : CMakeFiles/HelloCMake.dir/hello.cpp.o.provides

CMakeFiles/HelloCMake.dir/hello.cpp.o.provides.build: CMakeFiles/HelloCMake.dir/hello.cpp.o


# Object files for target HelloCMake
HelloCMake_OBJECTS = \
"CMakeFiles/HelloCMake.dir/main.cpp.o" \
"CMakeFiles/HelloCMake.dir/hello.cpp.o"

# External object files for target HelloCMake
HelloCMake_EXTERNAL_OBJECTS =

HelloCMake: CMakeFiles/HelloCMake.dir/main.cpp.o
HelloCMake: CMakeFiles/HelloCMake.dir/hello.cpp.o
HelloCMake: CMakeFiles/HelloCMake.dir/build.make
HelloCMake: CMakeFiles/HelloCMake.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hugo/Documents/Programming/C++/cmake/cmake1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable HelloCMake"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/HelloCMake.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/HelloCMake.dir/build: HelloCMake

.PHONY : CMakeFiles/HelloCMake.dir/build

CMakeFiles/HelloCMake.dir/requires: CMakeFiles/HelloCMake.dir/main.cpp.o.requires
CMakeFiles/HelloCMake.dir/requires: CMakeFiles/HelloCMake.dir/hello.cpp.o.requires

.PHONY : CMakeFiles/HelloCMake.dir/requires

CMakeFiles/HelloCMake.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/HelloCMake.dir/cmake_clean.cmake
.PHONY : CMakeFiles/HelloCMake.dir/clean

CMakeFiles/HelloCMake.dir/depend:
	cd /home/hugo/Documents/Programming/C++/cmake/cmake1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hugo/Documents/Programming/C++/cmake/cmake1 /home/hugo/Documents/Programming/C++/cmake/cmake1 /home/hugo/Documents/Programming/C++/cmake/cmake1/build /home/hugo/Documents/Programming/C++/cmake/cmake1/build /home/hugo/Documents/Programming/C++/cmake/cmake1/build/CMakeFiles/HelloCMake.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/HelloCMake.dir/depend

