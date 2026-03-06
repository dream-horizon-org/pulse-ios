// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "PulseKitValidation",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "PulseKitValidation", targets: ["PulseKitValidation"])
    ],
    dependencies: [
        .package(path: "../"),
        .package(url: "https://github.com/open-telemetry/opentelemetry-swift-core.git", from: "2.2.0"),
    ],
    targets: [
        .target(
            name: "PulseKitValidation",
            dependencies: [
                .product(name: "PulseKit", package: "PulseKit"),
                .product(name: "OpenTelemetryApi", package: "opentelemetry-swift-core"),
            ]
        ),
    ]
)
