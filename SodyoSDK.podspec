#
# Be sure to run `pod lib lint SodyoSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SodyoSDK"
  s.version          = "1.0.0"
  s.summary          = "Sodyo Markers SDK."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "Sodyo scanner for Sodyo markers"

  s.homepage         = "https://github.com/SodyoSDK/SodyoSDKPod"
  s.license          = 'MIT'
  s.author           = { "Tomer Lavi" => "tomer@sodyo.com" }
  s.source           = { :git => "https://github.com/SodyoSDK/SodyoSDKPod.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.4'
  s.requires_arc = true

  s.vendored_frameworks = 'Pod/Frameworks/SodyoSDK.framework'
  s.resources = 'Pod/Resources/SodyoResources.bundle'
  # s.frameworks = 'UIKit', 'MapKit'
  s.libraries = 'c++'
  s.dependency 'AFNetworking', '~> 3.0'
  s.dependency 'SDWebImage', '~> 3.7.5'
end
