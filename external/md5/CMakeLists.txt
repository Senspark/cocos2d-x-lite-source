cmake_minimum_required(VERSION 3.6)

project(cc_ext_md5)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE md5.c)
target_include_directories(${PROJECT_NAME} PUBLIC ..)
