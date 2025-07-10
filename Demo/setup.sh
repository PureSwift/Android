#!/bin/bash
set -e
source swift-define

# Install macOS dependencies
if [[ $OSTYPE == 'darwin'* ]]; then
    echo "Install macOS build dependencies"
    brew install skiptools/skip/skip
    skip android sdk install
    brew update
    HOMEBREW_NO_AUTO_UPDATE=1 brew install wget cmake ninja android-ndk
fi

# Copy Swift libraries
rm -rf $SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH/
mkdir -p $SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH/
cp -rf $SWIFT_ANDROID_LIBS/*.so \
    $SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH/
# Copy C stdlib
cp -rf $SWIFT_ANDROID_SYSROOT/usr/lib/$ANDROID_LIB/libc++_shared.so \
    $SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH/
echo "Copied Swift libraries"
