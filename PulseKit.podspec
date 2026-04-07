Pod::Spec.new do |spec|
  spec.name         = "PulseKit"
  spec.version      = "0.0.1-beta.1"
  spec.summary      = "Pulse iOS SDK - Simplified OpenTelemetry for iOS"
  spec.description  = <<-DESC
    Pulse iOS SDK is a production-ready SDK for instrumenting iOS applications
    with OpenTelemetry. Distributed as prebuilt xcframeworks (PulseKit and peer
    dependencies)
  DESC

  spec.homepage     = "https://github.com/dream-horizon-org/pulse-ios"
  spec.license      = { :type => "Apache 2.0", :file => "LICENSE" }
  spec.authors      = { "Pulse iOS SDK" => "support@dream-horizon.org" }

  spec.source       = {
    :git => "https://github.com/dream-horizon-org/pulse-ios.git",
    :tag => "#{spec.version}"
  }

  spec.ios.deployment_target = "15.1"

  spec.vendored_frameworks = [
    "PulseKit.xcframework",
    "KSCrash.xcframework",
    "OpenTelemetryApi.xcframework",
    "OpenTelemetrySdk.xcframework",
    "SwiftProtobuf.xcframework",
    "libwebp.xcframework",
  ]
  spec.swift_version = "5.10"
end
