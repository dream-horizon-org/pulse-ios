# PulseKit iOS SDK

PulseKit is a production-ready observability SDK for iOS applications, built on [OpenTelemetry](https://opentelemetry.io/). One-line initialization gives you full-stack instrumentation with sensible defaults — no manual span creation required.

## Features

- **Crash Reporting** — Automatic crash capture and symbolication via KSCrash
- **Network Monitoring** — URLSession instrumentation with request/response tracing
- **Interaction Tracking** — Tap, scroll, and gesture tracking with view hierarchy context
- **Session Management** — Automatic session lifecycle tracking
- **Location Instrumentation** — CoreLocation attribute enrichment
- **Network Status** — Connectivity and carrier info via CoreTelephony
- **SignPost Integration** — os_signpost bridging for performance insights
- **Device & OS Resource Attributes** — Automatic device model, OS version, and app metadata
- **OTLP Export** — Traces, metrics, and logs exported via OpenTelemetry Protocol (HTTP)
- **Persistence** — Offline buffering with automatic retry
- **Sampling** — Configurable sampling strategies for traces and logs

## Installation

### CocoaPods

PulseKit is a dynamic framework. Add it to your Podfile with `use_frameworks!` and the required `post_install` hook for module stability:

```ruby
platform :ios, '15.1'

target 'YourApp' do
  use_frameworks!
  pod 'PulseKit'
end

post_install do |installer|
  pulse_deps = ['OpenTelemetry-Swift-Api', 'OpenTelemetry-Swift-Sdk', 'SwiftProtobuf', 'KSCrash']
  installer.pods_project.targets.each do |target|
    if pulse_deps.any? { |dep| target.name.start_with?(dep) }
      target.build_configurations.each do |config|
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
    end
  end
end
```

### Swift Package Manager

Add the following in Xcode via **File > Add Package Dependencies**:

```
https://github.com/dream-horizon-org/pulse-ios.git
```

## Requirements

- iOS 15.1+
- Swift 5.10+
- Xcode 15+

## Quick Start

```swift
import PulseKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Pulse.shared.initialize(
            endpointBaseUrl: "https://your-endpoint.com/otlp",
            projectId: "your-project-id"
        )
        return true
    }
}
```

## Documentation

Full documentation is available at [pulse.dreamhorizon.org/docs/sdk/ios](https://pulse.dreamhorizon.org/docs/sdk/ios).

## License

PulseKit is available under the Apache 2.0 license. See the [LICENSE](LICENSE) file for details.
