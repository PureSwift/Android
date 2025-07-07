#!/bin/bash
set -e
source swift-define

# Build with SwiftPM
ANDROID_NDK_ROOT="" ANDROID_SDK_VERSION=$ANDROID_SDK_VERSION skip android build --arch $SWIFT_TARGET_ARCH --android-api-level $ANDROID_SDK_VERSION

# Copy compiled Swift package
mkdir -p $SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH/
cp -rf $SWIFT_PACKAGE_SRC/.build/$SWIFT_TARGET_NAME/debug/libSwiftAndroidApp.so \
    $SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH/
