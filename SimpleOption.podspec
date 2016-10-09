Pod::Spec.new do |s|

  s.name         = "SimpleOption"
  s.version      = "0.1"
  s.summary      = "SimpleOption is the UI that provides the option selection function for iOS."

  s.description  = <<-DESC
                   SimpleOption is the UI that provides the option selection function for iOS. - SimpleOption はiOS向けのオプション選択機能を提供するUIです。
                   DESC

  s.homepage     = "https://github.com/notoroid/SimpleOption"
  s.screenshots  = "https://raw.githubusercontent.com/notoroid/SimpleOption/master/Screenshots/ss01.png"


  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "notoroid" => "noto@irimasu.com" }
  s.social_media_url   = "http://twitter.com/notoroid"

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/notoroid/SimpleOption.git", :tag => "v0.1" }

  s.source_files  = "Lib/**/*.{h,m}"
  s.resources  = "Lib/**/*.{storyboard,xib}"
  s.framework    = "QuartzCore"

  s.requires_arc = true

end
