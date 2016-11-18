#
# Be sure to run `pod lib lint MaryToastin.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MaryToastin'
  s.version          = '0.1.0'
  s.summary          = 'UIViewController extension to display toasts your app !'
  s.description      = <<-DESC
    MaryToastin provide an easy way to present toast in your application. \n
It's based on MaryPopin frameworks : https://github.com/Backelite/MaryPopin \n
                       DESC

  s.homepage         = 'https://github.com/leverdeterre/MaryToastin'
  s.screenshots      =  'https://raw.githubusercontent.com/leverdeterre/MaryToastin/master/screenshots/Toast.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jerome Morissard' => 'morissardj@gmail.com' }
  s.source           = { :git => 'https://github.com/leverdeterre/MaryToastin.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/leverdeterre'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MaryToastin/Classes/**/*'

  s.resource_bundles = {
     'MaryToastin' => ['MaryToastin/Assets/*.xib','MaryToastin/Assets/*.png']
  }
  s.dependency 'MaryPopin', '1.4.2'
end

