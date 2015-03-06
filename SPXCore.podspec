Pod::Spec.new do |s|
  s.name             = "SPXCore"
  s.version          = "1.4.0"
  s.summary          = "SPXCore is a collection of other open source projects by me."
  s.homepage         = "https://github.com/shaps80/SPXCore"
  s.license          = 'MIT'
  s.author           = { "Shaps Mohsenin" => "shapsuk@me.com" }
  s.source           = { :git => "https://github.com/shaps80/SPXCore.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/shaps'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*.{h,m}'
  s.dependency 'SPXDefines'
  s.dependency 'SPXDataValidators'
  s.dependency 'Stack'
  s.dependency 'SPXDataSources'
end
