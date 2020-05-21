cmake_minimum_required(VERSION 3.6)

project(cc_ets)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE
    assets-manager/AssetsManager.cpp
    assets-manager/AssetsManagerEx.cpp
    assets-manager/CCEventAssetsManagerEx.cpp
    assets-manager/CCEventListenerAssetsManagerEx.cpp
    assets-manager/Manifest.cpp
    GUI/CCControlExtension/CCControl.cpp
    GUI/CCControlExtension/CCControlButton.cpp
    GUI/CCControlExtension/CCControlColourPicker.cpp
    GUI/CCControlExtension/CCControlHuePicker.cpp
    GUI/CCControlExtension/CCControlPotentiometer.cpp
    GUI/CCControlExtension/CCControlSaturationBrightnessPicker.cpp
    GUI/CCControlExtension/CCControlSlider.cpp
    GUI/CCControlExtension/CCControlStepper.cpp
    GUI/CCControlExtension/CCControlSwitch.cpp
    GUI/CCControlExtension/CCControlUtils.cpp
    GUI/CCControlExtension/CCInvocation.cpp
    GUI/CCScrollView/CCScrollView.cpp
    GUI/CCScrollView/CCTableView.cpp
    GUI/CCScrollView/CCTableViewCell.cpp
)
target_include_directories(${PROJECT_NAME} PUBLIC . ..)
target_link_libraries(${PROJECT_NAME}
    cc_2d
    cc_ext_unzip
)