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
CMAKE_SOURCE_DIR = /home/hugo/Programming/C++/TemperatureBot/TemperatureReader

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hugo/Programming/C++/TemperatureBot/TemperatureReader/Release

# Include any dependencies generated for this target.
include src/CMakeFiles/TemperatureReader_prog.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/TemperatureReader_prog.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/TemperatureReader_prog.dir/flags.make

src/CMakeFiles/TemperatureReader_prog.dir/main.cpp.o: src/CMakeFiles/TemperatureReader_prog.dir/flags.make
src/CMakeFiles/TemperatureReader_prog.dir/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hugo/Programming/C++/TemperatureBot/TemperatureReader/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/TemperatureReader_prog.dir/main.cpp.o"
	cd /home/hugo/Programming/C++/TemperatureBot/TemperatureReader/Release/src && /usr/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TemperatureReader_prog.dir/main.cpp.o -c /home/hugo/Programming/C++/TemperatureBot/TemperatureReader/src/main.cpp

src/CMakeFiles/TemperatureReader_prog.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TemperatureReader_prog.dir/main.cpp.i"
	cd /home/hugo/Programming/C++/TemperatureBot/TemperatureReader/Release/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hugo/Programming/C++/TemperatureBot/TemperatureReader/src/main.cpp > CMakeFiles/TemperatureReader_prog.dir/main.cpp.i

src/CMakeFiles/TemperatureReader_prog.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TemperatureReader_prog.dir/main.cpp.s"
	cd /home/hugo/Programming/C++/TemperatureBot/TemperatureReader/Release/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hugo/Programming/C++/TemperatureBot/TemperatureReader/src/main.cpp -o CMakeFiles/TemperatureReader_prog.dir/main.cpp.s

src/CMakeFiles/TemperatureReader_prog.dir/main.cpp.o.requires:

.PHONY : src/CMakeFiles/TemperatureReader_prog.dir/main.cpp.o.requires

src/CMakeFiles/TemperatureReader_prog.dir/main.cpp.o.provides: src/CMakeFiles/TemperatureReader_prog.dir/main.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/TemperatureReader_prog.dir/build.make src/CMakeFiles/TemperatureReader_prog.dir/main.cpp.o.provides.build
.PHONY : src/CMakeFiles/TemperatureReader_prog.dir/main.cpp.o.provides

src/CMakeFiles/TemperatureReader_prog.dir/main.cpp.o.provides.build: src/CMakeFiles/TemperatureReader_prog.dir/main.cpp.o


# Object files for target TemperatureReader_prog
TemperatureReader_prog_OBJECTS = \
"CMakeFiles/TemperatureReader_prog.dir/main.cpp.o"

# External object files for target TemperatureReader_prog
TemperatureReader_prog_EXTERNAL_OBJECTS =

src/TemperatureReader_prog: src/CMakeFiles/TemperatureReader_prog.dir/main.cpp.o
src/TemperatureReader_prog: src/CMakeFiles/TemperatureReader_prog.dir/build.make
src/TemperatureReader_prog: src/libTemperatureReader_lib.so
src/TemperatureReader_prog: src/CMakeFiles/TemperatureReader_prog.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hugo/Programming/C++/TemperatureBot/TemperatureReader/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable TemperatureReader_prog"
	cd /home/hugo/Programming/C++/TemperatureBot/TemperatureReader/Release/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TemperatureReader_prog.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/TemperatureReader_prog.dir/build: src/TemperatureReader_prog

.PHONY : src/CMakeFiles/TemperatureReader_prog.dir/build

src/CMakeFiles/TemperatureReader_prog.dir/requires: src/CMakeFiles/TemperatureReader_prog.dir/main.cpp.o.requires

.PHONY : src/CMakeFiles/TemperatureReader_prog.dir/requires

src/CMakeFiles/TemperatureReader_prog.dir/clean:
	cd /home/hugo/Programming/C++/TemperatureBot/TemperatureReader/Release/src && $(CMAKE_COMMAND) -P CMakeFiles/TemperatureReader_prog.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/TemperatureReader_prog.dir/clean

src/CMakeFiles/TemperatureReader_prog.dir/depend:
	cd /home/hugo/Programming/C++/TemperatureBot/TemperatureReader/Release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hugo/Programming/C++/TemperatureBot/TemperatureReader /home/hugo/Programming/C++/TemperatureBot/TemperatureReader/src /home/hugo/Programming/C++/TemperatureBot/TemperatureReader/Release /home/hugo/Programming/C++/TemperatureBot/TemperatureReader/Release/src /home/hugo/Programming/C++/TemperatureBot/TemperatureReader/Release/src/CMakeFiles/TemperatureReader_prog.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/TemperatureReader_prog.dir/depend

