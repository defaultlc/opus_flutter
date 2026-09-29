// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "opus_codec_ios",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "opus-codec-ios", targets: ["opus_codec_ios"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "opus_codec_ios",
            dependencies: [
                .target(name: "opus"),
                .target(name: "OpusCtlBridge")
            ]
        ),
        .target(
            name: "OpusCtlBridge",
            dependencies: [.target(name: "opus")],
            path: "Sources/OpusCtlBridge",
            publicHeadersPath: "include"
        ),
        .binaryTarget(
            name: "opus",
            path: "opus.xcframework"
        )
    ]
)
