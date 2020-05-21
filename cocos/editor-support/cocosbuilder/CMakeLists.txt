cmake_minimum_required(VERSION 3.6)

project(cc_ccb)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE
    CCBAnimationManager.cpp
    CCBFileLoader.cpp
    CCBKeyframe.cpp
    CCBReader.cpp
    CCBSequence.cpp
    CCBSequenceProperty.cpp
    CCControlButtonLoader.cpp
    CCControlLoader.cpp
    CCLabelBMFontLoader.cpp
    CCLabelTTFLoader.cpp
    CCLayerColorLoader.cpp
    CCLayerGradientLoader.cpp
    CCLayerLoader.cpp
    CCMenuItemImageLoader.cpp
    CCMenuItemLoader.cpp
    CCNode+CCBRelativePositioning.cpp
    CCNodeLoader.cpp
    CCNodeLoaderLibrary.cpp
    CCParticleSystemQuadLoader.cpp
    CCScale9SpriteLoader.cpp
    CCScrollViewLoader.cpp
    CCSpriteLoader.cpp
)
target_include_directories(${PROJECT_NAME} PUBLIC .. ../..)
target_link_libraries(${PROJECT_NAME}
    cc_core
    cc_ets
)