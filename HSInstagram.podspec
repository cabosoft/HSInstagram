Pod::Spec.new do |s|
  s.name         = "HSInstagram"
  s.version      = "1.0.1-Cabo"
  s.platform     = :ios, '7.0'
  s.summary      = "This repository provides a starting point to build an application based on the Instagram platform. In addition to the Instagram API model, the respository includes a sample iOS project."
  s.homepage     = "https://github.com/cabosoft/HSInstagram"
  s.author       = 'Harminder Sandhu'
  s.source       = { :git => "https://github.com/cabosoft/HSInstagram.git", :tag => '1.0.1-Cabo' }
  s.source_files = "HSInstagramSample/HSInstagramSample/Vendor/HSInstagram/*.{h,m,mm}", "HSInstagramSample/HSInstagramSample/Vendor/HSInstagram/Models/*.{h,m,mm}"
  s.requires_arc = true
  s.dependency 'AFNetworking', '~> 2.3.1'
  s.dependency 'AFContentRequestOperations', '= 2.0.0'
end
