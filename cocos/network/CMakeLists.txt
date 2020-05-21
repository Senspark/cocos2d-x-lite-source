cmake_minimum_required(VERSION 3.6)

project(cc_net)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE
    CCDownloader.cpp
    SocketIO.cpp
    Uri.cpp
    WebSocket.cpp
)

if(ANDROID)
    target_sources(${PROJECT_NAME} PRIVATE
        CCDownloader-android.cpp
        HttpClient-android.cpp
    )
else()
    target_sources(${PROJECT_NAME} PRIVATE
        CCDownloader-curl.cpp
        HttpClient.cpp
    )
endif()
if(APPLE)
    target_sources(${PROJECT_NAME} PRIVATE
        CCDownloader-apple.mm
    )
endif()
target_include_directories(${PROJECT_NAME} PRIVATE ..)
target_link_libraries(${PROJECT_NAME}
    cc_ext_json
    cc_ext_ssl
    cc_ext_uv
    cc_ext_websockets
)