Pod::Spec.new do |s|
  s.name             = 'SSCTaglistView'
  s.version          = '0.1.7'
  s.summary          = 'Simple but highly customizable iOS tag list view, in Swift.'
 
  s.description      = 'Simple but highly customizable iOS tag list view, in Swift. User can delete the tag.'
 
  s.homepage         = 'https://github.com/sanjaysinh-Chauhan/SSCTaglistView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sanjaysinh Chauhan' => 'sanjay07dce050@gmail.com' }
  s.source           = { :git => 'https://github.com/sanjaysinh-Chauhan/SSCTaglistView.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'TaglistCollectionDemo/TaglistCollectionDemo/Classes/**/*'

end
