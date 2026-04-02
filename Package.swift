// swift-tools-version:5.9

import PackageDescription

let version = "0.0.1-beta.4"

let package = Package(
    name: "PulseKit",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(name: "PulseKit", targets: ["PulseKitWrapper"]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "PulseKitBinary",
            path: "PulseKit.xcframework"
        ),
        .binaryTarget(
            name: "KSCrashBinary",
            path: "KSCrash.xcframework"
        ),
        .binaryTarget(
            name: "OpenTelemetryApiBinary",
            path: "OpenTelemetryApi.xcframework"
        ),
        .binaryTarget(
            name: "OpenTelemetrySdkBinary",
            path: "OpenTelemetrySdk.xcframework"
        ),
        .binaryTarget(
            name: "SwiftProtobufBinary",
            path: "SwiftProtobuf.xcframework"
        ),
        .binaryTarget(
            name: "libwebpBinary",
            path: "libwebp.xcframework"
        ),
        .target(
            name: "PulseKitWrapper",
            dependencies: [
                "PulseKitBinary",
                "KSCrashBinary",
                "OpenTelemetryApiBinary",
                "OpenTelemetrySdkBinary",
                "SwiftProtobufBinary",
                "libwebpBinary",
            ],
            path: "Sources/PulseKitWrapper"
        ),
    ]
)
