---
to: <%= projectName %>/<%= projectName %>/CMakeLists.txt
---

# Source files
set(SOURCES
        Tweak.mm)

# Library
add_library (${TARGET_NAME} SHARED ${SOURCES} ${HEADERS})
target_compile_definitions(${TARGET_NAME} PUBLIC IS_BUILDING_SHARED)
# Debug symbols set in XCode project
set_xcode_property(${TARGET_NAME} GCC_GENERATE_DEBUGGING_SYMBOLS YES "All")