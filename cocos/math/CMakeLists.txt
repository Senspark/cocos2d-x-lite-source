cmake_minimum_required(VERSION 3.6)

project(cc_math)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE
    CCAffineTransform.cpp
    CCGeometry.cpp
    CCVertex.cpp
    Mat4.cpp
    MathUtil.cpp
    Quaternion.cpp
    TransformUtils.cpp
    Vec2.cpp
    Vec3.cpp
    Vec4.cpp
)
target_include_directories(${PROJECT_NAME} PRIVATE ..)
target_link_libraries(${PROJECT_NAME} cc_ext_cpufeatures)