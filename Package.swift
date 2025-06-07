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
                "AndroidJava",
                "AndroidManifest",
                "AndroidR",
                "AndroidAnimation",
                "AndroidOS",
                "AndroidApp",
                "AndroidUtil",
                "AndroidX",
                "AndroidWidget",
                "AndroidWebKit"
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
                "AndroidJavaLang",
                "AndroidJavaIO",
                "AndroidJavaTime",
                "AndroidJavaAWT",
                "AndroidJavaUtil"
            ],
            swiftSettings: [
              .swiftLanguageMode(.v5),
            ]
        ),
        .target(
            name: "AndroidJavaIO",
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
            ]
        ),
        .target(
            name: "AndroidJavaLang",
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
                    name: "JavaKitReflection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitIO",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitFunction",
                    package: "swift-java"
                ),
                "AndroidJavaIO"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
            ]
        ),
        .target(
            name: "AndroidJavaAWT",
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
                    name: "JavaKitReflection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitIO",
                    package: "swift-java"
                ),
                "AndroidJavaIO",
                "AndroidJavaLang"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
            ]
        ),
        .target(
            name: "AndroidJavaTime",
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
                    name: "JavaKitReflection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitIO",
                    package: "swift-java"
                ),
                "AndroidJavaLang",
                "AndroidJavaIO",
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
            ]
        ),
        .target(
            name: "AndroidJavaNet",
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
                    name: "JavaKitReflection",
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
                "AndroidJavaIO",
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
            ]
        ),
        .target(
            name: "AndroidJavaUtil",
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
                    name: "JavaKitReflection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitFunction",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitIO",
                    package: "swift-java"
                ),
                "AndroidJavaIO",
                "AndroidJavaLang",
                "AndroidJavaTime"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
            ]
        ),
        .target(
            name: "AndroidJavaBeans",
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
                    name: "JavaKitReflection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitFunction",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitIO",
                    package: "swift-java"
                ),
                "AndroidJavaIO"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
            ]
        ),
        .target(
            name: "AndroidJavaMath",
            dependencies: [
                "AndroidJavaLang"
            ],
            exclude: ["swift-java.config"],
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
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
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
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
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
                "AndroidJava"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
            ]
        ),
        .target(
            name: "AndroidApp",
            dependencies: [
                "AndroidJava",
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
            ]
        ),
        .target(
            name: "AndroidWidget",
            dependencies: [
                "AndroidJava",
                "AndroidApp"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
            ]
        ),
        .target(
            name: "AndroidX",
            dependencies: [
                "AndroidJava"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
            ]
        ),
        .target(
            name: "AndroidWebKit",
            dependencies: [
                "AndroidJava",
                "AndroidWidget",
                "AndroidApp"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
            ],
            plugins: [
              .plugin(name: "Java2SwiftPlugin", package: "swift-java"),
            ]
        ),
    ],
    swiftLanguageModes: [.v5]
)
