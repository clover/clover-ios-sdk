Pod::Spec.new do |s|
  s.name         = "CloverSDK"
  s.version      = "0.3.1"
  s.summary      = "Clover SDK"
  s.homepage     = "https://github.com/clover/clover-ios-sdk"
  s.license      = { :type => "Apache License 2.0", :file => "LICENSE" }
  s.author       = { "Clover Network, Inc." => "dev@clover.com" }
  s.source       = { :git => "https://github.com/clover/clover-ios-sdk.git", :tag => s.version.to_s }

  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.requires_arc = true

  s.subspec "Models" do |models|
    models.ios.deployment_target = "8.0"
    models.watchos.deployment_target = "2.0"
    models.source_files = "CloverSDK/Models/**/*.{swift}"
    models.framework = "UIKit"
    models.dependency "ObjectMapper"
    models.dependency "SwiftyJSON"
  end

  s.subspec "Utils" do |utils|
    utils.ios.deployment_target = "8.0"
    utils.watchos.deployment_target = "2.0"
    utils.source_files = "CloverSDK/Utils/**/*.{swift}"
    utils.framework = "UIKit"
    utils.dependency "ObjectMapper"
    utils.dependency "Alamofire"
    utils.dependency "SwiftyJSON"
    utils.dependency "CloverSDK/Models"
  end

  s.subspec "PromiseKit" do |promisekit|
    promisekit.ios.deployment_target = "8.0"
    promisekit.watchos.deployment_target = "2.0"
    promisekit.source_files = "CloverSDK/PromiseKit/**/*.{swift}"
    promisekit.framework = "UIKit"
    promisekit.dependency "CloverSDK/Models"
    promisekit.dependency "CloverSDK/Utils"
    promisekit.dependency "PromiseKit/CorePromise"
    promisekit.dependency "ObjectMapper"
    promisekit.dependency "Alamofire"
    promisekit.dependency "SwiftyJSON"
  end

  s.subspec "OAuth" do |oauth|
    oauth.ios.deployment_target = "8.0"
    oauth.source_files = "CloverSDK/OAuth/**/*.{swift}"
    oauth.framework = "WebKit"
    oauth.dependency "CloverSDK/Models"
    oauth.dependency "CloverSDK/Utils"
  end

end
