Pod::Spec.new do |s|

  s.name         = "DLInterval_iOS"
  s.version      = "1.1.2"
  s.summary      = "A Swift module for iOS which provides an abstractions of mathematical intervals."

  s.homepage     = "https://github.com/davidlivadaru/DLInterval"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = "David Livadaru"

  s.ios.deployment_target = "10.0"

  s.source       = { :git => "https://github.com/davidlivadaru/DLInterval.git", :tag => "#{s.version}" }

  s.source_files = "Sources/**/*.{h,m,swift}"

end