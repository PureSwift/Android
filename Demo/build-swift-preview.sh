#!/bin/bash
set -e
source swift-define

# Build locally for preview
xcrun --toolchain swift swift build -c $SWIFT_COMPILATION_MODE \
    --package-path $SWIFT_PACKAGE_SRC

# Copy to default Java JNI path
$ mkdir -p ~/Library/Java/Extensions
cp -rf $SWIFT_PACKAGE_SRC/.build/arm64-apple-macosx/debug/libSwiftAndroidApp.dylib \
    ~/Library/Java/Extensions/