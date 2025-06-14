#!/bin/bash
set -e
source swift-define

# Build with SwiftPM
export JAVA_HOME=$SWIFT_ANDROID_SYSROOT/usr
xcrun --toolchain swift swift build -c $SWIFT_COMPILATION_MODE \
    --swift-sdk $SWIFT_TARGET_NAME \
    --toolchain $XCTOOLCHAIN \
    --package-path $SWIFT_PACKAGE_SRC

# Copy compiled Swift package
mkdir -p $SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH/
cp -rf $SWIFT_PACKAGE_SRC/.build/$SWIFT_TARGET_NAME/debug/libSwiftAndroidApp.so \
    $SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH/
