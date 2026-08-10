// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SinterPixels",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "SinterPixels",
            targets: ["SinterPixels"]
        )
    ],
    dependencies: [
    .package(url: "https://github.com/olofhellman/SinterAppleEvents.git", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "SinterPixels",
            dependencies: [
                .product(name: "SinterAppleEvents", package: "SinterAppleEvents")
            ]
        )
    ]
)
