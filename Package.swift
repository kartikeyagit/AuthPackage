// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuthPackage",
    platforms: [
        .iOS(.v13)  // Adjust as per your platform requirements
    ],
    products: [
        .library(
            name: "AuthPackage",
            targets: ["AuthPackage"]
        ),
    ],
    targets: [
        .target(
            name: "AuthPackage",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "AuthManagerTests",
            dependencies: ["AuthPackage"],
            path: "Tests"
        ),
    ]
)
