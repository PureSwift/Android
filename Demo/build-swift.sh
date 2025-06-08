#!/bin/bash
set -e
source swift-define

# Build with SwiftPM
xcrun --toolchain swift swift build -c $SWIFT_COMPILATION_MODE \
    --swift-sdk $SWIFT_TARGET_NAME \
    --toolchain $XCTOOLCHAIN \
    --package-path $SWIFT_PACKAGE_SRC

# Copy compiled Swift package
mkdir -p $SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH/
cp -rf $SWIFT_PACKAGE_SRC/.build/$SWIFT_TARGET_NAME/debug/libSwiftAndroidApp.so \
    $SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH/

# Build locally for preview
xcrun --toolchain swift swift build -c $SWIFT_COMPILATION_MODE \
    --package-path $SWIFT_PACKAGE_SRC

# Copy to default Java JNI path
mkdir -p ~/Library/Java/Extensions
cp -rf $SWIFT_PACKAGE_SRC/.build/arm64-apple-macosx/debug/libSwiftAndroidApp.dylib \
    ~/Library/Java/Extensions/