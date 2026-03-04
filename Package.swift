// swift-tools-version:5.9

import PackageDescription

let version = "0.0.1"
let checksum = "PLACEHOLDER"

let package = Package(
    name: "PulseKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "PulseKit", targets: ["PulseKitWrapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/open-telemetry/opentelemetry-swift-core.git", from: "2.2.0"),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.28.0"),
        .package(url: "https://github.com/kstenerud/KSCrash.git", from: "2.5.0"),
    ],
    targets: [
        .binaryTarget(
            name: "PulseKitBinary",
            url: "https://github.com/dream-horizon-org/pulse-ios/releases/download/\(version)/PulseKit.xcframework.zip",
            checksum: checksum
        ),
        .target(
            name: "PulseKitWrapper",
            dependencies: [
                "PulseKitBinary",
                .product(name: "OpenTelemetryApi", package: "opentelemetry-swift-core"),
                .product(name: "OpenTelemetrySdk", package: "opentelemetry-swift-core"),
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
                .product(name: "Recording", package: "KSCrash"),
                .product(name: "Filters", package: "KSCrash"),
            ],
            path: "Sources/PulseKitWrapper"
        ),
    ]
)
