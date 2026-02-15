#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/swift-define"
JNI_LIBS_DIR="$SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH"

# Build with SwiftPM
ANDROID_NDK_ROOT="" ANDROID_SDK_VERSION="$ANDROID_SDK_VERSION" skip android build --arch "$SWIFT_TARGET_ARCH" --android-api-level "$ANDROID_SDK_VERSION"

# Copy compiled Swift package
mkdir -p "$JNI_LIBS_DIR/"
cp -f "$SWIFT_PACKAGE_SRC/.build/$SWIFT_TARGET_NAME/debug/libSwiftAndroidApp.so" "$JNI_LIBS_DIR/"

# Copy Swift runtime shared libraries required by libSwiftAndroidApp.so.
if [[ -d "$SWIFT_ANDROID_RUNTIME_LIBS" ]]; then
    shopt -s nullglob
    for so in "$SWIFT_ANDROID_RUNTIME_LIBS"/*.so; do
        cp -f "$so" "$JNI_LIBS_DIR/"
    done
    shopt -u nullglob
fi

# Copy SwiftJava helper library when available.
if [[ -f "$SWIFT_PACKAGE_SRC/.build/$SWIFT_TARGET_NAME/debug/libSwiftJava.so" ]]; then
    cp -f "$SWIFT_PACKAGE_SRC/.build/$SWIFT_TARGET_NAME/debug/libSwiftJava.so" "$JNI_LIBS_DIR/"
fi

# Copy C++ runtime from Android sysroot.
if [[ -f "$SWIFT_ANDROID_SYSROOT/usr/lib/$ANDROID_LIB/libc++_shared.so" ]]; then
    cp -f "$SWIFT_ANDROID_SYSROOT/usr/lib/$ANDROID_LIB/libc++_shared.so" "$JNI_LIBS_DIR/"
fi
