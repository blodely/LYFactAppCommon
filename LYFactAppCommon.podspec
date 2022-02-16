#
# Be sure to run `pod lib lint LYFactAppCommon.podspec' to ensure this
# CREATED BY LUO YU, 2019

Pod::Spec.new do |s|
  s.name             = 'LYFactAppCommon'
  s.version          = '1.0.15'
  s.summary          = 'LYFactAppCommon.'

  s.description      = <<-DESC
LYFactAppCommon:
* app common library for base classes.
* open source.
* support iOS 11.0+. ( x64 :) )
* 1.0.6: Refactoring: pop view base(LYPopView); view, control, view controller, table cell, collection cell, image control, label control(LYCore)
* 1.0.7: Refactoring: web image loader(LYCore)
* 1.0.8: Model baseclass.
* 1.0.9: header & import.
* 1.0.10: table collection view baseclass.
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
  
  s.dependency 'AFNetworking', '~> 4.0.1'
  s.dependency 'FCUUID', '~> 1.3.1'
  s.dependency 'LYCategory', '~> 1.13.8'
  
  s.dependency 'JLRoutes'
  
end
