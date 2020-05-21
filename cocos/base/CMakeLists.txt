cmake_minimum_required(VERSION 3.6)

target_sources(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/CCAsyncTaskPool.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCAutoreleasePool.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCConfiguration.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCConsole.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCController.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCData.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCDataVisitor.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCNinePatchImageParser.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCDirector.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCEvent.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCEventAcceleration.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCEventController.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCEventCustom.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCEventDispatcher.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCEventFocus.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCEventKeyboard.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCEventListener.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCEventListenerAcceleration.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCEventListenerController.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCEventListenerCustom.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCEventListenerFocus.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCEventListenerKeyboard.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCEventListenerMouse.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCEventListenerTouch.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCEventMouse.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCEventTouch.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCIMEDispatcher.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCNS.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCProfiling.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCProperties.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCRef.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCScheduler.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCScriptSupport.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCTouch.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCUserDefault.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCValue.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ObjectFactory.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCStencilStateManager.cpp
    ${CMAKE_CURRENT_LIST_DIR}/TGAlib.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ZipUtils.cpp
    ${CMAKE_CURRENT_LIST_DIR}/allocator/CCAllocatorDiagnostics.cpp
    ${CMAKE_CURRENT_LIST_DIR}/allocator/CCAllocatorGlobal.cpp
    ${CMAKE_CURRENT_LIST_DIR}/allocator/CCAllocatorGlobalNewDelete.cpp
    ${CMAKE_CURRENT_LIST_DIR}/atitc.cpp
    ${CMAKE_CURRENT_LIST_DIR}/base64.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ccCArray.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ccFPSImages.c
    ${CMAKE_CURRENT_LIST_DIR}/ccRandom.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ccTypes.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ccUTF8.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ccUtils.cpp
    ${CMAKE_CURRENT_LIST_DIR}/etc1.cpp
    ${CMAKE_CURRENT_LIST_DIR}/pvr.cpp
    ${CMAKE_CURRENT_LIST_DIR}/s3tc.cpp
)

if(APPLE)
    target_sources(${PROJECT_NAME} PRIVATE
        ${CMAKE_CURRENT_LIST_DIR}/CCUserDefault-apple.mm
        ${CMAKE_CURRENT_LIST_DIR}/CCController-apple.mm
    )
elseif(ANDROID)
    target_sources(${PROJECT_NAME} PRIVATE
        ${CMAKE_CURRENT_LIST_DIR}/CCUserDefault-android.cpp
        ${CMAKE_CURRENT_LIST_DIR}/CCController-android.cpp
    )
endif()

target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/..
)