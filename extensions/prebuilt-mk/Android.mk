LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := cocos_extension_static

LOCAL_MODULE_FILENAME := libextension

LOCAL_ARM_MODE := arm

ifeq ($(NDK_DEBUG),1)
  LOCAL_SRC_FILES := ../../prebuilt/libs/android/$(TARGET_ARCH_ABI)/debug/libextension.a
else
  LOCAL_SRC_FILES := ../../prebuilt/libs/android/$(TARGET_ARCH_ABI)/release/libextension.a
endif

LOCAL_STATIC_LIBRARIES := cocos2dx_internal_static
LOCAL_STATIC_LIBRARIES += box2d_static
LOCAL_STATIC_LIBRARIES += bullet_static
LOCAL_STATIC_LIBRARIES += cocos_network_static

LOCAL_CXXFLAGS += -fexceptions

LOCAL_EXPORT_C_INCLUDES := \
$(LOCAL_PATH)/../. \
$(LOCAL_PATH)/../.. \
$(LOCAL_PATH)/../GUI/CCControlExtension \
$(LOCAL_PATH)/../GUI/CCScrollView

include $(PREBUILT_STATIC_LIBRARY)
