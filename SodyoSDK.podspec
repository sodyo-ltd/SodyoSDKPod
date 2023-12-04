#
# Be sure to run `pod lib lint SodyoSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged.
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SodyoSDK"
  s.version          = "3.62.02"
  s.summary          = "Sodyo Markers SDK"

  s.description      = "Sodyo scanner for Sodyo markers"

  s.homepage         = "https://github.com/SodyoSDK/SodyoSDKPod"
  s.license          = { :type => 'Custom', :file => 'LICENSE' }
  s.author           = { "Tomer Lavi" => "tomer@sodyo.com" }
  s.source           = { :git => "https://github.com/SodyoSDK/SodyoSDKPod.git", :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'

  s.vendored_frameworks = 'SodyoSDK/Frameworks/*'
  s.resources = 'SodyoSDK/Resources/*'
  s.libraries = 'c++', 'sqlite3'
  s.dependency 'AFNetworking', '~> 4.0'

  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

end
