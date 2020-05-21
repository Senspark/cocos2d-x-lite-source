cmake_minimum_required(VERSION 3.6)

target_sources(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/CCBatchCommand.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCCustomCommand.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCGLProgram.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCGLProgramCache.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCGLProgramState.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCGLProgramStateCache.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCGroupCommand.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCPrimitive.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCPrimitiveCommand.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCQuadCommand.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCRenderCommand.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCRenderState.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCRenderer.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCTexture2D.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCTextureAtlas.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCTextureCache.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCTextureCube.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCTrianglesCommand.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCVertexIndexBuffer.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCVertexIndexData.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ccGLStateCache.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ccShaders.cpp
    ${CMAKE_CURRENT_LIST_DIR}/CCFrameBuffer.cpp
)