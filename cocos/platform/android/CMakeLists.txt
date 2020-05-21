cmake_minimum_required(VERSION 3.6)

project(cc_platform_android)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE
    CCDevice-android.cpp
    javaactivity-android.cpp
    jni/JniHelper.cpp
    jni/TouchesJni.cpp
    jni/Java_org_cocos2dx_lib_Cocos2dxAccelerometer.cpp
    jni/Java_org_cocos2dx_lib_Cocos2dxBitmap.cpp
    jni/Java_org_cocos2dx_lib_Cocos2dxHelper.cpp
    jni/Java_org_cocos2dx_lib_Cocos2dxRenderer.cpp
)
target_include_directories(${PROJECT_NAME} PRIVATE ../..)
target_link_libraries(${PROJECT_NAME} cc_core)