cmake_minimum_required(VERSION 3.6)

target_sources(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/CCAffineTransform.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCGeometry.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCVertex.cpp
    ${CMAKE_CURRENT_LIST_DIR}/Mat4.cpp
    ${CMAKE_CURRENT_LIST_DIR}/MathUtil.cpp
    ${CMAKE_CURRENT_LIST_DIR}/Quaternion.cpp
    ${CMAKE_CURRENT_LIST_DIR}/TransformUtils.cpp
    ${CMAKE_CURRENT_LIST_DIR}/Vec2.cpp
    ${CMAKE_CURRENT_LIST_DIR}/Vec3.cpp
    ${CMAKE_CURRENT_LIST_DIR}/Vec4.cpp
)