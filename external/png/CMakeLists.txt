cmake_minimum_required(VERSION 3.6)

include(../cmake/CocosExternalConfig.cmake)

project(cc_ext_png)
add_library(${PROJECT_NAME} STATIC IMPORTED GLOBAL)
set_target_properties(${PROJECT_NAME} PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_CURRENT_LIST_DIR}/include/${platform_name}
    IMPORTED_LOCATION ${platform_spec_path}/libpng.a
)
