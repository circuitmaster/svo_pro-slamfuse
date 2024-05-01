project(vikit_common)
cmake_minimum_required(VERSION 2.8.3)

find_package(OpenCV REQUIRED)

# Add the directory containing vikit headers to the include directories
include_directories(include)

set(HEADERS
  include/vikit/blender_utils.h
  include/vikit/math_utils.h
  include/vikit/performance_monitor.h
  include/vikit/ringbuffer.h
  include/vikit/sample.h
  include/vikit/timer.h
  include/vikit/user_input_thread.h
  include/vikit/vision.h
  include/vikit/homography_decomp.h
  include/vikit/homography.h
  include/vikit/path_utils.h
  include/vikit/csv_utils.h
  include/aslam/common/entrypoint.h
  include/aslam/common/macros.h
  include/aslam/common/memory.h
  include/aslam/common/pose-types.h
  include/aslam/common/yaml-serialization.h
  include/aslam/common/yaml-serialization-eigen.h
  )

set(SOURCES
  src/homography.cpp
  src/math_utils.cpp
  src/performance_monitor.cpp
  src/sample.cpp
  src/user_input_thread.cpp
  src/vision.cpp
  )

# Create vikit shared library
add_library(${PROJECT_NAME} ${SOURCES} ${HEADERS})

# Export include directories
target_include_directories(${PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBRARIES})
