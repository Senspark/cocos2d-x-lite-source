cmake_minimum_required(VERSION 3.6)

project(cc_ext_edtaa3func)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE edtaa3func.cpp)
target_include_directories(${PROJECT_NAME} PUBLIC .)