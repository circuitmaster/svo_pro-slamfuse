project(svo_vio_common)
cmake_minimum_required(VERSION 2.8.3)

#############
# LIBRARIES #
#############
set(HEADERS
  include/svo/vio_common/logging.hpp
  include/svo/vio_common/matrix_operations.hpp
  include/svo/vio_common/matrix.hpp
  include/svo/vio_common/test_utils.hpp
  include/svo/vio_common/backend_types.hpp
  )

set(SOURCES
  src/vio_common.cpp
  src/test_utils.cpp
  )

add_library(${PROJECT_NAME} ${SOURCES} ${HEADERS})