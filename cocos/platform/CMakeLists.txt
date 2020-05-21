#/****************************************************************************
# Copyright (c) 2015-2017 Chukong Technologies Inc.
#
# http://www.cocos2d-x.org
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
# ****************************************************************************/

cmake_minimum_required(VERSION 3.6)

project(cc_platform)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE
    CCDataManager.cpp
    CCSAXParser.cpp
    CCThread.cpp
    CCGLView.cpp
    CCFileUtils.cpp
    CCImage.cpp
)

if(ANDROID)
    # refer to target: cocos/platform/android/CMakeLists.txt
    target_sources(${PROJECT_NAME} PRIVATE
        android/CCApplication-android.cpp
        android/CCCommon-android.cpp
        android/CCGLViewImpl-android.cpp
        android/CCFileUtils-android.cpp
        android/CCEnhanceAPI-android.cpp
    )
    target_link_libraries(${PROJECT_NAME}
        android
        EGL
    )
elseif(APPLE)
    target_sources(${PROJECT_NAME} PRIVATE
        apple/CCLock-apple.cpp
        apple/CCFileUtils-apple.mm
        apple/CCThread-apple.mm
        apple/CCDevice-apple.mm
    )
    if(MACOSX)
        target_sources(${PROJECT_NAME} PRIVATE
            mac/CCApplication-mac.mm
            mac/CCCommon-mac.mm
            mac/CCDevice-mac.mm
            desktop/CCGLViewImpl-desktop.cpp
        )
    elseif(IOS)
        target_sources(${PROJECT_NAME} PRIVATE
            ios/CCApplication-ios.mm
            ios/CCCommon-ios.mm
            ios/CCDevice-ios.mm
            ios/CCDirectorCaller-ios.mm
            ios/CCEAGLView-ios.mm
            ios/CCES2Renderer-ios.m
            ios/CCGLViewImpl-ios.mm
            ios/CCImage-ios.mm
        )
    endif()
endif()

target_include_directories(${PROJECT_NAME} PRIVATE . ..)
target_link_libraries(${PROJECT_NAME}
    cc_base
    cc_ext_jpeg
    cc_ext_png
    cc_ext_rapidxml
    cc_ext_tiff
    cc_ext_tinyxml2
    cc_ext_unzip
    cc_ext_webp
)