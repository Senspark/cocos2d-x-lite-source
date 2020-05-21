cmake_minimum_required(VERSION 3.6)

include(../cmake/CocosExternalConfig.cmake)

project(cc_ext_websockets)
add_library(${PROJECT_NAME} STATIC IMPORTED GLOBAL)
set_target_properties(${PROJECT_NAME} PROPERTIES
    INTERFACE_COMPILE_DEFINITIONS LWS_WITH_LIBUV
    INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_CURRENT_LIST_DIR}/include/${platform_name}
    IMPORTED_LOCATION ${platform_spec_path}/libwebsockets.a
)

set_property(TARGET ${target_name} APPEND PROPERTY INTERFACE_LINK_LIBRARIES ext_ssl)
set_property(TARGET ${target_name} APPEND PROPERTY INTERFACE_LINK_LIBRARIES ext_crypto)
set_property(TARGET ${target_name} APPEND PROPERTY INTERFACE_LINK_LIBRARIES ext_uv)