// swift-tools-version:4.1
import PackageDescription

let package = Package(
    name: "Android",
    products: [
        .library(name: "Android", targets: ["Android"]),
        .library(name: "AndroidBluetooth", targets: ["AndroidBluetooth"])
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftJava/java_util.git", .branch("master")),
        .package(url: "https://github.com/PureSwift/JNI.git", .branch("master")),
        .package(url: "https://github.com/PureSwift/Bluetooth.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "Android",
            dependencies: ["java_util", "JNI"]
        ),
        .target(
            name: "AndroidBluetooth",
            dependencies: ["Android", "Bluetooth"]
        )
    ]
)
