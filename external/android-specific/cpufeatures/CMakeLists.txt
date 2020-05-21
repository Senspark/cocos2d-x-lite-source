cmake_minimum_required(VERSION 3.6)

project(cc_ext_cpufeatures)
add_library(${PROJECT_NAME} "")

# CMake from android SDK set ANDROID_NDK instead of CMAKE_ANDROID_NDK
if(ANDROID_NDK)
    target_sources(${PROJECT_NAME} PRIVATE ${ANDROID_NDK}/sources/android/cpufeatures/cpu-features.c)
    target_include_directories(${PROJECT_NAME} PUBLIC ${ANDROID_NDK}/sources/android/cpufeatures)
else()
    target_sources(${PROJECT_NAME} PRIVATE ${CMAKE_ANDROID_NDK}/sources/android/cpufeatures/cpu-features.c)
    target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_ANDROID_NDK}/sources/android/cpufeatures)
endif()

target_link_libraries(${PROJECT_NAME} dl)