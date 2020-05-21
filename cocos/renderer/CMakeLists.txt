cmake_minimum_required(VERSION 3.6)

project(cc_renderer)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE
    CCBatchCommand.cpp
    CCCustomCommand.cpp
    CCGLProgram.cpp
    CCGLProgramCache.cpp
    CCGLProgramState.cpp
    CCGLProgramStateCache.cpp
    CCGroupCommand.cpp
    CCPrimitive.cpp
    CCPrimitiveCommand.cpp
    CCQuadCommand.cpp
    CCRenderCommand.cpp
    CCRenderState.cpp
    CCRenderer.cpp
    CCTexture2D.cpp
    CCTextureAtlas.cpp
    CCTextureCache.cpp
    CCTextureCube.cpp
    CCTrianglesCommand.cpp
    CCVertexIndexBuffer.cpp
    CCVertexIndexData.cpp
    ccGLStateCache.cpp
    ccShaders.cpp
    CCFrameBuffer.cpp
)
target_include_directories(${PROJECT_NAME} PRIVATE ..)
target_link_libraries(${PROJECT_NAME}
    GLESv2
    cc_platform
    cc_ext_xxhash
)