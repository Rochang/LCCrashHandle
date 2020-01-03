#
# Be sure to run `pod lib lint LCCrashHandle.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LCCrashHandle'
  s.version          = '1.0.0'
  s.summary          = '利用runtime 交换系统的方法，降低APP崩溃率。'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '利用runtime 交换系统的方法, 封装NSArray, NSDictionary分类, 拦截unrecognized selector sent to instance崩溃，降低APP崩溃率。'

  s.homepage         = 'https://github.com/Rochang/LCCrashHandle.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rochang' => '625304864@qq.com' }
  s.source           = { :git => 'https://github.com/Rochang/LCCrashHandle.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LCCrashHandle/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LCCrashHandle' => ['LCCrashHandle/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
