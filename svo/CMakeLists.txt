project(svo)
cmake_minimum_required(VERSION 2.8.3)

# Add the directory containing SvoSetup.cmake to the CMake module path
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/../svo_cmake/cmake/Modules")
include(SvoSetup)
set(OpenCV_DIR "/opt/homebrew/Cellar/opencv/4.9.0_7")
# Add subdirectories
# add_subdirectory("${CMAKE_SOURCE_DIR}/../vikit/vikit_cameras" vikit_cameras_build)
# add_subdirectory("${CMAKE_SOURCE_DIR}/../vikit/vikit_common" vikit_common_build)
# add_subdirectory("${CMAKE_SOURCE_DIR}/../vikit/vikit_solver" vikit_solver_build)
# add_subdirectory("${CMAKE_SOURCE_DIR}/../svo_common" svo_common_build)
# add_subdirectory("${CMAKE_SOURCE_DIR}/../svo_direct" svo_direct_build)
# add_subdirectory("${CMAKE_SOURCE_DIR}/../svo_global_map" svo_global_map_build)
# add_subdirectory("${CMAKE_SOURCE_DIR}/../svo_img_align" svo_img_align_build)
# add_subdirectory("${CMAKE_SOURCE_DIR}/../svo_online_loopclosing" svo_online_loopclosing_build)
# add_subdirectory("${CMAKE_SOURCE_DIR}/../svo_pgo" svo_pgo_build)
# add_subdirectory("${CMAKE_SOURCE_DIR}/../svo_tracker" svo_tracker_build)
# add_subdirectory("${CMAKE_SOURCE_DIR}/../svo_vio_common" svo_vio_common_build)

list(APPEND SVO_SOURCEFILES
  src/frame_handler_mono.cpp
  src/frame_handler_stereo.cpp
  src/frame_handler_array.cpp
  src/frame_handler_base.cpp
  src/map.cpp
  src/pose_optimizer.cpp
  src/initialization.cpp
  src/reprojector.cpp
  src/imu_handler.cpp
  src/stereo_triangulation.cpp
  src/io.cpp
)

list(APPEND SVO_HEADERFILES
  include/svo/abstract_bundle_adjustment.h
  include/svo/frame_handler_base.h
  include/svo/frame_handler_mono.h
  include/svo/frame_handler_stereo.h
  include/svo/frame_handler_array.h
  include/svo/global.h
  include/svo/imu_handler.h
  include/svo/initialization.h
  include/svo/map.h
  include/svo/pose_optimizer.h
  include/svo/reprojector.h
  include/svo/stereo_triangulation.h
  include/svo/io.h
  include/svo/svo.h
  )

################################################################################
# Create svo library
include_directories(include ${INCLUDE_DIRS})
add_library(svo SHARED ${SVO_SOURCEFILES} ${SVO_HEADERFILES})
target_link_libraries(svo ${LINK_LIBS})

# Import include directories from vikit_common
target_link_libraries(svo PRIVATE vikit_common)

# Include vikit_common directories
target_include_directories(svo PRIVATE
    ${INCLUDE_DIRS}
    "${CMAKE_SOURCE_DIR}/../vikit/vikit_common/include"
    "${CMAKE_SOURCE_DIR}/../vikit/vikit_cameras/include"
    "${CMAKE_SOURCE_DIR}/../vikit/vikit_solver/include"
    # $<TARGET_PROPERTY:vikit_common,INTERFACE_INCLUDE_DIRECTORIES>
)