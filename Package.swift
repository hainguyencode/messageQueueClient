// swift-tools-version:3.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if os(Linux)
let package = Package(
    name: "Client",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        // .Package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", versions: Version(1, 0, 0)..<Version(3, .max, .max)),
        .Package(url:"https://github.com/PerfectlySoft/Perfect-Mosquitto.git", majorVersion: 1),
        .Package(url: "https://github.com/PerfectlySoft/Perfect-libMosquitto.git", majorVersion: 1),
        .Package(url: "https://github.com/PerfectlySoft/Perfect-LinuxBridge.git", majorVersion: 2)
//        .Package(url:"https://github.com/PerfectlySoft/Perfect-Mosquitto.git", majorVersion: 1)
    ]
//    targets: [
//        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
//        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
//        .target(
//            name: "Client",
//            dependencies: []),
//        ]
)
#else
let package = Package(
    name: "Client",
    dependencies: [
        // .Package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", versions: Version(1, 0, 0)..<Version(3, .max, .max)),
        .Package(url:"https://github.com/PerfectlySoft/Perfect-Mosquitto.git", majorVersion: 1)]
)
#endif
