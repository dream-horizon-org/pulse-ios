Pod::Spec.new do |spec|
  spec.name         = "PulseKit"
  spec.version      = "0.0.1-beta.3"
  spec.summary      = "Pulse iOS SDK - Simplified OpenTelemetry for iOS"
  spec.description  = <<-DESC
    Pulse iOS SDK is a production-ready SDK for instrumenting iOS applications
    with OpenTelemetry. Distributed as a prebuilt binary framework.
  DESC

  spec.homepage     = "https://github.com/dream-horizon-org/pulse-ios"
  spec.license      = { :type => "Apache 2.0", :file => "LICENSE" }
  spec.authors      = { "Pulse iOS SDK" => "support@dream-horizon.org" }

  spec.source       = {
    :git => "https://github.com/dream-horizon-org/pulse-ios.git",
    :tag => "#{spec.version}"
  }

  spec.ios.deployment_target = "15.1"

  spec.vendored_frameworks = "PulseKit.xcframework"
  spec.swift_version = "5.10"

  spec.dependency 'OpenTelemetry-Swift-Api', '2.2.0'
  spec.dependency 'OpenTelemetry-Swift-Sdk', '2.2.0'
  spec.dependency 'SwiftProtobuf', '~> 1.28'
  spec.dependency 'KSCrash', '~> 2.5'
end
