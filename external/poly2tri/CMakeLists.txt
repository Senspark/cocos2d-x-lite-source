cmake_minimum_required(VERSION 3.6)

project(cc_ext_poly2tri)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE
    common/shapes.cc
    sweep/sweep.cc
    sweep/sweep_context.cc
    sweep/cdt.cc
    sweep/advancing_front.cc
)
target_include_directories(${PROJECT_NAME} PUBLIC ..)
