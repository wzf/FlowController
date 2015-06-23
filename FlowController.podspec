Pod::Spec.new do |s|
  s.name         = "FlowController"
  s.version      = "0.0.1"
  s.summary      = "没有"
  s.description  = <<-DESC
                    就是一个控制流程的组件.
                   DESC
  s.homepage     = ""
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Jeff' => 'fengpromail@163.com' }
  s.source       = { :git => "https://github.com/wzf/FlowController.git"}
  s.platform     = :ios
  s.source_files = 'FCDemo/Classes/*.{h,m}'
  s.framework    = ""
  s.requires_arc = true
end
