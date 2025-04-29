Pod::Spec.new do |s|
  s.name             = 'SpeechToText'
  s.version          = '0.0.2'
  s.summary          = '科大讯飞的语音转文字框架，适用于 iOS 应用。'
  s.description      = <<-DESC
    SpeechToText 是基于科大讯飞 iOS SDK 的官方 Framework，未做任何功能修改或封装，
    仅用于通过 CocoaPods 方便集成使用，最低支持 iOS 13。
  DESC

  s.homepage         = 'https://github.com/yue5yueliang/SpeechToText'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '桃色三岁' => '136769890@qq.com' }
  s.source           = { :git => 'https://github.com/yue5yueliang/SpeechToText.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'SpeechToText/Classes/**/*.{h,m}'
  s.vendored_frameworks = 'SpeechToText/Classes/iflyMSC.framework'

  s.frameworks = %w[
    UIKit
    AVFoundation
    SystemConfiguration
    Foundation
    CoreTelephony
    AudioToolbox
    CoreLocation
    Contacts
    AddressBook
    QuartzCore
    CoreGraphics
  ]

  s.libraries = 'c++', 'z'
  s.xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC'
  }

  # ✅ 防止在 Apple Silicon 模拟器中因架构不兼容导致验证失败
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }

  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
end