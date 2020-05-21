cmake_minimum_required(VERSION 3.6)

project(cc_ui)
add_library(${PROJECT_NAME} "")
target_sources(${PROJECT_NAME} PRIVATE
    CocosGUI.cpp
    UIButton.cpp
    UIAbstractCheckButton.cpp
    UICheckBox.cpp
    UIRadioButton.cpp
    UIDeprecated.cpp
    UIHBox.cpp
    UIHelper.cpp
    UIImageView.cpp
    UILayout.cpp
    UILayoutManager.cpp
    UILayoutParameter.cpp
    UIListView.cpp
    UILoadingBar.cpp
    UIPageView.cpp
    UIPageViewIndicator.cpp
    UIRelativeBox.cpp
    UIRichText.cpp
    UIScale9Sprite.cpp
    UIScrollView.cpp
    UIScrollViewBar.cpp
    UISlider.cpp
    UIText.cpp
    UITextAtlas.cpp
    UITextBMFont.cpp
    UITextField.cpp
    UIVBox.cpp
    UIWidget.cpp
    UIEditBox/UIEditBox.cpp
    UILayoutComponent.cpp
    UIEditBox/UIEditBoxImpl-common.cpp
    UITabControl.cpp
)

if(APPLE)
    if(MACOSX)
        target_sources(${PROJECT_NAME} PRIVATE
            UIEditBox/UIEditBoxImpl-mac.mm
            UIEditBox/Mac/CCUIEditBoxMac.mm
            UIEditBox/Mac/CCUIMultilineTextField.m
            UIEditBox/Mac/CCUIPasswordTextField.m
            UIEditBox/Mac/CCUISingleLineTextField.m
            UIEditBox/Mac/CCUITextFieldFormatter.m
        )
    elseif(IOS)
        target_sources(${PROJECT_NAME} PRIVATE
            UIWebView.mm
            UIVideoPlayer-ios.mm
            UIWebViewImpl-ios.mm
            UIEditBox/UIEditBoxImpl-ios.mm
            UIEditBox/iOS/CCUIEditBoxIOS.mm
            UIEditBox/iOS/CCUIMultilineTextField.mm
            UIEditBox/iOS/CCUISingleLineTextField.mm
            UIEditBox/iOS/UITextField+CCUITextInput.mm
            UIEditBox/iOS/UITextView+CCUITextInput.mm
        )
    endif()
elseif(ANDROID)
    target_sources(${PROJECT_NAME} PRIVATE
        UIEditBox/UIEditBoxImpl-android.cpp
        UIVideoPlayer-android.cpp
        UIWebViewImpl-android.cpp
        # it's special for android, not a common file
        UIWebView.cpp
    )
endif()

target_include_directories(${PROJECT_NAME} PRIVATE ..)
target_link_libraries(${PROJECT_NAME}
    cc_base
)