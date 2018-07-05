Pod::Spec.new do |s|
  s.name         = "ZCCTFeedbackSwift"
  s.version      = "0.1.6"
  s.summary      = "Feedback composer for iOS"
  s.homepage     = "https://github.com/eximpression/CTFeedbackSwift"
  s.screenshots  = "https://github.com/rizumita/CTFeedbackSwift/raw/master/CTFeedbackSwift.png"
  s.license      = "MIT"
  s.author             = { "Ryoichi Izumita" => "r.izumita@caph.jp" }
#s.social_media_url   = "http://twitter.com/rizumita"
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/eximpression/CTFeedbackSwift.git", :tag => "v#{s.version}ex" }
  s.source_files  = "CTFeedbackSwift", "CTFeedbackSwift/**/*.{h,m,swift}"
  s.resources = ["CTFeedbackSwift/Resources/*.lproj", "CTFeedbackSwift/Resources/PlatformNames.plist"]
  s.framework  = 'MessageUI'
end
