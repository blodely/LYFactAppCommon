#
# Be sure to run `pod lib lint LYFactAppCommon.podspec' to ensure this
# CREATED BY LUO YU, 2019

Pod::Spec.new do |s|
  s.name             = 'LYFactAppCommon'
  s.version          = '1.0.0'
  s.summary          = 'LYFactAppCommon.'

  s.description      = <<-DESC
LYFactAppCommon:
* app common library for base classes.
* open source.
* support iOS 11.0+. ( x64 :) )
                       DESC

  s.homepage         = 'https://github.com/blodely/LYFactAppCommon'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Luo Yu(blodely)' => 'indie.luo@gmail.com' }
  s.source           = { :git => 'https://github.com/blodely/LYFactAppCommon.git', :tag => s.version.to_s }
  
  s.social_media_url = 'https://weibo.com/blodely'

  s.ios.deployment_target = '11.0'

  s.source_files = 'LYFactAppCommon/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LYFactAppCommon' => ['LYFactAppCommon/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  
  s.frameworks = 'UIKit', 'MapKit', 'WebKit'
  
  s.dependency 'AFNetworking'
  s.dependency 'LYCategory'
  s.dependency 'FCUUID'
  s.dependency 'QMUIKit'
  s.dependency 'Masonry'
  
end
