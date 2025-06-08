#!/bin/bash
set -e
source swift-define

# Build with SwiftPM
swift build \
    --swift-sdk aarch64-unknown-linux-android24 \
    --toolchain $XCTOOLCHAIN \
    --package-path $SWIFT_PACKAGE_SRC

# Copy compiled Swift package
mkdir -p $SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH/
cp -rf $SWIFT_PACKAGE_SRC/.build/aarch64-unknown-linux-android24/debug/libSwiftAndroidApp.so \
    $SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH/
