project(svo_online_loopclosing)
cmake_minimum_required(VERSION 2.8.3)

find_package(OpenCV REQUIRED)

include(SvoSetup)

set(HEADERS
  include/svo/online_loopclosing/bow.h
  include/svo/online_loopclosing/geometric_verification.h
  include/svo/online_loopclosing/loop_closing.h
  include/svo/online_loopclosing/read_file.h
  include/svo/online_loopclosing/keyframe.h
  include/svo/online_loopclosing/loop_closing_types.h
  include/svo/online_loopclosing/map_alignment.h
  )

set(SOURCES
  src/bow.cpp
  src/geometric_verification.cpp
  src/loop_closing.cpp
  src/read_file.cpp
  src/map_alignment.cpp
  )

#add_executable(svo_online_loopclosing ${SOURCES} ${HEADERS})
add_library(${PROJECT_NAME} ${SOURCES} ${HEADERS})
target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBRARIES})

add_library(bow src/bow.cpp include/svo/online_loopclosing/bow.h)
target_link_libraries(bow ${OpenCV_LIBRARIES})

add_executable(createvoc test/createvoc.cpp)
target_link_libraries(createvoc bow)