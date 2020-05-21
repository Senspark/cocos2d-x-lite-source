cmake_minimum_required(VERSION 3.6)

project(cc_base)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE
    CCAsyncTaskPool.cpp
    CCAutoreleasePool.cpp
    CCConfiguration.cpp
    CCConsole.cpp
    CCController.cpp
    CCData.cpp
    CCDataVisitor.cpp
    CCNinePatchImageParser.cpp
    CCDirector.cpp
    CCEvent.cpp
    CCEventAcceleration.cpp
    CCEventController.cpp
    CCEventCustom.cpp
    CCEventDispatcher.cpp
    CCEventFocus.cpp
    CCEventKeyboard.cpp
    CCEventListener.cpp
    CCEventListenerAcceleration.cpp
    CCEventListenerController.cpp
    CCEventListenerCustom.cpp
    CCEventListenerFocus.cpp
    CCEventListenerKeyboard.cpp
    CCEventListenerMouse.cpp
    CCEventListenerTouch.cpp
    CCEventMouse.cpp
    CCEventTouch.cpp
    CCIMEDispatcher.cpp
    CCNS.cpp
    CCProfiling.cpp
    CCProperties.cpp
    CCRef.cpp
    CCScheduler.cpp
    CCScriptSupport.cpp
    CCTouch.cpp
    CCUserDefault.cpp
    CCValue.cpp
    ObjectFactory.cpp
    CCStencilStateManager.cpp
    TGAlib.cpp
    ZipUtils.cpp
    allocator/CCAllocatorDiagnostics.cpp
    allocator/CCAllocatorGlobal.cpp
    allocator/CCAllocatorGlobalNewDelete.cpp
    atitc.cpp
    base64.cpp
    ccCArray.cpp
    ccFPSImages.c
    ccRandom.cpp
    ccTypes.cpp
    ccUTF8.cpp
    ccUtils.cpp
    etc1.cpp
    pvr.cpp
    s3tc.cpp
)

if(APPLE)
    target_sources(${PROJECT_NAME} PRIVATE
        CCUserDefault-apple.mm
        CCController-apple.mm
    )
elseif(ANDROID)
    target_sources(${PROJECT_NAME} PRIVATE
        CCUserDefault-android.cpp
        CCController-android.cpp
    )
endif()

target_include_directories(${PROJECT_NAME} PRIVATE ..)
target_link_libraries(${PROJECT_NAME}
    log
    cc_platform
    cc_renderer
    cc_version
    cc_ext_convertUTF
    cc_ext_freetype
    cc_ext_md5
    cc_ext_tinyxml2
    cc_ext_unzip
)