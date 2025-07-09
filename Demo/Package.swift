// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "SwiftAndroidApp",
    platforms: [
      .macOS(.v13),
      .iOS(.v13),
      .tvOS(.v13),
      .watchOS(.v6),
      .macCatalyst(.v13),
    ],
    products: [
        .library(
            name: "SwiftAndroidApp",
            type: .dynamic,
            targets: ["SwiftAndroidApp"]
        ),
    ],
    dependencies: [
        .package(
            path: "../"
        )
    ],
    targets: [
        .target(
            name: "SwiftAndroidApp",
            dependencies: [
                .product(
                    name: "AndroidKit",
                    package: "Android"
                )
            ],
            path: "./app/src/main/swift",
            swiftSettings: [
              .swiftLanguageMode(.v5)
            ]
        )
    ]
)
