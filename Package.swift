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
    targets: [
        .target(
            name: "SinterPixels"
        )
    ]
)
