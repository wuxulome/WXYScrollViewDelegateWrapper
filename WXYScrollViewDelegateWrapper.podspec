#
# Be sure to run `pod lib lint WXYScrollViewDelegateWrapper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "WXYScrollViewDelegateWrapper"
  s.version          = "0.1.0"
  s.summary          = “Use runtime to solve the crash that UIScrollView’s delegate is assign property in old SDK”

  s.description      = “Sometimes we get UIKit crash like ‘[UIScrollView(UIScrollViewInternal) _delegateScrollViewAnimationEnded]’. The reason is  UIScrollView’s delegate is assign property in old SDK. So we can wrap this property use our new object.”

  s.homepage         = "https://github.com/wuxulome/WXYScrollViewDelegateWrapper"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "wuxu" => "wuxulome@gmail.com" }
  s.source           = { :git => "https://github.com/wuxulome/WXYScrollViewDelegateWrapper.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'WXYScrollViewDelegateWrapper/*.{h,m}'

  s.frameworks = 'UIKit'
end
