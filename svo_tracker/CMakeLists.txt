project(svo_tracker)
cmake_minimum_required(VERSION 2.8.3)

include(SvoSetup)

set(HEADERS
  include/svo/tracker/feature_tracking_types.h
  include/svo/tracker/feature_tracking_utils.h
  include/svo/tracker/feature_tracking_viz.h
  include/svo/tracker/feature_tracker.h
  )

set(SOURCES
  src/feature_tracking_types.cpp
  src/feature_tracking_utils.cpp
  src/feature_tracking_viz.cpp
  src/feature_tracker.cpp
  )

add_library(${PROJECT_NAME} ${SOURCES} ${HEADERS})