---
to: <%= projectName %>/CMakeLists.txt
---
cmake_minimum_required (VERSION 3.22)
project (<%= projectName %>_Tweak C CXX)
enable_testing()

MESSAGE(STATUS "CMAKE_CXX_FLAGS: " ${CMAKE_CXX_FLAGS} )

set(THEOS $ENV{THEOS})
set(TARGET_NAME <%= projectName %>)

link_directories(
        ${THEOS}/vendor/lib/)

include_directories(
        ${THEOS}/vendor/include/)

add_subdirectory(${TARGET_NAME})

set_target_properties(${TARGET_NAME} PROPERTIES
        COMPILE_FLAGS "-F ${THEOS}/vendor/lib/"
        LINK_FLAGS "-F ${THEOS}/vendor/lib/ -framework CydiaSubstrate")

set(TWEAK_PLIST_PATH ${CMAKE_SOURCE_DIR})
cmake_path(APPEND TWEAK_PLIST_PATH "filter.plist")
set(TWEAK_DEBIAN_CONTROL_PATH ${CMAKE_SOURCE_DIR})
cmake_path(APPEND TWEAK_DEBIAN_CONTROL_PATH "control")
set(TWEAK_DEB_OUT_DIR ${CMAKE_SOURCE_DIR})
cmake_path(APPEND TWEAK_DEB_OUT_DIR "packages")
set(TWEAK_DYLIB_PATH $<TARGET_FILE:${TARGET_NAME}>)

set(TWEAK_INSTALL_BIN $ENV{TWEAK_DEV_DIR})
cmake_path(APPEND TWEAK_INSTALL_BIN "install_tweak.py")

message(STATUS ${TWEAK_INSTALL_BIN})

INSTALL(CODE "
    message(STATUS \"Dylib Path: \" ${TWEAK_DYLIB_PATH})
    message(STATUS \"Plist Path: \" ${TWEAK_PLIST_PATH})
    message(STATUS \"Control Path: \" ${TWEAK_DEBIAN_CONTROL_PATH})
    message(STATUS \"Deb Out Dir: \" ${TWEAK_DEB_OUT_DIR})")

INSTALL(CODE "
  execute_process(COMMAND ${TWEAK_INSTALL_BIN}
    --dylib=${TWEAK_DYLIB_PATH}
    --plist=${TWEAK_PLIST_PATH}
    --control=${TWEAK_DEBIAN_CONTROL_PATH}
    --deb-out-dir=${TWEAK_DEB_OUT_DIR})")


add_custom_target(do DEPENDS ${TARGET_NAME} install)