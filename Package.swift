// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "SwiftAndroid",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "AndroidKit", targets: ["AndroidKit"]
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
            name: "SwiftAndroidDeprecated",
            dependencies: [
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
        ),
        .target(
            name: "AndroidKit",
            dependencies: [
                .product(
                    name: "JavaKit",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitCollection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitIO",
                    package: "swift-java"
                ),/*
                "AndroidApp",
                "AndroidOS",
                "AndroidContent",
                "AndroidView"*/
            ],
            swiftSettings: [
              .swiftLanguageMode(.v5)
            ]
        ),
        .target(
            name: "AndroidApp",
            dependencies: [
                .product(
                    name: "JavaKit",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitCollection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitIO",
                    package: "swift-java"
                ),
                "AndroidContent",
                "AndroidGraphics",
                "AndroidNet",
                "AndroidWidget"
            ],
            swiftSettings: [
              .swiftLanguageMode(.v5)
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
            ]
        ),
        .target(
            name: "AndroidOS",
            dependencies: [
                .product(
                    name: "JavaKit",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitCollection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitIO",
                    package: "swift-java"
                ),
            ],
            swiftSettings: [
              .swiftLanguageMode(.v5)
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
            ]
        ),
        .target(
            name: "AndroidView",
            dependencies: [
                .product(
                    name: "JavaKit",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitCollection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitIO",
                    package: "swift-java"
                ),
            ],
            swiftSettings: [
              .swiftLanguageMode(.v5)
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
            ]
        ),
        .target(
            name: "AndroidContent",
            dependencies: [
                .product(
                    name: "JavaKit",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitCollection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitIO",
                    package: "swift-java"
                ),
                "AndroidOS",
                "AndroidView"
            ],
            swiftSettings: [
              .swiftLanguageMode(.v5)
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
            ]
        ),
        .target(
            name: "AndroidGraphics",
            dependencies: [
                .product(
                    name: "JavaKit",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitCollection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitIO",
                    package: "swift-java"
                )
            ],
            swiftSettings: [
              .swiftLanguageMode(.v5)
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
            ]
        ),
        .target(
            name: "AndroidNet",
            dependencies: [
                .product(
                    name: "JavaKit",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitCollection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitIO",
                    package: "swift-java"
                )
            ],
            swiftSettings: [
              .swiftLanguageMode(.v5)
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
            ]
        ),
        .target(
            name: "AndroidWidget",
            dependencies: [
                .product(
                    name: "JavaKit",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitCollection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitIO",
                    package: "swift-java"
                )
            ],
            swiftSettings: [
              .swiftLanguageMode(.v5)
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
            ]
        ),
        .target(
            name: "AndroidX",
            dependencies: [
                .product(
                    name: "JavaKit",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitCollection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitIO",
                    package: "swift-java"
                ),
            ],
            swiftSettings: [
              .swiftLanguageMode(.v5)
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
            ]
        ),
        .target(
            name: "AndroidUtil",
            dependencies: [
                .product(
                    name: "JavaKit",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitCollection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitIO",
                    package: "swift-java"
                )
            ],
            swiftSettings: [
              .swiftLanguageMode(.v5)
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
            ]
        )
    ],
    swiftLanguageModes: [.v5]
)
