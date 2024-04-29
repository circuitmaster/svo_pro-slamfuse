project(svo_pgo)
cmake_minimum_required(VERSION 2.8.3)

include(SvoSetup)

set(HEADERS
  include/svo/pgo/pgo.h
  )

set(SOURCES
  src/pgo.cpp
  )

#add_executable(svo_online_loopclosing ${SOURCES} ${HEADERS})
add_library(${PROJECT_NAME} ${SOURCES} ${HEADERS})

add_executable(test_pgo test/test.cpp)
target_link_libraries(test_pgo ${PROJECT_NAME})