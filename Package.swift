// swift-tools-version: 6.2
import CompilerPluginSupport
import PackageDescription

import class Foundation.FileManager
import class Foundation.ProcessInfo

// Get NDK version from command line
let ndkVersion = ProcessInfo.processInfo.environment["ANDROID_NDK_VERSION"].flatMap { UInt($0) } ?? 27
let ndkVersionDefine = SwiftSetting.define("ANDROID_NDK_VERSION_" + ndkVersion.description)

// Get Android API version
let sdkVersion = ProcessInfo.processInfo.environment["ANDROID_SDK_VERSION"].flatMap { UInt($0) } ?? 28
let sdkVersionDefine = SwiftSetting.define("ANDROID_SDK_VERSION_" + sdkVersion.description)

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
        ),
        .library(
            name: "AndroidJava", targets: ["AndroidJava"]
        ),
        .library(
            name: "AndroidManifest", targets: ["AndroidManifest"]
        ),
        .library(
            name: "AndroidR", targets: ["AndroidR"]
        ),
        .library(
            name: "AndroidAnimation", targets: ["AndroidAnimation"]
        ),
        .library(
            name: "AndroidUtil", targets: ["AndroidUtil"]
        ),
        .library(
            name: "AndroidOS", targets: ["AndroidOS"]
        ),
        .library(
            name: "AndroidApp", targets: ["AndroidApp"]
        ),
        .library(
            name: "AndroidContent", targets: ["AndroidContent"]
        ),
        .library(
            name: "AndroidGraphics", targets: ["AndroidGraphics"]
        ),
        .library(
            name: "AndroidView", targets: ["AndroidView"]
        ),
        .library(
            name: "AndroidWidget", targets: ["AndroidWidget"]
        ),
        .library(
            name: "AndroidX", targets: ["AndroidX"]
        ),
        .library(
            name: "AndroidMaterial", targets: ["AndroidMaterial"]
        ),
        .library(
            name: "AndroidWebKit", targets: ["AndroidWebKit"]
        ),
        .library(
            name: "AndroidLogging", targets: ["AndroidLogging"]
        ),
        .library(
            name: "AndroidLooper", targets: ["AndroidLooper"]
        ),
        .library(
            name: "AndroidNDK", targets: ["AndroidNDK"]
        ),
        .library(
            name: "AndroidHardware", targets: ["AndroidHardware"]
        ),
        .library(
            name: "AndroidFileManager", targets: ["AndroidFileManager"]
        ),
        .library(
            name: "AndroidNativeActivity", targets: ["AndroidNativeActivity"]
        ),
        .library(
            name: "AndroidInput", targets: ["AndroidInput"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swiftlang/swift-java.git",
            branch: "main"
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
                    name: "SwiftJava",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaIO",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaNet",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaUtilFunction",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaLangReflect",
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
                "AndroidLooper",
                "AndroidHardware",
                "AndroidFileManager",
                "AndroidNativeActivity",
                "AndroidInput"
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
                    name: "SwiftJava",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaIO",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaNet",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaUtilFunction",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaLangReflect",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaUtilJar",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaLang",
                    package: "JavaLang"
                ),
                .product(
                    name: "JavaLangUtil",
                    package: "JavaLang"
                ),
                .product(
                    name: "JavaLangIO",
                    package: "JavaLang"
                ),
                .product(
                    name: "JavaLangNet",
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
                "AndroidNDK",
                "AndroidFileManager",
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
        ),
        .target(
            name: "AndroidHardware",
            dependencies: [
                "AndroidNDK",
                "AndroidLooper"
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
            name: "AndroidFileManager",
            dependencies: [
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
            name: "AndroidManifest",
            dependencies: [
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
            name: "AndroidNativeActivity",
            dependencies: [
                "AndroidNDK",
                "AndroidLooper",
                "AndroidFileManager",
                "AndroidInput",
                .product(
                    name: "SystemPackage",
                    package: "swift-system"
                )
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
            name: "AndroidInput",
            dependencies: [
                "AndroidNDK",
                "AndroidLooper"
            ],
            swiftSettings: [
              .swiftLanguageMode(.v6),
              ndkVersionDefine,
              sdkVersionDefine
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
    
    // Add the binder product
    let binderProduct = Product.library(
        name: "AndroidBinder",
        targets: ["AndroidBinder"]
    )
    package.products.append(binderProduct)
    
    // add as dependency to AndroidOS
    if let index = package.targets.firstIndex(where: { $0.name == "AndroidOS" }) {
        package.targets[index].dependencies.append("AndroidBinder")
    }
    // add as dependency to AndroidKit
    if let index = package.targets.firstIndex(where: { $0.name == "AndroidKit" }) {
        package.targets[index].dependencies.append("AndroidBinder")
    }
}
