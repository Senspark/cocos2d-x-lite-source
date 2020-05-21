cmake_minimum_required(VERSION 3.6)

project(cc_audio)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE
    AudioEngine.cpp
)

if(ANDROID)
    target_sources(${PROJECT_NAME} PRIVATE
        android/cddSimpleAudioEngine.cpp
        android/ccdandroidUtils.cpp
        android/jni/cddandroidAndroidJavaEngine.cpp
        android/AudioEngine-inl.cpp
        android/CCThreadPool.cpp
        android/AssetFd.cpp
        android/AudioDecoder.cpp
        android/AudioDecoderProvider.cpp
        android/AudioDecoderSLES.cpp
        android/AudioDecoderOgg.cpp
        android/AudioDecoderMp3.cpp
        android/AudioDecoderWav.cpp
        android/AudioPlayerProvider.cpp
        android/AudioResampler.cpp
        android/AudioResamplerCubic.cpp
        android/PcmBufferProvider.cpp
        android/PcmAudioPlayer.cpp
        android/UrlAudioPlayer.cpp
        android/PcmData.cpp
        android/AudioMixerController.cpp
        android/AudioMixer.cpp
        android/PcmAudioService.cpp
        android/Track.cpp
        android/audio_utils/format.c
        android/audio_utils/minifloat.cpp
        android/audio_utils/primitives.c
        android/utils/Utils.cpp
        android/mp3reader.cpp
        android/tinysndfile.cpp
    )
elseif(APPLE)
    target_sources(${PROJECT_NAME} PRIVATE
        apple/AudioCache.mm
        apple/AudioDecoder.mm
        apple/AudioEngine-inl.mm
        apple/AudioPlayer.mm
    )
    if(MACOSX)
        target_sources(${PROJECT_NAME} PRIVATE
            mac/CDAudioManager.m
            mac/CDOpenALSupport.m
            mac/CocosDenshion.m
            mac/SimpleAudioEngine_objc.m
            mac/SimpleAudioEngine.mm
            mac/CDXMacOSXSupport.mm
        )
    elseif(IOS)
        target_sources(${PROJECT_NAME} PRIVATE
            ios/CDAudioManager.m
            ios/CDOpenALSupport.m
            ios/CocosDenshion.m
            ios/SimpleAudioEngine_objc.m
            ios/SimpleAudioEngine.mm
        )
    endif()
endif()

target_include_directories(${PROJECT_NAME} PRIVATE ..)
target_link_libraries(${PROJECT_NAME}
    cc_ext_pvmp3dec
    cc_ext_tremolo
)