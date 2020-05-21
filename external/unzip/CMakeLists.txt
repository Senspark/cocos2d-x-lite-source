cmake_minimum_required(VERSION 3.6)

project(cc_ext_unzip)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE
    ioapi.cpp
    unzip.cpp
    ioapi_mem.cpp
)
target_include_directories(${PROJECT_NAME} PUBLIC .)
target_link_libraries(${PROJECT_NAME} cc_ext_zlib)