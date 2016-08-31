Pod::Spec.new do |s|
  s.name         = "HSInstagram"
  s.version      = "1.1.0"
  s.platform     = :ios, '8.0'
  s.summary      = "This repository provides a starting point to build an application based on the Instagram platform. In addition to the Instagram API model, the respository includes a sample iOS project."
  s.homepage     = "https://github.com/cabosoft/HSInstagram"
  s.author       = 'Harminder Sandhu'
  s.source       = { :git => "https://github.com/cabosoft/HSInstagram.git", :tag => '1.1.0-Cabo' }
  s.source_files = "HSInstagram/*.{h,m,mm}", "HSInstagram/Models/*.{h,m,mm}"
  s.requires_arc = true
  s.dependency 'AFNetworking', '~> 3.0'
#  s.dependency 'AFContentRequestOperations', '= 2.0.0'
end
