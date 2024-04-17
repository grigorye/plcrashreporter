Pod::Spec.new do |spec|
  spec.cocoapods_version = '>= 1.10'
  spec.name        = 'PLCrashReporter'
  spec.version     = '1.11.1'
  spec.summary     = 'Reliable, open-source crash reporting for iOS, macOS and tvOS.'
  spec.description = 'PLCrashReporter is a reliable open source library that provides an in-process live crash reporting framework for use on iOS, macOS and tvOS. The library detects crashes and generates reports to help your investigation and troubleshooting with the information of application, system, process, thread, etc. as well as stack traces.'

  spec.homepage    = 'https://github.com/microsoft/plcrashreporter'
  spec.license     = { :type => 'MIT', :file => 'LICENSE.txt' }
  spec.authors     = { 'Microsoft' => 'appcentersdk@microsoft.com' }

  spec.module_name = 'CrashReporter'

  spec.source      = { :http     => "https://github.com/microsoft/plcrashreporter/releases/download/#{spec.version}/PLCrashReporter-Static-#{spec.version}.xcframework.zip",
                       :flatten  => true }

  spec.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '"${PODS_TARGET_SRCROOT}/Dependencies/protobuf-c"',
    'GCC_PREPROCESSOR_DEFINITIONS' => 'PLCR_PRIVATE=1 PLCRASHREPORTER_PREFIX=""',
  }
  spec.module_map = 'Resources/CrashReporter.modulemap'

  spec.source_files = [
    "Source/*.{h,m,c,mm,hpp,cpp,S}",
    "Dependencies/protobuf-c/**/*.{h,c}"
  ]

  spec.ios.deployment_target    = '11.0'
  spec.osx.deployment_target    = '10.9'
  spec.tvos.deployment_target   = '11.0'
end
