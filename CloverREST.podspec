
Pod::Spec.new do |s|
  s.name             = 'CloverREST'
  s.version          = '1.0.0'
  s.summary          = 'Provides an API for communicating with Clover Ecommerce REST APIs.'
  s.homepage         = 'https://docs.clover.com/build/integration-overview-requirements/'
  s.license          = { :type => 'Custom', :file => 'LICENSE' }
  s.author           = { 'Clover' => 'semi-integrations@clover.com' }
  s.source           = { :git => 'https://github.com/clover/clover-ios-sdk.git', :tag => s.version.to_s }

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }

  s.ios.deployment_target = '14.0'

  s.source_files = 'SDK/**/*.swift'
  s.resources = 'SDK/**/*.html', 'SDK/**/*.js'
  
  s.frameworks = 'Foundation'

end
