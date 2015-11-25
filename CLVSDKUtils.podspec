Pod::Spec.new do |s|
  s.name         = "CLVSDKUtils"
  s.version      = "0.1.0"
  s.summary      = "CLVSDKUtils contains the HTTP utility methods as part of Clover SDK."
  s.homepage     = "https://www.clover.com/features/integrations"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Yusuf Erisen" => "yusuf@clover.com" }
  s.source       = { :git => "https://github.com/clover/clover-ios-sdk.git", :tag => s.version.to_s }

  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.watchos.deployment_target = "2.0"
  s.requires_arc = true

  s.source_files  = "CloverSDK/Utils/**/*.{swift}"

  s.framework = "UIKit"
  s.dependency "ObjectMapper"
  s.dependency "Alamofire"
  s.dependency "SwiftyJSON"
  s.dependency "CLVSDKModels"
end
