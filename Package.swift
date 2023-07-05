// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Paylink",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Paylink",
            targets: ["Paylink"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .binaryTarget(name: "Paylink", url: "https://developer.paylink.sa/assets/downloads/PLPaymentGateway.xcframework.zip", checksum: "5a5a76cd2aae0f933b28b7ffe9f4b97cd5dd1c4b9605b86769eb90374b1b4d84")
    ]
)
