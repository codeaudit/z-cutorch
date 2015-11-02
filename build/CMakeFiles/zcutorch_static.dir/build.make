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

# Include any dependencies generated for this target.
include CMakeFiles/zcutorch_static.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/zcutorch_static.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/zcutorch_static.dir/flags.make

TensorMath.c: ../TensorMath.lua
	$(CMAKE_COMMAND) -E cmake_progress_report /home/philipp/projects/zcutorch/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating TensorMath.c"
	cd /home/philipp/projects/zcutorch && /home/philipp/torch/install/bin/luajit /home/philipp/projects/zcutorch/TensorMath.lua /home/philipp/projects/zcutorch/build/TensorMath.c

CMakeFiles/zcutorch_static.dir/Storage.c.o: CMakeFiles/zcutorch_static.dir/flags.make
CMakeFiles/zcutorch_static.dir/Storage.c.o: ../Storage.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/philipp/projects/zcutorch/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/zcutorch_static.dir/Storage.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/zcutorch_static.dir/Storage.c.o   -c /home/philipp/projects/zcutorch/Storage.c

CMakeFiles/zcutorch_static.dir/Storage.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zcutorch_static.dir/Storage.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/philipp/projects/zcutorch/Storage.c > CMakeFiles/zcutorch_static.dir/Storage.c.i

CMakeFiles/zcutorch_static.dir/Storage.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zcutorch_static.dir/Storage.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/philipp/projects/zcutorch/Storage.c -o CMakeFiles/zcutorch_static.dir/Storage.c.s

CMakeFiles/zcutorch_static.dir/Storage.c.o.requires:
.PHONY : CMakeFiles/zcutorch_static.dir/Storage.c.o.requires

CMakeFiles/zcutorch_static.dir/Storage.c.o.provides: CMakeFiles/zcutorch_static.dir/Storage.c.o.requires
	$(MAKE) -f CMakeFiles/zcutorch_static.dir/build.make CMakeFiles/zcutorch_static.dir/Storage.c.o.provides.build
.PHONY : CMakeFiles/zcutorch_static.dir/Storage.c.o.provides

CMakeFiles/zcutorch_static.dir/Storage.c.o.provides.build: CMakeFiles/zcutorch_static.dir/Storage.c.o

CMakeFiles/zcutorch_static.dir/init.c.o: CMakeFiles/zcutorch_static.dir/flags.make
CMakeFiles/zcutorch_static.dir/init.c.o: ../init.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/philipp/projects/zcutorch/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/zcutorch_static.dir/init.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/zcutorch_static.dir/init.c.o   -c /home/philipp/projects/zcutorch/init.c

CMakeFiles/zcutorch_static.dir/init.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zcutorch_static.dir/init.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/philipp/projects/zcutorch/init.c > CMakeFiles/zcutorch_static.dir/init.c.i

CMakeFiles/zcutorch_static.dir/init.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zcutorch_static.dir/init.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/philipp/projects/zcutorch/init.c -o CMakeFiles/zcutorch_static.dir/init.c.s

CMakeFiles/zcutorch_static.dir/init.c.o.requires:
.PHONY : CMakeFiles/zcutorch_static.dir/init.c.o.requires

CMakeFiles/zcutorch_static.dir/init.c.o.provides: CMakeFiles/zcutorch_static.dir/init.c.o.requires
	$(MAKE) -f CMakeFiles/zcutorch_static.dir/build.make CMakeFiles/zcutorch_static.dir/init.c.o.provides.build
.PHONY : CMakeFiles/zcutorch_static.dir/init.c.o.provides

CMakeFiles/zcutorch_static.dir/init.c.o.provides.build: CMakeFiles/zcutorch_static.dir/init.c.o

CMakeFiles/zcutorch_static.dir/Tensor.c.o: CMakeFiles/zcutorch_static.dir/flags.make
CMakeFiles/zcutorch_static.dir/Tensor.c.o: ../Tensor.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/philipp/projects/zcutorch/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/zcutorch_static.dir/Tensor.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/zcutorch_static.dir/Tensor.c.o   -c /home/philipp/projects/zcutorch/Tensor.c

CMakeFiles/zcutorch_static.dir/Tensor.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zcutorch_static.dir/Tensor.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/philipp/projects/zcutorch/Tensor.c > CMakeFiles/zcutorch_static.dir/Tensor.c.i

CMakeFiles/zcutorch_static.dir/Tensor.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zcutorch_static.dir/Tensor.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/philipp/projects/zcutorch/Tensor.c -o CMakeFiles/zcutorch_static.dir/Tensor.c.s

CMakeFiles/zcutorch_static.dir/Tensor.c.o.requires:
.PHONY : CMakeFiles/zcutorch_static.dir/Tensor.c.o.requires

CMakeFiles/zcutorch_static.dir/Tensor.c.o.provides: CMakeFiles/zcutorch_static.dir/Tensor.c.o.requires
	$(MAKE) -f CMakeFiles/zcutorch_static.dir/build.make CMakeFiles/zcutorch_static.dir/Tensor.c.o.provides.build
.PHONY : CMakeFiles/zcutorch_static.dir/Tensor.c.o.provides

CMakeFiles/zcutorch_static.dir/Tensor.c.o.provides.build: CMakeFiles/zcutorch_static.dir/Tensor.c.o

CMakeFiles/zcutorch_static.dir/TensorMath.c.o: CMakeFiles/zcutorch_static.dir/flags.make
CMakeFiles/zcutorch_static.dir/TensorMath.c.o: TensorMath.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/philipp/projects/zcutorch/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/zcutorch_static.dir/TensorMath.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/zcutorch_static.dir/TensorMath.c.o   -c /home/philipp/projects/zcutorch/build/TensorMath.c

CMakeFiles/zcutorch_static.dir/TensorMath.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zcutorch_static.dir/TensorMath.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/philipp/projects/zcutorch/build/TensorMath.c > CMakeFiles/zcutorch_static.dir/TensorMath.c.i

CMakeFiles/zcutorch_static.dir/TensorMath.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zcutorch_static.dir/TensorMath.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/philipp/projects/zcutorch/build/TensorMath.c -o CMakeFiles/zcutorch_static.dir/TensorMath.c.s

CMakeFiles/zcutorch_static.dir/TensorMath.c.o.requires:
.PHONY : CMakeFiles/zcutorch_static.dir/TensorMath.c.o.requires

CMakeFiles/zcutorch_static.dir/TensorMath.c.o.provides: CMakeFiles/zcutorch_static.dir/TensorMath.c.o.requires
	$(MAKE) -f CMakeFiles/zcutorch_static.dir/build.make CMakeFiles/zcutorch_static.dir/TensorMath.c.o.provides.build
.PHONY : CMakeFiles/zcutorch_static.dir/TensorMath.c.o.provides

CMakeFiles/zcutorch_static.dir/TensorMath.c.o.provides.build: CMakeFiles/zcutorch_static.dir/TensorMath.c.o

CMakeFiles/zcutorch_static.dir/TensorOperator.c.o: CMakeFiles/zcutorch_static.dir/flags.make
CMakeFiles/zcutorch_static.dir/TensorOperator.c.o: ../TensorOperator.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/philipp/projects/zcutorch/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/zcutorch_static.dir/TensorOperator.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/zcutorch_static.dir/TensorOperator.c.o   -c /home/philipp/projects/zcutorch/TensorOperator.c

CMakeFiles/zcutorch_static.dir/TensorOperator.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zcutorch_static.dir/TensorOperator.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/philipp/projects/zcutorch/TensorOperator.c > CMakeFiles/zcutorch_static.dir/TensorOperator.c.i

CMakeFiles/zcutorch_static.dir/TensorOperator.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zcutorch_static.dir/TensorOperator.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/philipp/projects/zcutorch/TensorOperator.c -o CMakeFiles/zcutorch_static.dir/TensorOperator.c.s

CMakeFiles/zcutorch_static.dir/TensorOperator.c.o.requires:
.PHONY : CMakeFiles/zcutorch_static.dir/TensorOperator.c.o.requires

CMakeFiles/zcutorch_static.dir/TensorOperator.c.o.provides: CMakeFiles/zcutorch_static.dir/TensorOperator.c.o.requires
	$(MAKE) -f CMakeFiles/zcutorch_static.dir/build.make CMakeFiles/zcutorch_static.dir/TensorOperator.c.o.provides.build
.PHONY : CMakeFiles/zcutorch_static.dir/TensorOperator.c.o.provides

CMakeFiles/zcutorch_static.dir/TensorOperator.c.o.provides.build: CMakeFiles/zcutorch_static.dir/TensorOperator.c.o

CMakeFiles/zcutorch_static.dir/torch/utils.c.o: CMakeFiles/zcutorch_static.dir/flags.make
CMakeFiles/zcutorch_static.dir/torch/utils.c.o: ../torch/utils.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/philipp/projects/zcutorch/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/zcutorch_static.dir/torch/utils.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/zcutorch_static.dir/torch/utils.c.o   -c /home/philipp/projects/zcutorch/torch/utils.c

CMakeFiles/zcutorch_static.dir/torch/utils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zcutorch_static.dir/torch/utils.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/philipp/projects/zcutorch/torch/utils.c > CMakeFiles/zcutorch_static.dir/torch/utils.c.i

CMakeFiles/zcutorch_static.dir/torch/utils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zcutorch_static.dir/torch/utils.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/philipp/projects/zcutorch/torch/utils.c -o CMakeFiles/zcutorch_static.dir/torch/utils.c.s

CMakeFiles/zcutorch_static.dir/torch/utils.c.o.requires:
.PHONY : CMakeFiles/zcutorch_static.dir/torch/utils.c.o.requires

CMakeFiles/zcutorch_static.dir/torch/utils.c.o.provides: CMakeFiles/zcutorch_static.dir/torch/utils.c.o.requires
	$(MAKE) -f CMakeFiles/zcutorch_static.dir/build.make CMakeFiles/zcutorch_static.dir/torch/utils.c.o.provides.build
.PHONY : CMakeFiles/zcutorch_static.dir/torch/utils.c.o.provides

CMakeFiles/zcutorch_static.dir/torch/utils.c.o.provides.build: CMakeFiles/zcutorch_static.dir/torch/utils.c.o

# Object files for target zcutorch_static
zcutorch_static_OBJECTS = \
"CMakeFiles/zcutorch_static.dir/Storage.c.o" \
"CMakeFiles/zcutorch_static.dir/init.c.o" \
"CMakeFiles/zcutorch_static.dir/Tensor.c.o" \
"CMakeFiles/zcutorch_static.dir/TensorMath.c.o" \
"CMakeFiles/zcutorch_static.dir/TensorOperator.c.o" \
"CMakeFiles/zcutorch_static.dir/torch/utils.c.o"

# External object files for target zcutorch_static
zcutorch_static_EXTERNAL_OBJECTS =

libzcutorch.a: CMakeFiles/zcutorch_static.dir/Storage.c.o
libzcutorch.a: CMakeFiles/zcutorch_static.dir/init.c.o
libzcutorch.a: CMakeFiles/zcutorch_static.dir/Tensor.c.o
libzcutorch.a: CMakeFiles/zcutorch_static.dir/TensorMath.c.o
libzcutorch.a: CMakeFiles/zcutorch_static.dir/TensorOperator.c.o
libzcutorch.a: CMakeFiles/zcutorch_static.dir/torch/utils.c.o
libzcutorch.a: CMakeFiles/zcutorch_static.dir/build.make
libzcutorch.a: CMakeFiles/zcutorch_static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C static library libzcutorch.a"
	$(CMAKE_COMMAND) -P CMakeFiles/zcutorch_static.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/zcutorch_static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/zcutorch_static.dir/build: libzcutorch.a
.PHONY : CMakeFiles/zcutorch_static.dir/build

CMakeFiles/zcutorch_static.dir/requires: CMakeFiles/zcutorch_static.dir/Storage.c.o.requires
CMakeFiles/zcutorch_static.dir/requires: CMakeFiles/zcutorch_static.dir/init.c.o.requires
CMakeFiles/zcutorch_static.dir/requires: CMakeFiles/zcutorch_static.dir/Tensor.c.o.requires
CMakeFiles/zcutorch_static.dir/requires: CMakeFiles/zcutorch_static.dir/TensorMath.c.o.requires
CMakeFiles/zcutorch_static.dir/requires: CMakeFiles/zcutorch_static.dir/TensorOperator.c.o.requires
CMakeFiles/zcutorch_static.dir/requires: CMakeFiles/zcutorch_static.dir/torch/utils.c.o.requires
.PHONY : CMakeFiles/zcutorch_static.dir/requires

CMakeFiles/zcutorch_static.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/zcutorch_static.dir/cmake_clean.cmake
.PHONY : CMakeFiles/zcutorch_static.dir/clean

CMakeFiles/zcutorch_static.dir/depend: TensorMath.c
	cd /home/philipp/projects/zcutorch/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/philipp/projects/zcutorch /home/philipp/projects/zcutorch /home/philipp/projects/zcutorch/build /home/philipp/projects/zcutorch/build /home/philipp/projects/zcutorch/build/CMakeFiles/zcutorch_static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/zcutorch_static.dir/depend
