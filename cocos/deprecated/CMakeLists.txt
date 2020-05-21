cmake_minimum_required(VERSION 3.6)

project(cc_deprecated)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE
    CCArray.cpp
    CCDeprecated.cpp
    CCDictionary.cpp
    CCNotificationCenter.cpp
    CCSet.cpp
    CCString.cpp
)
target_include_directories(${PROJECT_NAME} PRIVATE ..)