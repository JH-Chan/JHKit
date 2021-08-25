Pod::Spec.new do |s|
  s.name             = 'JHKit'
  
  s.version          = '0.0.2'
  
  s.summary          = '日常工具'
  
  s.description      = <<-DESC
日常能用到的工具，方便开发。
                       DESC
                       
  s.homepage         = 'https://github.com/JH-Chan/JHKit'
  
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  
  s.author           = { '274180213@qq.com' => '274180213@qq.com' }
  
  s.source           = { :git => 'https://github.com/JH-Chan/JHKit.git', :tag => s.version.to_s }
  
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
  s.ios.deployment_target = '9.0'
  
  s.source_files = 'JHKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JHKit' => ['JHKit/Assets/*.png']
  # }
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  
  s.frameworks = 'UIKit', 'Foundation'
  
  # s.dependency 'AFNetworking', '~> 2.3'
end
