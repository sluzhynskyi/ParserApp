platform :ios, '14.0'
plugin 'cocoapods-binary'

use_frameworks!
inhibit_all_warnings!
all_binary!

target 'Parser' do

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '5.0'
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
      config.build_settings['TARGETED_DEVICE_FAMILY'] = '1'
      config.build_settings['SUPPORTS_MACCATALYST'] = 'NO'
      
      config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
      config.build_settings['EXCLUDED_ARCHS[sdk=watchsimulator*]'] = 'arm64'
      config.build_settings['EXCLUDED_ARCHS[sdk=appletvsimulator*]'] = 'arm64'
      
      config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
      config.build_settings['SWIFT_SUPPRESS_WARNINGS'] = "YES"
    end
  end
end