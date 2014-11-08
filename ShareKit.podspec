Pod::Spec.new do |s|
  s.name          = 'ShareKit'
  s.version       = '3.0.0'
  s.platform      = :ios, '6.0'
  s.summary       = 'Drop in sharing features for all iPhone and iPad apps.'
  s.homepage      = 'http://getsharekit.com/'
  s.author        = 'ShareKit Community'
  s.source        = { :git  => 'https://github.com/ShareKit/ShareKit.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.license       = { :type => 'MIT',
                      :text => %Q|Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n| +
                               %Q|The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n| +
                               %Q|THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE| }
  
  non_arc_files = 'Classes/ShareKit/Core/Helpers/OAuth/**/*.{h,m}', 'Classes/ShareKit/Core/Categories/GTMNSString+HTML.{h,m}', 'Classes/ShareKit/Core/Helpers/Debug.h'

  s.subspec 'Core' do |core|
    core.resource_bundle = {'ShareKit' => ['Classes/ShareKit/Core/SHKSharers.plist', 'Classes/ShareKit/Localization/*.lproj', 'Classes/ShareKit/*.png']}
    core.source_files  = 'Classes/ShareKit/{Configuration,Core,UI}/**/*.{h,m,c}', 'Classes/ShareKit/Sharers/Actions/**/*.{h,m,c}'
    core.exclude_files = non_arc_files
    core.frameworks    = 'SystemConfiguration', 'Security', 'MessageUI', "AVFoundation", "MobileCoreServices", "CoreMedia", "Social"
    core.dependency 'SSKeychain', '~> 1.2.2'
    core.dependency 'SAMTextView', '~> 0.2.1'
    core.dependency 'ShareKit/Reachability'
    core.dependency 'ShareKit/NoARC'
    core.dependency 'SDWebImage', '~> 3.7.1'
    core.dependency 'UIActivityIndicator-for-SDWebImage', '~> 1.2'
  end

  s.subspec 'NoARC' do |noarc|
    noarc.dependency 'PKMultipartInputStream'
    noarc.requires_arc = false
    noarc.source_files = non_arc_files
  end

  s.subspec 'Reachability' do |reachability|
    reachability.source_files = 'Classes/ShareKit/Reachability/**/*.{h,m}'
    reachability.requires_arc = false
  end

  s.subspec 'Facebook' do |facebook|
    facebook.source_files   = 'Classes/ShareKit/Sharers/Services/Facebook/**/*.{h,m}'
    facebook.dependency 'Facebook-iOS-SDK', '~> 3.16.2'
    facebook.dependency 'ShareKit/Core'
  end

  s.subspec 'LinkedIn' do |linkedin|
    linkedin.source_files = 'Classes/ShareKit/Sharers/Services/LinkedIn/**/*.{h,m}'
    linkedin.dependency 'ShareKit/Core'
  end

  s.subspec 'Twitter' do |twitter|
    twitter.source_files = 'Classes/ShareKit/Sharers/Services/Twitter/**/*.{h,m}'
    twitter.framework = 'Twitter','Social'
    twitter.dependency 'ShareKit/Core'
  end

end
