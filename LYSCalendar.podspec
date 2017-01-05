Pod::Spec.new do |s|

  s.name = 'LYSCalendar'
  s.version = '0.0.3.1'
  s.license = 'MIT'
  s.summary = '日历控件-测试'

  s.homepage = 'https://github.com/MrLiuYS/LYSCalendar'
  s.author = { 'Mr LYS' => '3050700400@qq.com' }

  s.source = {
    :git => 'https://github.com/MrLiuYS/LYSCalendar.git',
    :tag => "#{s.version}"
  }
  s.platform = :ios, '7.0'
#   s.source_files = 'Pod/Classes/**/*'
  s.source_files = 'LYSCalendar/**/*'

  s.requires_arc = true
  
  s.dependency 'Masonry', '~> 1.0.1'

end
