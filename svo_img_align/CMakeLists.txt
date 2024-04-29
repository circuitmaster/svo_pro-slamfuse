project(svo_img_align)
cmake_minimum_required(VERSION 2.8.3)

include(SvoSetup)

set(HEADERS_CPU
  include/svo/img_align/sparse_img_align_base.h
  include/svo/img_align/sparse_img_align.h
  )

set(SOURCES_CPU
  src/sparse_img_align_base.cpp
  src/sparse_img_align.cpp
  )

add_library(${PROJECT_NAME} ${SOURCES_CPU} ${HEADERS_CPU})
target_link_libraries(${PROJECT_NAME} ${LINK_LIBS})