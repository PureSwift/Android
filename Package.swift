// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import CompilerPluginSupport
import PackageDescription

import class Foundation.FileManager
import class Foundation.ProcessInfo

// Note: the JAVA_HOME environment variable must be set to point to where
// Java is installed, e.g.,
//   Library/Java/JavaVirtualMachines/openjdk-21.jdk/Contents/Home.
func findJavaHome() -> String {
  if let home = ProcessInfo.processInfo.environment["JAVA_HOME"] {
    return home
  }

  // This is a workaround for envs (some IDEs) which have trouble with
  // picking up env variables during the build process
  let path = "\(FileManager.default.homeDirectoryForCurrentUser.path()).java_home"
  if let home = try? String(contentsOfFile: path, encoding: .utf8) {
    if let lastChar = home.last, lastChar.isNewline {
      return String(home.dropLast())
    }

    return home
  }

  fatalError("Please set the JAVA_HOME environment variable to point to where Java is installed.")
}
let javaHome = findJavaHome()

let javaIncludePath = "\(javaHome)/include"
#if os(Linux)
  let javaPlatformIncludePath = "\(javaIncludePath)/linux"
#elseif os(macOS)
  let javaPlatformIncludePath = "\(javaIncludePath)/darwin"
#elseif os(Windows)
  let javaPlatformIncludePath = "\(javaIncludePath)/win32"
#endif

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
            url: "https://github.com/PureSwift/swift-java.git",
            branch: "feature/android-shim"
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
                .product(
                    name: "Binder",
                    package: "Binder"
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
                "AndroidBinder"
            ],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              .unsafeFlags(["-I\(javaIncludePath)", "-I\(javaPlatformIncludePath)"]),
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
            ]
        ),
        .target(
            name: "AndroidLooper",
            dependencies: [
                .product(
                    name: "SystemPackage",
                    package: "swift-system"
                ),
                "AndroidNDK"
            ],
            swiftSettings: [
              .swiftLanguageMode(.v6)
            ]
        ),
        .target(
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
            ]
        ),
        .target(
            name: "AndroidNDK",
            linkerSettings: [
                .linkedLibrary("android", .when(platforms: [.android])),
                .linkedLibrary("log", .when(platforms: [.android])),
            ]
        )
    ],
    swiftLanguageModes: [.v5, .v6]
)
