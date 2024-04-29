cmake_minimum_required(VERSION 2.8.3)
project(vikit_solver)

SET(CMAKE_BUILD_TYPE Release) # Release, RelWithDebInfo
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -std=c++11")

#############
# LIBRARIES #
#############
add_library(${PROJECT_NAME}
  include/vikit/solver/mini_least_squares_solver.h
  include/vikit/solver/implementation/mini_least_squares_solver.hpp
  src/robust_cost.cpp
  include/vikit/solver/robust_cost.h
)