plugins {
    alias(libs.plugins.android.application)
    alias(libs.plugins.kotlin.android)
    alias(libs.plugins.kotlin.compose)
}

// ---------------------------------------------------------------------------
// swift-java (jextract, JNI mode) integration
//
// The Swift package (SwiftAndroidApp + CatalogBridge) is cross-compiled to
// native `.so`s with the official Swift Android SDK; the `JExtractSwiftPlugin`
// emits the Java JNI bindings as a side effect of `swift build`. Gradle then
// adds the generated Java + SwiftKitCore runtime sources to the source set and
// stages every required `.so` into `jniLibs`.
// ---------------------------------------------------------------------------

val swiftPackageRoot: File = rootProject.projectDir
val androidTriple = "aarch64-unknown-linux-android28"
val swiftAbi = "arm64-v8a"
val userHome: String = System.getProperty("user.home")

// Configuration the Swift package is cross-compiled with, independent of the
// Android build type. Override with `-PswiftBuildConfig=release`.
val swiftBuildConfig: String = (findProperty("swiftBuildConfig") as String?) ?: "debug"

// Locates both the toolchain and the matching Android SDK artifactbundle.
val swiftToolchainVersion: String = (findProperty("swiftToolchainVersion") as String?) ?: "6.3.3"

// The Android SDK's prebuilt Swift modules require the matching swift.org
// toolchain. Override with `-PswiftBin=/path/to/swift` if installed elsewhere.
val swiftBin: String = (findProperty("swiftBin") as String?)
    ?: "$userHome/Library/Developer/Toolchains/swift-$swiftToolchainVersion-RELEASE.xctoolchain/usr/bin/swift"

// swift-java's `enableJavaCallbacks` feature runs its own internal Gradle
// sub-build to compile the generated Java callback interfaces, requiring a
// modern JDK — independent of whatever JDK runs *this* Gradle build.
// Override with `-PcallbacksJdkHome=/path/to/jdk`.
val callbacksJdkHome: String = (findProperty("callbacksJdkHome") as String?)
    ?: "/opt/homebrew/opt/openjdk@25"

// SwiftPM plugin output convention: `outputs/<package-dir-lowercased>/<TargetName>/...`.
val generatedJavaDir = File(swiftPackageRoot, ".build/plugins/outputs/demo/CatalogBridge/destination/JExtractSwiftPlugin/src/generated/java")
val swiftKitCoreDir = File(swiftPackageRoot, ".build/checkouts/swift-java/SwiftKitCore/src/main/java")
val swiftBuildDir = File(swiftPackageRoot, ".build/$androidTriple/$swiftBuildConfig")
val swiftAndroidRuntimeDir = File(
    (findProperty("swiftAndroidRuntimeDir") as String?)
        ?: "$userHome/Library/org.swift.swiftpm/swift-sdks/swift-${swiftToolchainVersion}-RELEASE_android.artifactbundle/swift-android/swift-resources/usr/lib/swift-aarch64/android"
)

// Supplies libc++_shared.so, which every Swift Android binary links against.
val ndkRoot = File(
    (findProperty("ndkRoot") as String?)
        ?: System.getenv("ANDROID_NDK_HOME")
        ?: System.getenv("ANDROID_NDK_ROOT")
        ?: "$userHome/Library/Android/sdk/ndk/27.2.12479018"
)

// Cross-compile the Swift package + generate the JNI Java bindings.
val jextract = tasks.register<Exec>("jextract") {
    workingDir = swiftPackageRoot
    environment("JAVA_HOME", callbacksJdkHome)
    commandLine(
        swiftBin, "build",
        "--swift-sdk", androidTriple,
        "-c", swiftBuildConfig,
        "--disable-sandbox"
    )
    outputs.dir(generatedJavaDir)
    outputs.file(File(swiftBuildDir, "libSwiftAndroidApp.so"))
    // `swift build` is incremental itself; let it decide what is stale.
    outputs.upToDateWhen { false }
}

// Stage the cross-compiled libraries, the swift-java runtime, the Swift
// Android runtime and libc++_shared into jniLibs so they end up in the APK.
val stageJniLibs = tasks.register<Copy>("stageJniLibs") {
    dependsOn(jextract)
    into(layout.projectDirectory.dir("src/main/jniLibs/$swiftAbi"))
    from(swiftBuildDir) {
        // Every dynamic library product built by the package graph — anything
        // less leaves a dangling `dlopen` at runtime.
        include("*.so")
    }
    from(swiftAndroidRuntimeDir) {
        include("*.so")
        // Test-only runtime libraries are not needed by the app.
        exclude("*Testing*", "libXCTest.so")
    }
    from(File(ndkRoot, "toolchains/llvm/prebuilt/darwin-x86_64/sysroot/usr/lib/aarch64-linux-android")) {
        include("libc++_shared.so")
    }
}

android {
    namespace = "com.pureswift.swiftandroid"
    compileSdk = 35

    defaultConfig {
        applicationId = "com.pureswift.swiftandroid"
        minSdk = 29
        targetSdk = 35
        versionCode = 1
        versionName = "1.0"
        ndk {
            //noinspection ChromeOsAbiSupport
            abiFilters += listOf(swiftAbi)
        }
        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
    kotlinOptions {
        jvmTarget = "11"
    }
    buildFeatures {
        compose = true
    }

    // Generated JNI bindings + the SwiftKitCore Java runtime (consumed as
    // source, since swift-java is not published to Maven).
    sourceSets["main"].java.srcDir(generatedJavaDir)
    sourceSets["main"].java.srcDir(swiftKitCoreDir)
    // These two annotations pull in `jdk.jfr` (Java Flight Recorder), which is
    // unavailable on Android; the JNI bindings don't reference them.
    sourceSets["main"].java.filter.exclude(
        "org/swift/swiftkit/core/annotations/ThreadSafe.java",
        "org/swift/swiftkit/core/annotations/Unsigned.java"
    )

    packaging {
        resources {
            excludes += listOf("/META-INF/{AL2.0,LGPL2.1}")
        }
        jniLibs {
            keepDebugSymbols += listOf(
                "*/arm64-v8a/*.so",
                "*/armeabi-v7a/*.so",
                "*/x86_64/*.so"
            )
        }
    }
}

// Ensure Swift is built + bindings generated + libs staged before Java or
// Kotlin compiles (Kotlin also consumes the generated Java bindings).
tasks.withType<JavaCompile>().configureEach {
    dependsOn(jextract)
}
tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
    dependsOn(jextract)
}
tasks.named("preBuild") {
    dependsOn(stageJniLibs)
}

dependencies {

    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.lifecycle.runtime.ktx)
    implementation(libs.androidx.activity.compose)
    implementation(platform(libs.androidx.compose.bom))
    implementation(libs.androidx.ui)
    implementation(libs.androidx.ui.graphics)
    implementation(libs.androidx.ui.tooling.preview)
    implementation(libs.androidx.recyclerview)
    implementation(libs.androidx.navigation.runtime)
    implementation(libs.androidx.material3)
    implementation(libs.material)
    testImplementation(libs.junit)
    androidTestImplementation(libs.androidx.junit)
    androidTestImplementation(libs.androidx.espresso.core)
    androidTestImplementation(platform(libs.androidx.compose.bom))
    androidTestImplementation(libs.androidx.ui.test.junit4)
    debugImplementation(libs.androidx.ui.tooling)
    debugImplementation(libs.androidx.ui.test.manifest)
}
