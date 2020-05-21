cmake_minimum_required(VERSION 3.6)

project(cc_ext_xxtea)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE xxtea.cpp)
target_include_directories(${PROJECT_NAME} PRIVATE .)