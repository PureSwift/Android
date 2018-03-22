import PackageDescription

let package = Package(
    name: "Android",
    targets: [
        Target(name: "Android")
    ],
    dependencies: [
        .Package(url: "https://github.com/SwiftJava/java_swift.git", versions: Version(2,1,1) ..< Version(3,0,0)),
        .Package(url: "https://github.com/SwiftJava/java_util.git", majorVersion: 2),
        .Package(url: "https://github.com/PureSwift/Bluetooth.git", majorVersion: 1),
        .Package(url: "https://github.com/PureSwift/JNI.git", majorVersion: 1)
    ]
)
