// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "lyrebird",
    platforms: [
        .macOS(.v10_12)
    ],
    products: [
        .library(name: "Mocka", targets: ["lyrebird"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "lyrebird", dependencies: [
            .product(name: "Vapor", package: "vapor"),
        ]),
        .testTarget(
            name: "lyrebirdTests",
            dependencies: ["lyrebird"]),
    ]
)
