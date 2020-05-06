LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

$(call import-add-path, $(LOCAL_PATH)/..)

LOCAL_MODULE := cc_core

LOCAL_MODULE_FILENAME := libcc_core

LOCAL_ARM_MODE := arm

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
MATHNEONFILE := math/MathUtil.cpp.neon
else
MATHNEONFILE := math/MathUtil.cpp
endif

LOCAL_SRC_FILES := \
cocos2d.cpp \
2d/CCAction.cpp \
2d/CCActionCamera.cpp \
2d/CCActionCatmullRom.cpp \
2d/CCActionEase.cpp \
2d/CCActionGrid.cpp \
2d/CCActionGrid3D.cpp \
2d/CCActionInstant.cpp \
2d/CCActionInterval.cpp \
2d/CCActionManager.cpp \
2d/CCActionPageTurn3D.cpp \
2d/CCActionProgressTimer.cpp \
2d/CCActionTiledGrid.cpp \
2d/CCActionTween.cpp \
2d/CCAnimation.cpp \
2d/CCAnimationCache.cpp \
2d/CCAtlasNode.cpp \
2d/CCCamera.cpp \
2d/CCCameraBackgroundBrush.cpp \
2d/CCClippingNode.cpp \
2d/CCClippingRectangleNode.cpp \
2d/CCComponent.cpp \
2d/CCComponentContainer.cpp \
2d/CCDrawNode.cpp \
2d/CCDrawingPrimitives.cpp \
2d/CCFastTMXLayer.cpp \
2d/CCFastTMXTiledMap.cpp \
2d/CCFont.cpp \
2d/CCFontAtlas.cpp \
2d/CCFontAtlasCache.cpp \
2d/CCFontCharMap.cpp \
2d/CCFontFNT.cpp \
2d/CCFontFreeType.cpp \
2d/CCGLBufferedNode.cpp \
2d/CCGrabber.cpp \
2d/CCGrid.cpp \
2d/CCLabel.cpp \
2d/CCLabelAtlas.cpp \
2d/CCLabelBMFont.cpp \
2d/CCLabelTTF.cpp \
2d/CCLabelTextFormatter.cpp \
2d/CCLayer.cpp \
2d/CCLight.cpp \
2d/CCMenu.cpp \
2d/CCMenuItem.cpp \
2d/CCMotionStreak.cpp \
2d/CCNode.cpp \
2d/CCNodeGrid.cpp \
2d/CCParallaxNode.cpp \
2d/CCParticleBatchNode.cpp \
2d/CCParticleExamples.cpp \
2d/CCParticleSystem.cpp \
2d/CCParticleSystemQuad.cpp \
2d/CCProgressTimer.cpp \
2d/CCProtectedNode.cpp \
2d/CCRenderTexture.cpp \
2d/CCScene.cpp \
2d/CCSprite.cpp \
2d/CCSpriteBatchNode.cpp \
2d/CCSpriteFrame.cpp \
2d/CCSpriteFrameCache.cpp \
2d/CCTMXLayer.cpp \
2d/CCTMXObjectGroup.cpp \
2d/CCTMXTiledMap.cpp \
2d/CCTMXXMLParser.cpp \
2d/CCTextFieldTTF.cpp \
2d/CCTileMapAtlas.cpp \
2d/CCTransition.cpp \
2d/CCTransitionPageTurn.cpp \
2d/CCTransitionProgress.cpp \
2d/CCTweenFunction.cpp \
2d/CCAutoPolygon.cpp \
platform/CCDataManager.cpp \
platform/CCFileUtils.cpp \
platform/CCGLView.cpp \
platform/CCImage.cpp \
platform/CCSAXParser.cpp \
platform/CCThread.cpp \
$(MATHNEONFILE) \
math/CCAffineTransform.cpp \
math/CCGeometry.cpp \
math/CCVertex.cpp \
math/Mat4.cpp \
math/Quaternion.cpp \
math/TransformUtils.cpp \
math/Vec2.cpp \
math/Vec3.cpp \
math/Vec4.cpp \
base/CCNinePatchImageParser.cpp \
base/CCStencilStateManager.cpp \
base/CCAsyncTaskPool.cpp \
base/CCAutoreleasePool.cpp \
base/CCConfiguration.cpp \
base/CCConsole.cpp \
base/CCController-android.cpp \
base/CCController.cpp \
base/CCData.cpp \
base/CCDataVisitor.cpp \
base/CCDirector.cpp \
base/CCEvent.cpp \
base/CCEventAcceleration.cpp \
base/CCEventController.cpp \
base/CCEventCustom.cpp \
base/CCEventDispatcher.cpp \
base/CCEventFocus.cpp \
base/CCEventKeyboard.cpp \
base/CCEventListener.cpp \
base/CCEventListenerAcceleration.cpp \
base/CCEventListenerController.cpp \
base/CCEventListenerCustom.cpp \
base/CCEventListenerFocus.cpp \
base/CCEventListenerKeyboard.cpp \
base/CCEventListenerMouse.cpp \
base/CCEventListenerTouch.cpp \
base/CCEventMouse.cpp \
base/CCEventTouch.cpp \
base/CCIMEDispatcher.cpp \
base/CCNS.cpp \
base/CCProfiling.cpp \
base/CCProperties.cpp \
base/CCRef.cpp \
base/CCScheduler.cpp \
base/CCScriptSupport.cpp \
base/CCTouch.cpp \
base/CCUserDefault-android.cpp \
base/CCUserDefault.cpp \
base/CCValue.cpp \
base/ObjectFactory.cpp \
base/TGAlib.cpp \
base/ZipUtils.cpp \
base/allocator/CCAllocatorDiagnostics.cpp \
base/allocator/CCAllocatorGlobal.cpp \
base/allocator/CCAllocatorGlobalNewDelete.cpp \
base/atitc.cpp \
base/base64.cpp \
base/ccCArray.cpp \
base/ccFPSImages.c \
base/ccRandom.cpp \
base/ccTypes.cpp \
base/ccUTF8.cpp \
base/ccUtils.cpp \
base/etc1.cpp \
base/pvr.cpp \
base/s3tc.cpp \
renderer/CCBatchCommand.cpp \
renderer/CCCustomCommand.cpp \
renderer/CCGLProgram.cpp \
renderer/CCGLProgramCache.cpp \
renderer/CCGLProgramState.cpp \
renderer/CCGLProgramStateCache.cpp \
renderer/CCGroupCommand.cpp \
renderer/CCPrimitive.cpp \
renderer/CCPrimitiveCommand.cpp \
renderer/CCQuadCommand.cpp \
renderer/CCRenderCommand.cpp \
renderer/CCRenderState.cpp \
renderer/CCRenderer.cpp \
renderer/CCTexture2D.cpp \
renderer/CCTextureAtlas.cpp \
renderer/CCTextureCache.cpp \
renderer/CCTextureCube.cpp \
renderer/CCTrianglesCommand.cpp \
renderer/CCVertexIndexBuffer.cpp \
renderer/CCVertexIndexData.cpp \
renderer/ccGLStateCache.cpp \
renderer/CCFrameBuffer.cpp \
renderer/ccShaders.cpp \
deprecated/CCArray.cpp \
deprecated/CCDeprecated.cpp \
deprecated/CCDictionary.cpp \
deprecated/CCNotificationCenter.cpp \
deprecated/CCSet.cpp \
deprecated/CCString.cpp \
../external/ConvertUTF/ConvertUTFWrapper.cpp \
../external/ConvertUTF/ConvertUTF.c \
../external/md5/md5.c \
../external/tinyxml2/tinyxml2.cpp \
../external/unzip/ioapi_mem.cpp \
../external/unzip/ioapi.cpp \
../external/unzip/unzip.cpp \
../external/edtaa3func/edtaa3func.cpp \
../external/xxhash/xxhash.c \
../external/poly2tri/common/shapes.cc \
../external/poly2tri/sweep/advancing_front.cc \
../external/poly2tri/sweep/cdt.cc \
../external/poly2tri/sweep/sweep_context.cc \
../external/poly2tri/sweep/sweep.cc \
../external/clipper/clipper.cpp


LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH) \
                    $(LOCAL_PATH)/. \
                    $(LOCAL_PATH)/.. \
                    $(LOCAL_PATH)/../external \
                    $(LOCAL_PATH)/../external/tinyxml2 \
                    $(LOCAL_PATH)/../external/unzip \
                    $(LOCAL_PATH)/../external/chipmunk/include/chipmunk \
                    $(LOCAL_PATH)/../external/bullet/include/bullet \
                    $(LOCAL_PATH)/../external/xxhash \
                    $(LOCAL_PATH)/../external/nslog \
                    $(LOCAL_PATH)/../external/poly2tri \
                    $(LOCAL_PATH)/../external/poly2tri/common \
                    $(LOCAL_PATH)/../external/poly2tri/sweep \
                    $(LOCAL_PATH)/../external/clipper \
                    $(LOCAL_PATH)/../external/uv/include

LOCAL_C_INCLUDES := $(LOCAL_PATH) \
                    $(LOCAL_PATH)/../external \
                    $(LOCAL_PATH)/../external/tinyxml2 \
                    $(LOCAL_PATH)/../external/unzip \
                    $(LOCAL_PATH)/../external/chipmunk/include/chipmunk \
                    $(LOCAL_PATH)/../external/bullet/include/bullet \
                    $(LOCAL_PATH)/../external/edtaa3func \
                    $(LOCAL_PATH)/../external/xxhash \
                    $(LOCAL_PATH)/../external/ConvertUTF \
                    $(LOCAL_PATH)/../external/nslog \
                    $(LOCAL_PATH)/../external/poly2tri \
                    $(LOCAL_PATH)/../external/poly2tri/common \
                    $(LOCAL_PATH)/../external/poly2tri/sweep \
                    $(LOCAL_PATH)/../external/clipper \
                    $(LOCAL_PATH)/../external/uv/include

LOCAL_EXPORT_LDLIBS := -lGLESv2 \
                       -llog \
                       -landroid

LOCAL_STATIC_LIBRARIES := ext_freetype2
LOCAL_STATIC_LIBRARIES += ext_png
LOCAL_STATIC_LIBRARIES += ext_jpeg
LOCAL_STATIC_LIBRARIES += ext_tiff
LOCAL_STATIC_LIBRARIES += ext_webp
# LOCAL_STATIC_LIBRARIES += ext_chipmunk 
LOCAL_STATIC_LIBRARIES += ext_zlib
LOCAL_STATIC_LIBRARIES += ext_ssl
# LOCAL_STATIC_LIBRARIES += ext_recast
# LOCAL_STATIC_LIBRARIES += ext_bullet

LOCAL_WHOLE_STATIC_LIBRARIES := ccandroid
LOCAL_WHOLE_STATIC_LIBRARIES += cpufeatures

# define the macro to compile through support/zip_support/ioapi.c
LOCAL_CFLAGS   :=  -DUSE_FILE32API
LOCAL_CFLAGS   +=  -fexceptions

# Issues #9968
#ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
#    LOCAL_CFLAGS += -DHAVE_NEON=1
#endif

LOCAL_CPPFLAGS := -Wno-deprecated-declarations
LOCAL_EXPORT_CFLAGS   := -DUSE_FILE32API
LOCAL_EXPORT_CPPFLAGS := -Wno-deprecated-declarations

include $(BUILD_STATIC_LIBRARY)

#==============================================================

include $(CLEAR_VARS)

LOCAL_MODULE := cc_static
LOCAL_MODULE_FILENAME := libcc

# LOCAL_STATIC_LIBRARIES := ccs
LOCAL_STATIC_LIBRARIES := ccb
# LOCAL_STATIC_LIBRARIES += cc3d
LOCAL_STATIC_LIBRARIES += ccnet
LOCAL_STATIC_LIBRARIES += audio
LOCAL_STATIC_LIBRARIES += spine

include $(BUILD_STATIC_LIBRARY)
#==============================================================
$(call import-module, android/cpufeatures)
$(call import-module, external/freetype2/prebuilt/android)
$(call import-module, cocos/platform/android)
$(call import-module, external/png/prebuilt/android)
$(call import-module, external/zlib/prebuilt/android)
$(call import-module, external/jpeg/prebuilt/android)
$(call import-module, external/tiff/prebuilt/android)
$(call import-module, external/webp/prebuilt/android)
# $(call import-module, external/chipmunk/prebuilt/android)
# $(call import-module, cocos/3d)
$(call import-module, cocos/audio/android)
$(call import-module, cocos/editor-support/cocosbuilder)
# $(call import-module, cocos/editor-support/cocostudio)
$(call import-module, cocos/editor-support/spine)
$(call import-module, cocos/network)
$(call import-module, cocos/ui)
$(call import-module, extensions)
# $(call import-module, external/Box2D/prebuilt/android)
# $(call import-module, external/bullet/prebuilt/android)
# $(call import-module, external/recast)
# $(call import-module, external/curl/prebuilt/android)
$(call import-module, external/websockets/prebuilt/android)
$(call import-module, external/openssl/prebuilt/android)
# $(call import-module, external/flatbuffers)
$(call import-module, external/uv/prebuilt/android)
