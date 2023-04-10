# coding: utf-8
Pod::Spec.new do |s|
  s.name             = 'VRDispatcher'
  s.version          = '1.0.0'
  s.summary          = 'VRDispatcher'

  s.description      = <<-DESC
  VRDispatcher
  DESC

  s.homepage    = 'https://gitee.com/wufeng924111'
  s.author      = { 'panzhiwen' => 'panzhiwen@foxmail.com' }
  s.license     = { type: 'MIT', file: 'LICENSE' }
  s.source      = { git: 'git@git.panzhiwen.com', tag: s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.swift_version='5.0'

  s.source_files = 'Classes/**/*.{h,m,swift}'
  
  s.resources = ["VRDispatcher/**/**/*.{xcassets,xib,storyboard,gif,png,jpg,mp3,MP4,mp4,zip,plist,acc,dat,bin,dms,html,js,a}"]
  
end
