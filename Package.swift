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
                ),
                "AndroidApp",
                "AndroidOS",
                "AndroidContent",
                "AndroidView",
                "AndroidX",
                "AndroidUtil",
                "AndroidGraphics",
                "AndroidNet"
            ],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              .unsafeFlags(["-I\(javaIncludePath)", "-I\(javaPlatformIncludePath)"]),
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
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              .unsafeFlags(["-I\(javaIncludePath)", "-I\(javaPlatformIncludePath)"]),
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
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              .unsafeFlags(["-I\(javaIncludePath)", "-I\(javaPlatformIncludePath)"]),
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
                "AndroidOS"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              .unsafeFlags(["-I\(javaIncludePath)", "-I\(javaPlatformIncludePath)"]),
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
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              .unsafeFlags(["-I\(javaIncludePath)", "-I\(javaPlatformIncludePath)"]),
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
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              .unsafeFlags(["-I\(javaIncludePath)", "-I\(javaPlatformIncludePath)"]),
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
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              .unsafeFlags(["-I\(javaIncludePath)", "-I\(javaPlatformIncludePath)"]),
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
                ),
                "AndroidUtil"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              .unsafeFlags(["-I\(javaIncludePath)", "-I\(javaPlatformIncludePath)"]),
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
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              .unsafeFlags(["-I\(javaIncludePath)", "-I\(javaPlatformIncludePath)"]),
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
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              .unsafeFlags(["-I\(javaIncludePath)", "-I\(javaPlatformIncludePath)"]),
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
            ]
        )
    ],
    swiftLanguageModes: [.v5]
)
