#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/swift-define"
JNI_LIBS_DIR="$SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH"

# Install macOS dependencies
if [[ $OSTYPE == 'darwin'* ]]; then
    echo "Install macOS build dependencies"
    brew install skiptools/skip/skip
    skip android sdk install
    brew update
    HOMEBREW_NO_AUTO_UPDATE=1 brew install wget cmake ninja android-ndk
fi

# Copy Swift libraries
rm -rf "$JNI_LIBS_DIR/"
mkdir -p "$JNI_LIBS_DIR/"

copied_swift_libs=0
if [[ -d "$SWIFT_ANDROID_RUNTIME_LIBS" ]]; then
    shopt -s nullglob
    for so in "$SWIFT_ANDROID_RUNTIME_LIBS"/*.so; do
        cp -f "$so" "$JNI_LIBS_DIR/"
        copied_swift_libs=1
    done
    shopt -u nullglob
fi

# Fallback for newer Skip/Swift SDK layouts where runtime libs are emitted into `.build`.
if [[ $copied_swift_libs -eq 0 && -d "$SWIFT_PACKAGE_SRC/.build/$SWIFT_TARGET_NAME/debug" ]]; then
    shopt -s nullglob
    for so in "$SWIFT_PACKAGE_SRC/.build/$SWIFT_TARGET_NAME/debug"/libSwift*.so; do
        cp -f "$so" "$JNI_LIBS_DIR/"
        copied_swift_libs=1
    done
    shopt -u nullglob
fi

if [[ $copied_swift_libs -eq 0 ]]; then
    echo "Warning: No Swift runtime libraries found to copy."
fi

# Copy C stdlib
if [[ -f "$SWIFT_ANDROID_SYSROOT/usr/lib/$ANDROID_LIB/libc++_shared.so" ]]; then
    cp -f "$SWIFT_ANDROID_SYSROOT/usr/lib/$ANDROID_LIB/libc++_shared.so" \
        "$JNI_LIBS_DIR/"
else
    echo "Warning: libc++_shared.so not found at $SWIFT_ANDROID_SYSROOT/usr/lib/$ANDROID_LIB/libc++_shared.so"
fi
echo "Copied Swift libraries"
