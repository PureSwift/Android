// swift-tools-version: 6.1
import CompilerPluginSupport
import PackageDescription

import class Foundation.FileManager
import class Foundation.ProcessInfo

// Get NDK version from command line
let ndkVersion = ProcessInfo.processInfo.environment["ANDROID_NDK_VERSION"].flatMap { UInt($0) } ?? 27
let ndkVersionDefine = SwiftSetting.define("ANDROID_NDK_VERSION_" + ndkVersion.description)

// Get Android API version
let sdkVersion = ProcessInfo.processInfo.environment["ANDROID_SDK_VERSION"].flatMap { UInt($0) } ?? 29
let sdkVersionDefine = SwiftSetting.define("ANDROID_SDK_VERSION_" + ndkVersion.description)

// Conditionally enable features
let ndkBinder = sdkVersion >= 29 // binder_ndk Requires API 29

var package = Package(
    name: "SwiftAndroid",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "AndroidKit", targets: ["AndroidKit"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/PureSwift/swift-java.git",
            branch: "feature/android"
        ),
        .package(
            url: "https://github.com/PureSwift/JavaLang.git",
            branch: "master"
        ),
        .package(
            url: "https://github.com/PureSwift/Kotlin.git",
            branch: "master"
        ),
        .package(
            url: "https://github.com/PureSwift/Binder.git",
            branch: "master"
        ),
        .package(
            url: "https://github.com/PureSwift/Socket.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/apple/swift-log",
            from: "1.6.3"
        ),
        .package(
            url: "https://github.com/apple/swift-system",
            from: "1.5.0"
        )
    ],
    targets: [
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
                ),
                .product(
                    name: "JavaKitNetwork",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitFunction",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitReflection",
                    package: "swift-java"
                ),
                "AndroidNDK",
                "AndroidJava",
                "AndroidManifest",
                "AndroidR",
                "AndroidGraphics",
                "AndroidAnimation",
                "AndroidOS",
                "AndroidApp",
                "AndroidUtil",
                "AndroidX",
                "AndroidMaterial",
                "AndroidWidget",
                "AndroidWebKit",
                "AndroidLogging",
                "AndroidLooper"
            ],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              ndkVersionDefine,
              sdkVersionDefine
            ]
        ),
        .target(
            name: "AndroidJava",
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
                .product(
                    name: "JavaKitNetwork",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitFunction",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitReflection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitJar",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaLang",
                    package: "JavaLang"
                ),
                .product(
                    name: "JavaUtil",
                    package: "JavaLang"
                ),
                .product(
                    name: "JavaIO",
                    package: "JavaLang"
                ),
                .product(
                    name: "JavaNet",
                    package: "JavaLang"
                ),
                .product(
                    name: "JavaTime",
                    package: "JavaLang"
                ),
                .product(
                    name: "JavaAWT",
                    package: "JavaLang"
                )
            ],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              ndkVersionDefine,
              sdkVersionDefine
            ]
        ),
        .target(
            name: "AndroidManifest",
            dependencies: [
                "AndroidJava"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              ndkVersionDefine,
              sdkVersionDefine
            ]
        ),
        .target(
            name: "AndroidR",
            dependencies: [
                "AndroidJava"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
            ]
        ),
        .target(
            name: "AndroidAnimation",
            dependencies: [
                "AndroidJava"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              ndkVersionDefine,
              sdkVersionDefine
            ]
        ),
        .target(
            name: "AndroidUtil",
            dependencies: [
                "AndroidJava",
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              ndkVersionDefine,
              sdkVersionDefine
            ]
        ),
        .target(
            name: "AndroidOS",
            dependencies: [
                "AndroidJava",
                "AndroidNDK"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              ndkVersionDefine,
              sdkVersionDefine
            ]
        ),
        .target(
            name: "AndroidApp",
            dependencies: [
                "AndroidJava",
                "AndroidContent",
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              ndkVersionDefine,
              sdkVersionDefine
            ]
        ),
        .target(
            name: "AndroidContent",
            dependencies: [
                "AndroidJava",
                "AndroidUtil",
                "AndroidOS",
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              ndkVersionDefine,
              sdkVersionDefine
            ]
        ),
        .target(
            name: "AndroidGraphics",
            dependencies: [
                "AndroidJava",
                "AndroidUtil",
                "AndroidOS",
                "AndroidContent"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              ndkVersionDefine,
              sdkVersionDefine
            ]
        ),
        .target(
            name: "AndroidView",
            dependencies: [
                "AndroidJava",
                "AndroidUtil",
                "AndroidOS",
                "AndroidGraphics"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              ndkVersionDefine,
              sdkVersionDefine
            ]
        ),
        .target(
            name: "AndroidWidget",
            dependencies: [
                "AndroidJava",
                "AndroidUtil",
                "AndroidApp",
                "AndroidView",
                "AndroidContent"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              ndkVersionDefine,
              sdkVersionDefine
            ]
        ),
        .target(
            name: "AndroidX",
            dependencies: [
                .product(
                    name: "Kotlin",
                    package: "Kotlin"
                ),
                "AndroidJava",
                "AndroidUtil",
                "AndroidApp",
                "AndroidView",
                "AndroidContent",
                "AndroidWidget"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              ndkVersionDefine,
              sdkVersionDefine
            ]
        ),
        .target(
            name: "AndroidMaterial",
            dependencies: [
                "AndroidJava",
                "AndroidUtil",
                "AndroidApp",
                "AndroidView",
                "AndroidContent",
                "AndroidWidget"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              ndkVersionDefine,
              sdkVersionDefine
            ]
        ),
        .target(
            name: "AndroidWebKit",
            dependencies: [
                "AndroidJava",
                "AndroidView",
                "AndroidWidget",
                "AndroidApp"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              ndkVersionDefine,
              sdkVersionDefine
            ]
        ),
        .target(
            name: "AndroidLogging",
            dependencies: [
                .product(
                    name: "SystemPackage",
                    package: "swift-system"
                ),
                .product(
                    name: "Logging",
                    package: "swift-log"
                )
            ],
            swiftSettings: [
              .swiftLanguageMode(.v6),
              ndkVersionDefine,
              sdkVersionDefine
            ],
            linkerSettings: [
                .linkedLibrary("log", .when(platforms: [.android]))
            ]
        ),
        .target(
            name: "AndroidLooper",
            dependencies: [
                .product(
                    name: "SystemPackage",
                    package: "swift-system"
                ),
                .product(
                    name: "Socket",
                    package: "Socket"
                ),
                "AndroidNDK"
            ],
            swiftSettings: [
              .swiftLanguageMode(.v6),
              ndkVersionDefine,
              sdkVersionDefine
            ],
            linkerSettings: [
                .linkedLibrary("android", .when(platforms: [.android]))
            ]
        ),
        .target(
            name: "AndroidNDK",
            cxxSettings: [
                .define("ANDROID_NDK_VERSION", to: ndkVersion.description),
                .define("ANDROID_SDK_VERSION", to: sdkVersion.description)
            ],
            linkerSettings: [
                .linkedLibrary("android", .when(platforms: [.android]))
            ]
        )
    ],
    swiftLanguageModes: [.v5, .v6]
)

if ndkBinder {
    // Add the binder target
    let binderTarget = Target.target(
        name: "AndroidBinder",
        dependencies: [
            .product(
                name: "SystemPackage",
                package: "swift-system"
            ),
            .product(
                name: "Binder",
                package: "Binder"
            ),
            "AndroidNDK"
        ],
        swiftSettings: [
          .swiftLanguageMode(.v6)
        ],
        linkerSettings: [
            .linkedLibrary("binder_ndk", .when(platforms: [.android]))
        ]
    )
    package.targets.append(binderTarget)
    // add as dependency to AndroidOS
    if let index = package.targets.firstIndex(where: { $0.name == "AndroidOS" }) {
        package.targets[index].dependencies.append("AndroidBinder")
    }
    // add as dependency to AndroidKit
    if let index = package.targets.firstIndex(where: { $0.name == "AndroidKit" }) {
        package.targets[index].dependencies.append("AndroidBinder")
    }
}
