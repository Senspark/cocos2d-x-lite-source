cmake_minimum_required(VERSION 3.6)

project(cc_ext_rapidxml)
add_library(${PROJECT_NAME} INTERFACE)
target_include_directories(${PROJECT_NAME} INTERFACE ..)