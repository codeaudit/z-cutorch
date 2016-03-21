# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

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
CMAKE_SOURCE_DIR = /home/philipp/projects/zcutorch

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/philipp/projects/zcutorch/build

# Utility rule file for zcudatensormathwrap.

# Include the progress variables for this target.
include CMakeFiles/zcudatensormathwrap.dir/progress.make

CMakeFiles/zcudatensormathwrap: TensorMath.c

TensorMath.c: ../TensorMath.lua
	$(CMAKE_COMMAND) -E cmake_progress_report /home/philipp/projects/zcutorch/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating TensorMath.c"
	cd /home/philipp/projects/zcutorch && /home/philipp/torch/install/bin/luajit /home/philipp/projects/zcutorch/TensorMath.lua /home/philipp/projects/zcutorch/build/TensorMath.c

zcudatensormathwrap: CMakeFiles/zcudatensormathwrap
zcudatensormathwrap: TensorMath.c
zcudatensormathwrap: CMakeFiles/zcudatensormathwrap.dir/build.make
.PHONY : zcudatensormathwrap

# Rule to build all files generated by this target.
CMakeFiles/zcudatensormathwrap.dir/build: zcudatensormathwrap
.PHONY : CMakeFiles/zcudatensormathwrap.dir/build

CMakeFiles/zcudatensormathwrap.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/zcudatensormathwrap.dir/cmake_clean.cmake
.PHONY : CMakeFiles/zcudatensormathwrap.dir/clean

CMakeFiles/zcudatensormathwrap.dir/depend:
	cd /home/philipp/projects/zcutorch/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/philipp/projects/zcutorch /home/philipp/projects/zcutorch /home/philipp/projects/zcutorch/build /home/philipp/projects/zcutorch/build /home/philipp/projects/zcutorch/build/CMakeFiles/zcudatensormathwrap.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/zcudatensormathwrap.dir/depend

