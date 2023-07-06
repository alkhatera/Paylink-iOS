Pod::Spec.new do |s|
  s.name         = 'PaylinkIOS'
  s.version      = '1.0.0'
  s.summary      = 'A payment gateway library for iOS.'
  s.description  = 'A library that provides payment gateway functionality for iOS applications.'
  s.homepage     = 'https://developer.paylink.sa'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Alaa Alkhater' => 'alkhateralaa@outlook.com' }
  s.source       = { :http => 'https://developer.paylink.sa/assets/downloads/PLPaymentGateway.xcframework.zip' }
  s.platform     = :ios, '11.0'
  s.vendored_frameworks = 'PLPaymentGateway.xcframework'
  s.swift_version = '5.0'
  s.dependency 'Alamofire', '~> 5.0'
end