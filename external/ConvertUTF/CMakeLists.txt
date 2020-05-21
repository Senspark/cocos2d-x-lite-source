cmake_minimum_required(VERSION 3.6)

project(cc_ext_convertUTF)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE
    ConvertUTF.c
    ConvertUTFWrapper.cpp
)
target_include_directories(${PROJECT_NAME} PUBLIC .)