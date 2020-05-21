#/****************************************************************************
# Copyright (c) 2013 cocos2d-x.org
# Copyright (c) 2014 martell malone
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

# this CMakeLists is to generate Cocos2d-x Engine Library
# build libcocos2d
# build luacocos2d if BUILD_LUA_LIBS=ON
# build jscocos2d if BUILD_JS_LIBS=ON

# The version number
set(COCOS2D_X_VERSION 3.17.1)

add_subdirectory(2d)
add_subdirectory(audio)
add_subdirectory(base)
add_subdirectory(deprecated)
add_subdirectory(math)
add_subdirectory(network)
add_subdirectory(platform)
add_subdirectory(platform/android)
add_subdirectory(renderer)
add_subdirectory(ui)

project(cc_version)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE cocos2d.cpp)
target_include_directories(${PROJECT_NAME} PRIVATE .)

project(cc_core)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE empty.cpp)
target_include_directories(${PROJECT_NAME} PUBLIC .)
target_link_libraries(${PROJECT_NAME}
    cc_2d
    cc_audio
    cc_base
    cc_deprecated
    cc_math
    cc_net
    cc_platform
    cc_renderer
    cc_ui
    cc_version
    -Wl,--whole-archive cpp_android_spec -Wl,--no-whole-archive
)

# if(XCODE OR VS)
#     cocos_mark_code_files("cocos2d")
# endif()
