# Uncomment the next line to define a global platform for your project
# platform :ios, '15.0'

target 'Media-Player' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!

  # Pods for Media-Player
pod 'IQKeyboardManagerSwift'
pod 'ObjectMapper'
pod 'Alamofire'
pod 'CRRefresh'
pod 'SwiftLint'
pod 'UIView-Shimmer'
pod 'SDWebImage'

  target 'Media-PlayerTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Media-PlayerUITests' do
    # Pods for testing
  end
  
  post_install do |installer|
   installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
     config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
     config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
    end
   end
  end

end
