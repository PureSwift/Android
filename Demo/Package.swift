// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "SwiftAndroidApp",
    platforms: [
      .macOS(.v15),
    ],
    products: [
        .library(
            name: "SwiftAndroidApp",
            type: .dynamic,
            targets: ["SwiftAndroidApp"]
        ),
        .library(
            name: "CatalogBridge",
            type: .dynamic,
            targets: ["CatalogBridge"]
        ),
    ],
    dependencies: [
        .package(
            path: "../"
        ),
        .package(
            url: "https://github.com/swiftlang/swift-java.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-android-sdk/swift-android-native.git",
            from: "2.1.0"
        )
    ],
    targets: [
        .target(
            name: "SwiftAndroidApp",
            dependencies: [
                .product(
                    name: "AndroidKit",
                    package: "Android"
                ),
                "CatalogBridge"
            ],
            path: "./app/src/main/swift",
            swiftSettings: [
              .swiftLanguageMode(.v5)
            ]
        ),
        .target(
            name: "CatalogBridge",
            dependencies: [
                .product(
                    name: "SwiftJava",
                    package: "swift-java"
                ),
                .product(
                    name: "AndroidKit",
                    package: "Android"
                ),
                .product(
                    name: "AndroidContext",
                    package: "swift-android-native"
                )
            ],
            path: "./app/src/main/swift-bridge/CatalogBridge",
            exclude: [
              "swift-java.config"
            ],
            swiftSettings: [
              .swiftLanguageMode(.v5)
            ],
            plugins: [
              .plugin(
                name: "JExtractSwiftPlugin",
                package: "swift-java"
              )
            ]
        )
    ]
)
