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

target_sources(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/CCDataManager.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCSAXParser.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCThread.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCGLView.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCFileUtils.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCImage.cpp
)

if(ANDROID)
    # refer to target: cocos/platform/android/CMakeLists.txt
    target_sources(${PROJECT_NAME} PRIVATE
        ${CMAKE_CURRENT_LIST_DIR}/android/CCApplication-android.cpp
        ${CMAKE_CURRENT_LIST_DIR}/android/CCCommon-android.cpp
        ${CMAKE_CURRENT_LIST_DIR}/android/CCGLViewImpl-android.cpp
        ${CMAKE_CURRENT_LIST_DIR}/android/CCFileUtils-android.cpp
        ${CMAKE_CURRENT_LIST_DIR}/android/CCEnhanceAPI-android.cpp
    )
    target_link_libraries(${PROJECT_NAME}
        android
        EGL
    )
elseif(APPLE)
    target_sources(${PROJECT_NAME} PRIVATE
        ${CMAKE_CURRENT_LIST_DIR}/apple/CCLock-apple.cpp
        ${CMAKE_CURRENT_LIST_DIR}/apple/CCFileUtils-apple.mm
        ${CMAKE_CURRENT_LIST_DIR}/apple/CCThread-apple.mm
        ${CMAKE_CURRENT_LIST_DIR}/apple/CCDevice-apple.mm
    )
    if(MACOSX)
        target_sources(${PROJECT_NAME} PRIVATE
            ${CMAKE_CURRENT_LIST_DIR}/mac/CCApplication-mac.mm
            ${CMAKE_CURRENT_LIST_DIR}/mac/CCCommon-mac.mm
            ${CMAKE_CURRENT_LIST_DIR}/mac/CCDevice-mac.mm
            ${CMAKE_CURRENT_LIST_DIR}/desktop/CCGLViewImpl-desktop.cpp
        )
    elseif(IOS)
        target_sources(${PROJECT_NAME} PRIVATE
            ${CMAKE_CURRENT_LIST_DIR}/ios/CCApplication-ios.mm
            ${CMAKE_CURRENT_LIST_DIR}/ios/CCCommon-ios.mm
            ${CMAKE_CURRENT_LIST_DIR}/ios/CCDevice-ios.mm
            ${CMAKE_CURRENT_LIST_DIR}/ios/CCDirectorCaller-ios.mm
            ${CMAKE_CURRENT_LIST_DIR}/ios/CCEAGLView-ios.mm
            ${CMAKE_CURRENT_LIST_DIR}/ios/CCES2Renderer-ios.m
            ${CMAKE_CURRENT_LIST_DIR}/ios/CCGLViewImpl-ios.mm
            ${CMAKE_CURRENT_LIST_DIR}/ios/CCImage-ios.mm
        )
    endif()
endif()