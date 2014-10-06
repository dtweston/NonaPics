Pod::Spec.new do |s|
  s.name             = "NonaPics"
  s.version          = "0.1.0"
  s.summary          = "A simple library to generate images from octicons.ttf"
  s.homepage         = "https://github.com/dtweston/NonaPics"
  s.license          = 'MIT'
  s.author           = { "Dave Weston" => "dave.weston@binocracy.com" }
  s.social_media_url = 'https://twitter.com/dt_weston'
  s.source           = { :git => "https://github.com/dtweston/NonaPics.git", :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files = 'Pod/Classes'
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
  s.prepare_command = './Pod/download_font.sh'
  s.osx.resource_bundles = {
    'NonaPics-OSX' => ['Pod/Assets/*']
  }
  s.ios.resource_bundles = {
    'NonaPics-iOS' => ['Pod/Assets/*']
  }
end
