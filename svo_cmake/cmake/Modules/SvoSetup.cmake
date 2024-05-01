SET(CMAKE_BUILD_TYPE Release) # Release, RelWithDebInfo
#SET(CMAKE_BUILD_TYPE Debug) # Release, RelWithDebInfo
SET(CMAKE_VERBOSE_MAKEFILE OFF)

# user build settings
SET(USE_LOOP_CLOSING TRUE)
SET(USE_GLOBAL_MAP FALSE)

# Set definitions
IF(USE_LOOP_CLOSING)
  ADD_DEFINITIONS(-DSVO_LOOP_CLOSING)
ENDIF()

IF(USE_GLOBAL_MAP)
  ADD_DEFINITIONS(-DSVO_GLOBAL_MAP)
ENDIF()

ADD_DEFINITIONS(-DSVO_USE_OPENGV)
ADD_DEFINITIONS(-DSVO_DEPTHFILTER_IN_REPROJECTOR)

# Set build flags
if(DEFINED ENV{ARM_ARCHITECTURE})
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -Wall -Werror -D_LINUX -D_REENTRANT -march=native -Wno-unused-variable -Wno-unused-but-set-variable -Wno-unknown-pragmas -Wno-unused-but-set-parameter -Wno-int-in-bool-context -Wno-uninitialized -Wno-unused-function -mfpu=neon -march=armv7-a")
    add_definitions(-DHAVE_FAST_NEON)
else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -Wall -Werror -D_LINUX -D_REENTRANT -march=native -Wno-unused-variable -Wno-unused-but-set-variable -Wno-unknown-pragmas -Wno-unused-but-set-parameter -Wno-int-in-bool-context -Wno-uninitialized -Wno-unused-function")
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS} -O3 -fsee -fomit-frame-pointer -fno-signed-zeros -fno-math-errno -funroll-loops -ffast-math -fno-finite-math-only")
