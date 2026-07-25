#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/swift-define"
JNI_LIBS_DIR="$SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH"

# Build with SwiftPM against the official Swift Android SDK.
#
# `--disable-sandbox` is required so the swift-java jextract build-tool plugin
# (JNI mode with `enableJavaCallbacks`) can run its nested Gradle build to
# compile the Java callback wrappers. This replaces the previous `skip
# android build` driver.
swift build \
    --package-path "$SWIFT_PACKAGE_SRC" \
    --swift-sdk "$SWIFT_TARGET_NAME" \
    --configuration "$SWIFT_COMPILATION_MODE" \
    --disable-sandbox

BUILD_BIN="$SWIFT_PACKAGE_SRC/.build/$SWIFT_TARGET_NAME/$SWIFT_COMPILATION_MODE"

# Copy compiled Swift product shared objects (app + any jextract bridge modules).
mkdir -p "$JNI_LIBS_DIR/"
shopt -s nullglob
for so in "$BUILD_BIN"/lib*.so; do
    cp -f "$so" "$JNI_LIBS_DIR/"
done
shopt -u nullglob

# Copy Swift runtime shared libraries required by libSwiftAndroidApp.so.
if [[ -d "$SWIFT_ANDROID_RUNTIME_LIBS" ]]; then
    shopt -s nullglob
    for so in "$SWIFT_ANDROID_RUNTIME_LIBS"/*.so; do
        cp -f "$so" "$JNI_LIBS_DIR/"
    done
    shopt -u nullglob
fi

# Copy C++ runtime from Android sysroot.
if [[ -f "$SWIFT_ANDROID_SYSROOT/usr/lib/$ANDROID_LIB/libc++_shared.so" ]]; then
    cp -f "$SWIFT_ANDROID_SYSROOT/usr/lib/$ANDROID_LIB/libc++_shared.so" "$JNI_LIBS_DIR/"
fi
