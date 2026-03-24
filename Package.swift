// swift-tools-version: 6.2
import CompilerPluginSupport
import PackageDescription

import class Foundation.FileManager
import class Foundation.ProcessInfo

// Get NDK version from command line
let ndkVersion =
  ProcessInfo.processInfo.environment["ANDROID_NDK_VERSION"].flatMap { UInt($0) } ?? 27
let ndkVersionDefine = SwiftSetting.define("ANDROID_NDK_VERSION_" + ndkVersion.description)

// Get Android API version
let sdkVersion =
  ProcessInfo.processInfo.environment["ANDROID_SDK_VERSION"].flatMap { UInt($0) } ?? 28
let sdkVersionDefine = SwiftSetting.define("ANDROID_SDK_VERSION_" + sdkVersion.description)

// Conditionally enable features
let ndkBinder = sdkVersion >= 29  // binder_ndk Requires API 29

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
      name: "AndroidLocation", targets: ["AndroidLocation"]
    ),
    .library(
      name: "AndroidMedia", targets: ["AndroidMedia"]
    ),
    .library(
      name: "AndroidNet", targets: ["AndroidNet"]
    ),
    .library(
      name: "AndroidNFC", targets: ["AndroidNFC"]
    ),
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
      url: "https://github.com/swift-android-sdk/swift-android-native.git",
      // TODO: restore main after https://github.com/swift-android-sdk/swift-android-native/pull/24 is resolved
      // branch: "main"
      branch: "weak-binder-symbol"
    ),
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
        .product(
            name: "AndroidLogging",
            package: "swift-android-native"
        ),
        .product(
            name: "AndroidLooper",
            package: "swift-android-native"
        ),
        .product(
            name: "AndroidManifest",
            package: "swift-android-native"
        ),
        .product(
            name: "AndroidHardware",
            package: "swift-android-native"
        ),
        .product(
            name: "AndroidFileManager",
            package: "swift-android-native"
        ),
        .product(
            name: "AndroidInput",
            package: "swift-android-native"
        ),
        "AndroidJava",
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
        "AndroidLocation",
        "AndroidMedia",
        "AndroidNFC",
        "AndroidNet",
      ],
      swiftSettings: [
        .swiftLanguageMode(.v5),
        ndkVersionDefine,
        sdkVersionDefine,
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
        ),
      ],
      swiftSettings: [
        .swiftLanguageMode(.v5),
        ndkVersionDefine,
        sdkVersionDefine,
      ]
    ),
    .target(
      name: "AndroidR",
      dependencies: [
        "AndroidJava"
      ],
      exclude: ["swift-java.config"],
      swiftSettings: [
        .swiftLanguageMode(.v5)
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
        sdkVersionDefine,
      ]
    ),
    .target(
      name: "AndroidUtil",
      dependencies: [
        "AndroidJava"
      ],
      exclude: ["swift-java.config"],
      swiftSettings: [
        .swiftLanguageMode(.v5),
        ndkVersionDefine,
        sdkVersionDefine,
      ]
    ),
    .target(
      name: "AndroidOS",
      dependencies: [
        "AndroidJava",
        .product(
            name: "AndroidSystem",
            package: "swift-android-native"
        ),
      ],
      exclude: ["swift-java.config"],
      swiftSettings: [
        .swiftLanguageMode(.v5),
        ndkVersionDefine,
        sdkVersionDefine,
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
        sdkVersionDefine,
      ]
    ),
    .testTarget(
        name: "AndroidAppTests",
        dependencies: [
            "AndroidJava",
            "AndroidApp",
            .product(
                name: "AndroidContext",
                package: "swift-android-native"
            ),
            .product(
              name: "SwiftJava",
              package: "swift-java"
            ),
        ]
    ),
    .target(
      name: "AndroidContent",
      dependencies: [
        "AndroidJava",
        "AndroidUtil",
        "AndroidOS",
        .product(
          name: "AndroidFileManager",
          package: "swift-android-native"
        ),
      ],
      exclude: ["swift-java.config"],
      swiftSettings: [
        .swiftLanguageMode(.v5),
        ndkVersionDefine,
        sdkVersionDefine,
      ]
    ),
    .target(
      name: "AndroidGraphics",
      dependencies: [
        "AndroidJava",
        "AndroidUtil",
        "AndroidOS",
        "AndroidContent",
      ],
      exclude: ["swift-java.config"],
      swiftSettings: [
        .swiftLanguageMode(.v5),
        ndkVersionDefine,
        sdkVersionDefine,
      ]
    ),
    .target(
      name: "AndroidView",
      dependencies: [
        "AndroidJava",
        "AndroidUtil",
        "AndroidOS",
        "AndroidGraphics",
      ],
      exclude: ["swift-java.config"],
      swiftSettings: [
        .swiftLanguageMode(.v5),
        ndkVersionDefine,
        sdkVersionDefine,
      ]
    ),
    .target(
      name: "AndroidWidget",
      dependencies: [
        "AndroidJava",
        "AndroidUtil",
        "AndroidApp",
        "AndroidView",
        "AndroidContent",
      ],
      exclude: ["swift-java.config"],
      swiftSettings: [
        .swiftLanguageMode(.v5),
        ndkVersionDefine,
        sdkVersionDefine,
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
        "AndroidWidget",
      ],
      exclude: ["swift-java.config"],
      swiftSettings: [
        .swiftLanguageMode(.v5),
        ndkVersionDefine,
        sdkVersionDefine,
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
        "AndroidWidget",
      ],
      exclude: ["swift-java.config"],
      swiftSettings: [
        .swiftLanguageMode(.v5),
        ndkVersionDefine,
        sdkVersionDefine,
      ]
    ),
    .target(
      name: "AndroidWebKit",
      dependencies: [
        "AndroidJava",
        "AndroidView",
        "AndroidWidget",
        "AndroidApp",
      ],
      exclude: ["swift-java.config"],
      swiftSettings: [
        .swiftLanguageMode(.v5),
        ndkVersionDefine,
        sdkVersionDefine,
      ]
    ),
    .target(
      name: "AndroidLocation",
      dependencies: [
        "AndroidJava",
        "AndroidOS",
        "AndroidUtil",
        "AndroidContent",
      ],
      exclude: ["swift-java.config"],
      swiftSettings: [
        .swiftLanguageMode(.v5),
        ndkVersionDefine,
        sdkVersionDefine,
      ]
    ),
    .target(
      name: "AndroidMedia",
      dependencies: [
        "AndroidJava",
        "AndroidOS",
        "AndroidUtil",
        "AndroidContent",
        .product(name: "JavaIO", package: "swift-java"),
        .product(name: "JavaLangUtil", package: "JavaLang"),
      ],
      exclude: ["swift-java.config"],
      swiftSettings: [
        .swiftLanguageMode(.v5),
        ndkVersionDefine,
        sdkVersionDefine,
      ]
    ),
    .target(
      name: "AndroidNet",
      dependencies: [
        "AndroidJava",
        "AndroidOS",
        "AndroidUtil",
        "AndroidContent",
        .product(name: "JavaLangUtil", package: "JavaLang"),
        .product(name: "JavaLangIO", package: "JavaLang"),
        .product(name: "JavaLangNet", package: "JavaLang"),
        .product(name: "JavaIO", package: "swift-java"),
      ],
      exclude: ["swift-java.config"],
      swiftSettings: [
        .swiftLanguageMode(.v5),
        ndkVersionDefine,
        sdkVersionDefine,
      ]
    ),
    .target(
      name: "AndroidNFC",
      dependencies: [
        "AndroidJava",
        "AndroidOS",
        "AndroidUtil",
        "AndroidContent",
        "AndroidApp",
        "AndroidNet",
        .product(name: "JavaLangIO", package: "JavaLang"),
      ],
      exclude: ["swift-java.config"],
      swiftSettings: [
        .swiftLanguageMode(.v5),
        ndkVersionDefine,
        sdkVersionDefine,
      ]
    ),
  ],
  swiftLanguageModes: [.v5, .v6]
)

if ndkBinder {
  let binderDependency: Target.Dependency = .product(
    name: "AndroidBinder", package: "swift-android-native")
  // add as dependency to AndroidOS
  if let index = package.targets.firstIndex(where: { $0.name == "AndroidOS" }) {
    package.targets[index].dependencies.append(binderDependency)
  }
  // add as dependency to AndroidKit
  if let index = package.targets.firstIndex(where: { $0.name == "AndroidKit" }) {
    package.targets[index].dependencies.append(binderDependency)
  }
}
