# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_COMMAND = /opt/local/bin/cmake

# The command to remove a file.
RM = /opt/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /opt/local/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/macecchi/Desktop/labickinect

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/macecchi/Desktop/labickinect/build

# Include any dependencies generated for this target.
include CMakeFiles/labickinect.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/labickinect.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/labickinect.dir/flags.make

CMakeFiles/labickinect.dir/main.cpp.o: CMakeFiles/labickinect.dir/flags.make
CMakeFiles/labickinect.dir/main.cpp.o: ../main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/macecchi/Desktop/labickinect/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/labickinect.dir/main.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/labickinect.dir/main.cpp.o -c /Users/macecchi/Desktop/labickinect/main.cpp

CMakeFiles/labickinect.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/labickinect.dir/main.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/macecchi/Desktop/labickinect/main.cpp > CMakeFiles/labickinect.dir/main.cpp.i

CMakeFiles/labickinect.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/labickinect.dir/main.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/macecchi/Desktop/labickinect/main.cpp -o CMakeFiles/labickinect.dir/main.cpp.s

CMakeFiles/labickinect.dir/main.cpp.o.requires:
.PHONY : CMakeFiles/labickinect.dir/main.cpp.o.requires

CMakeFiles/labickinect.dir/main.cpp.o.provides: CMakeFiles/labickinect.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/labickinect.dir/build.make CMakeFiles/labickinect.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/labickinect.dir/main.cpp.o.provides

CMakeFiles/labickinect.dir/main.cpp.o.provides.build: CMakeFiles/labickinect.dir/main.cpp.o

CMakeFiles/labickinect.dir/kinect.cpp.o: CMakeFiles/labickinect.dir/flags.make
CMakeFiles/labickinect.dir/kinect.cpp.o: ../kinect.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/macecchi/Desktop/labickinect/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/labickinect.dir/kinect.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/labickinect.dir/kinect.cpp.o -c /Users/macecchi/Desktop/labickinect/kinect.cpp

CMakeFiles/labickinect.dir/kinect.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/labickinect.dir/kinect.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/macecchi/Desktop/labickinect/kinect.cpp > CMakeFiles/labickinect.dir/kinect.cpp.i

CMakeFiles/labickinect.dir/kinect.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/labickinect.dir/kinect.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/macecchi/Desktop/labickinect/kinect.cpp -o CMakeFiles/labickinect.dir/kinect.cpp.s

CMakeFiles/labickinect.dir/kinect.cpp.o.requires:
.PHONY : CMakeFiles/labickinect.dir/kinect.cpp.o.requires

CMakeFiles/labickinect.dir/kinect.cpp.o.provides: CMakeFiles/labickinect.dir/kinect.cpp.o.requires
	$(MAKE) -f CMakeFiles/labickinect.dir/build.make CMakeFiles/labickinect.dir/kinect.cpp.o.provides.build
.PHONY : CMakeFiles/labickinect.dir/kinect.cpp.o.provides

CMakeFiles/labickinect.dir/kinect.cpp.o.provides.build: CMakeFiles/labickinect.dir/kinect.cpp.o

CMakeFiles/labickinect.dir/cv.cpp.o: CMakeFiles/labickinect.dir/flags.make
CMakeFiles/labickinect.dir/cv.cpp.o: ../cv.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/macecchi/Desktop/labickinect/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/labickinect.dir/cv.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/labickinect.dir/cv.cpp.o -c /Users/macecchi/Desktop/labickinect/cv.cpp

CMakeFiles/labickinect.dir/cv.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/labickinect.dir/cv.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/macecchi/Desktop/labickinect/cv.cpp > CMakeFiles/labickinect.dir/cv.cpp.i

CMakeFiles/labickinect.dir/cv.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/labickinect.dir/cv.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/macecchi/Desktop/labickinect/cv.cpp -o CMakeFiles/labickinect.dir/cv.cpp.s

CMakeFiles/labickinect.dir/cv.cpp.o.requires:
.PHONY : CMakeFiles/labickinect.dir/cv.cpp.o.requires

CMakeFiles/labickinect.dir/cv.cpp.o.provides: CMakeFiles/labickinect.dir/cv.cpp.o.requires
	$(MAKE) -f CMakeFiles/labickinect.dir/build.make CMakeFiles/labickinect.dir/cv.cpp.o.provides.build
.PHONY : CMakeFiles/labickinect.dir/cv.cpp.o.provides

CMakeFiles/labickinect.dir/cv.cpp.o.provides.build: CMakeFiles/labickinect.dir/cv.cpp.o

CMakeFiles/labickinect.dir/cv_matcher.cpp.o: CMakeFiles/labickinect.dir/flags.make
CMakeFiles/labickinect.dir/cv_matcher.cpp.o: ../cv_matcher.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/macecchi/Desktop/labickinect/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/labickinect.dir/cv_matcher.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/labickinect.dir/cv_matcher.cpp.o -c /Users/macecchi/Desktop/labickinect/cv_matcher.cpp

CMakeFiles/labickinect.dir/cv_matcher.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/labickinect.dir/cv_matcher.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/macecchi/Desktop/labickinect/cv_matcher.cpp > CMakeFiles/labickinect.dir/cv_matcher.cpp.i

CMakeFiles/labickinect.dir/cv_matcher.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/labickinect.dir/cv_matcher.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/macecchi/Desktop/labickinect/cv_matcher.cpp -o CMakeFiles/labickinect.dir/cv_matcher.cpp.s

CMakeFiles/labickinect.dir/cv_matcher.cpp.o.requires:
.PHONY : CMakeFiles/labickinect.dir/cv_matcher.cpp.o.requires

CMakeFiles/labickinect.dir/cv_matcher.cpp.o.provides: CMakeFiles/labickinect.dir/cv_matcher.cpp.o.requires
	$(MAKE) -f CMakeFiles/labickinect.dir/build.make CMakeFiles/labickinect.dir/cv_matcher.cpp.o.provides.build
.PHONY : CMakeFiles/labickinect.dir/cv_matcher.cpp.o.provides

CMakeFiles/labickinect.dir/cv_matcher.cpp.o.provides.build: CMakeFiles/labickinect.dir/cv_matcher.cpp.o

CMakeFiles/labickinect.dir/detector.cpp.o: CMakeFiles/labickinect.dir/flags.make
CMakeFiles/labickinect.dir/detector.cpp.o: ../detector.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/macecchi/Desktop/labickinect/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/labickinect.dir/detector.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/labickinect.dir/detector.cpp.o -c /Users/macecchi/Desktop/labickinect/detector.cpp

CMakeFiles/labickinect.dir/detector.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/labickinect.dir/detector.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/macecchi/Desktop/labickinect/detector.cpp > CMakeFiles/labickinect.dir/detector.cpp.i

CMakeFiles/labickinect.dir/detector.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/labickinect.dir/detector.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/macecchi/Desktop/labickinect/detector.cpp -o CMakeFiles/labickinect.dir/detector.cpp.s

CMakeFiles/labickinect.dir/detector.cpp.o.requires:
.PHONY : CMakeFiles/labickinect.dir/detector.cpp.o.requires

CMakeFiles/labickinect.dir/detector.cpp.o.provides: CMakeFiles/labickinect.dir/detector.cpp.o.requires
	$(MAKE) -f CMakeFiles/labickinect.dir/build.make CMakeFiles/labickinect.dir/detector.cpp.o.provides.build
.PHONY : CMakeFiles/labickinect.dir/detector.cpp.o.provides

CMakeFiles/labickinect.dir/detector.cpp.o.provides.build: CMakeFiles/labickinect.dir/detector.cpp.o

CMakeFiles/labickinect.dir/FuzzySystem.cpp.o: CMakeFiles/labickinect.dir/flags.make
CMakeFiles/labickinect.dir/FuzzySystem.cpp.o: ../FuzzySystem.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/macecchi/Desktop/labickinect/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/labickinect.dir/FuzzySystem.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/labickinect.dir/FuzzySystem.cpp.o -c /Users/macecchi/Desktop/labickinect/FuzzySystem.cpp

CMakeFiles/labickinect.dir/FuzzySystem.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/labickinect.dir/FuzzySystem.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/macecchi/Desktop/labickinect/FuzzySystem.cpp > CMakeFiles/labickinect.dir/FuzzySystem.cpp.i

CMakeFiles/labickinect.dir/FuzzySystem.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/labickinect.dir/FuzzySystem.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/macecchi/Desktop/labickinect/FuzzySystem.cpp -o CMakeFiles/labickinect.dir/FuzzySystem.cpp.s

CMakeFiles/labickinect.dir/FuzzySystem.cpp.o.requires:
.PHONY : CMakeFiles/labickinect.dir/FuzzySystem.cpp.o.requires

CMakeFiles/labickinect.dir/FuzzySystem.cpp.o.provides: CMakeFiles/labickinect.dir/FuzzySystem.cpp.o.requires
	$(MAKE) -f CMakeFiles/labickinect.dir/build.make CMakeFiles/labickinect.dir/FuzzySystem.cpp.o.provides.build
.PHONY : CMakeFiles/labickinect.dir/FuzzySystem.cpp.o.provides

CMakeFiles/labickinect.dir/FuzzySystem.cpp.o.provides.build: CMakeFiles/labickinect.dir/FuzzySystem.cpp.o

CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.o: CMakeFiles/labickinect.dir/flags.make
CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.o: ../sistema_fuzzy.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/macecchi/Desktop/labickinect/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.o -c /Users/macecchi/Desktop/labickinect/sistema_fuzzy.cpp

CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/macecchi/Desktop/labickinect/sistema_fuzzy.cpp > CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.i

CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/macecchi/Desktop/labickinect/sistema_fuzzy.cpp -o CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.s

CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.o.requires:
.PHONY : CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.o.requires

CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.o.provides: CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.o.requires
	$(MAKE) -f CMakeFiles/labickinect.dir/build.make CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.o.provides.build
.PHONY : CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.o.provides

CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.o.provides.build: CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.o

CMakeFiles/labickinect.dir/pcl.cpp.o: CMakeFiles/labickinect.dir/flags.make
CMakeFiles/labickinect.dir/pcl.cpp.o: ../pcl.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/macecchi/Desktop/labickinect/build/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/labickinect.dir/pcl.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/labickinect.dir/pcl.cpp.o -c /Users/macecchi/Desktop/labickinect/pcl.cpp

CMakeFiles/labickinect.dir/pcl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/labickinect.dir/pcl.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/macecchi/Desktop/labickinect/pcl.cpp > CMakeFiles/labickinect.dir/pcl.cpp.i

CMakeFiles/labickinect.dir/pcl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/labickinect.dir/pcl.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/macecchi/Desktop/labickinect/pcl.cpp -o CMakeFiles/labickinect.dir/pcl.cpp.s

CMakeFiles/labickinect.dir/pcl.cpp.o.requires:
.PHONY : CMakeFiles/labickinect.dir/pcl.cpp.o.requires

CMakeFiles/labickinect.dir/pcl.cpp.o.provides: CMakeFiles/labickinect.dir/pcl.cpp.o.requires
	$(MAKE) -f CMakeFiles/labickinect.dir/build.make CMakeFiles/labickinect.dir/pcl.cpp.o.provides.build
.PHONY : CMakeFiles/labickinect.dir/pcl.cpp.o.provides

CMakeFiles/labickinect.dir/pcl.cpp.o.provides.build: CMakeFiles/labickinect.dir/pcl.cpp.o

# Object files for target labickinect
labickinect_OBJECTS = \
"CMakeFiles/labickinect.dir/main.cpp.o" \
"CMakeFiles/labickinect.dir/kinect.cpp.o" \
"CMakeFiles/labickinect.dir/cv.cpp.o" \
"CMakeFiles/labickinect.dir/cv_matcher.cpp.o" \
"CMakeFiles/labickinect.dir/detector.cpp.o" \
"CMakeFiles/labickinect.dir/FuzzySystem.cpp.o" \
"CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.o" \
"CMakeFiles/labickinect.dir/pcl.cpp.o"

# External object files for target labickinect
labickinect_EXTERNAL_OBJECTS =

labickinect: CMakeFiles/labickinect.dir/main.cpp.o
labickinect: CMakeFiles/labickinect.dir/kinect.cpp.o
labickinect: CMakeFiles/labickinect.dir/cv.cpp.o
labickinect: CMakeFiles/labickinect.dir/cv_matcher.cpp.o
labickinect: CMakeFiles/labickinect.dir/detector.cpp.o
labickinect: CMakeFiles/labickinect.dir/FuzzySystem.cpp.o
labickinect: CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.o
labickinect: CMakeFiles/labickinect.dir/pcl.cpp.o
labickinect: CMakeFiles/labickinect.dir/build.make
labickinect: /opt/local/lib/libboost_system-mt.dylib
labickinect: /opt/local/lib/libboost_filesystem-mt.dylib
labickinect: /opt/local/lib/libboost_thread-mt.dylib
labickinect: /opt/local/lib/libboost_date_time-mt.dylib
labickinect: /opt/local/lib/libboost_iostreams-mt.dylib
labickinect: /opt/local/lib/libboost_serialization-mt.dylib
labickinect: /usr/local/lib/libpcl_common.dylib
labickinect: /usr/local/lib/libpcl_octree.dylib
labickinect: /usr/lib/libOpenNI.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkCommon.5.10.0.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkRendering.5.10.0.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkHybrid.5.10.0.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkCharts.5.10.0.dylib
labickinect: /usr/local/lib/libpcl_io.dylib
labickinect: /opt/local/lib/libflann_cpp_s.a
labickinect: /usr/local/lib/libpcl_kdtree.dylib
labickinect: /usr/local/lib/libpcl_search.dylib
labickinect: /usr/local/lib/libpcl_sample_consensus.dylib
labickinect: /usr/local/lib/libpcl_filters.dylib
labickinect: /usr/local/lib/libpcl_features.dylib
labickinect: /usr/local/lib/libpcl_segmentation.dylib
labickinect: /usr/local/lib/libpcl_visualization.dylib
labickinect: /usr/local/lib/libqhull.dylib
labickinect: /usr/local/lib/libpcl_surface.dylib
labickinect: /usr/local/lib/libpcl_registration.dylib
labickinect: /usr/local/lib/libpcl_keypoints.dylib
labickinect: /usr/local/lib/libpcl_tracking.dylib
labickinect: /usr/local/lib/libpcl_recognition.dylib
labickinect: /usr/local/lib/libpcl_outofcore.dylib
labickinect: /usr/local/lib/libpcl_people.dylib
labickinect: /opt/local/lib/libboost_system-mt.dylib
labickinect: /opt/local/lib/libboost_filesystem-mt.dylib
labickinect: /opt/local/lib/libboost_thread-mt.dylib
labickinect: /opt/local/lib/libboost_date_time-mt.dylib
labickinect: /opt/local/lib/libboost_iostreams-mt.dylib
labickinect: /opt/local/lib/libboost_serialization-mt.dylib
labickinect: /usr/local/lib/libqhull.dylib
labickinect: /usr/lib/libOpenNI.dylib
labickinect: /opt/local/lib/libflann_cpp_s.a
labickinect: /opt/local/lib/vtk-5.10/libvtkCommon.5.10.0.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkRendering.5.10.0.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkHybrid.5.10.0.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkCharts.5.10.0.dylib
labickinect: /opt/local/lib/libopencv_calib3d.dylib
labickinect: /opt/local/lib/libopencv_contrib.dylib
labickinect: /opt/local/lib/libopencv_core.dylib
labickinect: /opt/local/lib/libopencv_features2d.dylib
labickinect: /opt/local/lib/libopencv_flann.dylib
labickinect: /opt/local/lib/libopencv_gpu.dylib
labickinect: /opt/local/lib/libopencv_highgui.dylib
labickinect: /opt/local/lib/libopencv_imgproc.dylib
labickinect: /opt/local/lib/libopencv_legacy.dylib
labickinect: /opt/local/lib/libopencv_ml.dylib
labickinect: /opt/local/lib/libopencv_nonfree.dylib
labickinect: /opt/local/lib/libopencv_objdetect.dylib
labickinect: /opt/local/lib/libopencv_photo.dylib
labickinect: /opt/local/lib/libopencv_stitching.dylib
labickinect: /opt/local/lib/libopencv_superres.dylib
labickinect: /opt/local/lib/libopencv_ts.dylib
labickinect: /opt/local/lib/libopencv_video.dylib
labickinect: /opt/local/lib/libopencv_videostab.dylib
labickinect: /usr/local/lib/libpcl_common.dylib
labickinect: /usr/local/lib/libpcl_octree.dylib
labickinect: /usr/local/lib/libpcl_io.dylib
labickinect: /usr/local/lib/libpcl_kdtree.dylib
labickinect: /usr/local/lib/libpcl_search.dylib
labickinect: /usr/local/lib/libpcl_sample_consensus.dylib
labickinect: /usr/local/lib/libpcl_filters.dylib
labickinect: /usr/local/lib/libpcl_features.dylib
labickinect: /usr/local/lib/libpcl_segmentation.dylib
labickinect: /usr/local/lib/libpcl_visualization.dylib
labickinect: /usr/local/lib/libpcl_surface.dylib
labickinect: /usr/local/lib/libpcl_registration.dylib
labickinect: /usr/local/lib/libpcl_keypoints.dylib
labickinect: /usr/local/lib/libpcl_tracking.dylib
labickinect: /usr/local/lib/libpcl_recognition.dylib
labickinect: /usr/local/lib/libpcl_outofcore.dylib
labickinect: /usr/local/lib/libpcl_people.dylib
labickinect: /opt/local/lib/libopencv_calib3d.dylib
labickinect: /opt/local/lib/libopencv_contrib.dylib
labickinect: /opt/local/lib/libopencv_core.dylib
labickinect: /opt/local/lib/libopencv_features2d.dylib
labickinect: /opt/local/lib/libopencv_flann.dylib
labickinect: /opt/local/lib/libopencv_gpu.dylib
labickinect: /opt/local/lib/libopencv_highgui.dylib
labickinect: /opt/local/lib/libopencv_imgproc.dylib
labickinect: /opt/local/lib/libopencv_legacy.dylib
labickinect: /opt/local/lib/libopencv_ml.dylib
labickinect: /opt/local/lib/libopencv_nonfree.dylib
labickinect: /opt/local/lib/libopencv_objdetect.dylib
labickinect: /opt/local/lib/libopencv_photo.dylib
labickinect: /opt/local/lib/libopencv_stitching.dylib
labickinect: /opt/local/lib/libopencv_superres.dylib
labickinect: /opt/local/lib/libopencv_ts.dylib
labickinect: /opt/local/lib/libopencv_video.dylib
labickinect: /opt/local/lib/libopencv_videostab.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkViews.5.10.0.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkInfovis.5.10.0.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkWidgets.5.10.0.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkHybrid.5.10.0.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkVolumeRendering.5.10.0.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkRendering.5.10.0.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkGraphics.5.10.0.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkImaging.5.10.0.dylib
labickinect: /opt/local/lib/libQtGui.dylib
labickinect: /opt/local/lib/libQtSql.dylib
labickinect: /opt/local/lib/libQtCore.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkIO.5.10.0.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkFiltering.5.10.0.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtkCommon.5.10.0.dylib
labickinect: /opt/local/lib/vtk-5.10/libvtksys.5.10.0.dylib
labickinect: CMakeFiles/labickinect.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable labickinect"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/labickinect.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/labickinect.dir/build: labickinect
.PHONY : CMakeFiles/labickinect.dir/build

CMakeFiles/labickinect.dir/requires: CMakeFiles/labickinect.dir/main.cpp.o.requires
CMakeFiles/labickinect.dir/requires: CMakeFiles/labickinect.dir/kinect.cpp.o.requires
CMakeFiles/labickinect.dir/requires: CMakeFiles/labickinect.dir/cv.cpp.o.requires
CMakeFiles/labickinect.dir/requires: CMakeFiles/labickinect.dir/cv_matcher.cpp.o.requires
CMakeFiles/labickinect.dir/requires: CMakeFiles/labickinect.dir/detector.cpp.o.requires
CMakeFiles/labickinect.dir/requires: CMakeFiles/labickinect.dir/FuzzySystem.cpp.o.requires
CMakeFiles/labickinect.dir/requires: CMakeFiles/labickinect.dir/sistema_fuzzy.cpp.o.requires
CMakeFiles/labickinect.dir/requires: CMakeFiles/labickinect.dir/pcl.cpp.o.requires
.PHONY : CMakeFiles/labickinect.dir/requires

CMakeFiles/labickinect.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/labickinect.dir/cmake_clean.cmake
.PHONY : CMakeFiles/labickinect.dir/clean

CMakeFiles/labickinect.dir/depend:
	cd /Users/macecchi/Desktop/labickinect/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/macecchi/Desktop/labickinect /Users/macecchi/Desktop/labickinect /Users/macecchi/Desktop/labickinect/build /Users/macecchi/Desktop/labickinect/build /Users/macecchi/Desktop/labickinect/build/CMakeFiles/labickinect.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/labickinect.dir/depend

