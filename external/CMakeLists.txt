cmake_minimum_required(VERSION 3.6)

add_subdirectory(clipper)
add_subdirectory(ConvertUTF)
add_subdirectory(curl)
add_subdirectory(edtaa3func)
add_subdirectory(freetype2)
add_subdirectory(jpeg)
add_subdirectory(json)
add_subdirectory(md5)
add_subdirectory(openssl)
add_subdirectory(png)
add_subdirectory(poly2tri)
add_subdirectory(rapidxml)
add_subdirectory(tiff)
add_subdirectory(tinyxml2)
add_subdirectory(unzip)
add_subdirectory(uv)
add_subdirectory(webp)
add_subdirectory(websockets)
add_subdirectory(xxhash)
add_subdirectory(xxtea)

project(cc_ext)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE empty.cpp)
target_link_libraries(${PROJECT_NAME}
    ext_clipper
    ext_convertUTF
    ext_crypto
    ext_curl
    ext_edtaa3func
    ext_freetype
    ext_jpeg
    ext_md5
    ext_png
    ext_poly2tri
    ext_ssl
    ext_tiff
    ext_tinyxml2
    ext_unzip
    ext_uv
    ext_webp
    ext_websockets
    ext_xxhash
    ext_xxtea
)

if(ANDROID)
    add_subdirectory(android-specific/cpufeatures)
    add_subdirectory(android-specific/pvmp3dec)
    add_subdirectory(android-specific/tremolo)
    target_link_libraries(${PROJECT_NAME}
        ext_cpufeatures 
        ext_pvmp3dec 
        ext_tremolo
    )
endif()

if(WINDOWS OR MACOSX OR LINUX)
    add_subdirectory(glfw3)
    target_link_libraries(${PROJECT_NAME}
        ext_glfw3
    )
endif()

if(MACOSX OR ANDROID OR WINDOWS)
    add_subdirectory(zlib)
    target_link_libraries(${PROJECT_NAME}
        ext_zlib
    )
endif()