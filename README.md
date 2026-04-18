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

Add **PulseKit** to your `Podfile`:

```ruby
platform :ios, '13.0'

target 'YourApp' do
  pod 'PulseKit', '~> LATEST_VERSION'
end
```

### Swift Package Manager

Add the following in Xcode via **File > Add Package Dependencies**:

```
https://github.com/dream-horizon-org/pulse-ios.git
```

## Requirements

- iOS 13.0+
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
            apiKey: "API_KEY"
        )
        return true
    }
}
```

## Documentation

Full documentation is available at [https://pulse-ux.com](https://pulse-ux.com/docs/developer-guide/sdk/ios/installation).

## License

PulseKit is available under the Apache 2.0 license. See the [LICENSE](LICENSE) file for details.
