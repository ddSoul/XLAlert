
Pod::Spec.new do |s|


  s.name         = "XLAlert"
  s.version      = "0.0.1"
  s.summary      = "一个系统弹出框"

  s.description  = <<-DESC
    封装系统AlertController,扩展性好点
                   DESC

  s.homepage     = "https://github.com/ddSoul/XLAlert.git"
  s.license      = "MIT"
  s.author       = { "ddSoul" => "972424506@qq.com" }

  s.platform     = :ios, "7.0"

  s.source       = { :git => 'https://github.com/ddSoul/XLAlert.git', :tag => '0.1.1'}
  s.source_files  = "XLAlert", "XLAlert/XLAlert/**/*.{h,m}"


  s.framework  = "UIKit"
 

end
