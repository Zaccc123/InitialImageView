Pod::Spec.new do |s|
  s.name         = "InitialImageView"
  s.version      = "1.0.2"
  s.summary      = "A subclass of UIImageView that empower user to set initial or name as a placeholder"
  s.description  = "InitialImageView is a subclass of UIImageView that empower user to set initial or name as a placeholder image like what you see in a iOs Contact."
  s.homepage     = "https://github.com/Zaccc123/InitialImageView"
  s.license      = "MIT"
  s.author       = { "Zac Kwan" => "weihao09@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/Zaccc123/InitialImageView.git", :tag => "#{s.version}" }
  s.source_files = "InitialImageView.swift"
end
