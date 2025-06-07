// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "SwiftAndroid",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "SwiftAndroid", targets: ["SwiftAndroid"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swiftlang/swift-java.git",
            branch: "main"
        ),
        // Deprecated
        .package(
            url: "https://github.com/PureSwift/JNI.git",
            branch: "master"
        ),
        .package(
            url: "https://github.com/PureSwift/java_util.git",
            branch: "master"
        )
    ],
    targets: [
        .target(
            name: "SwiftAndroid",
            dependencies: [
                .product(
                    name: "JavaKit",
                    package: "swift-java"
                ),
                .product(
                    name: "JNI",
                    package: "JNI"
                ),
                .product(
                    name: "java_util",
                    package: "java_util"
                )
            ],
            path: "Sources/Android"
        )
    ],
    swiftLanguageModes: [.v5]
)
