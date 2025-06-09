#!/bin/bash
set -e
source swift-define

# Install macOS dependencies
if [[ $OSTYPE == 'darwin'* ]]; then
    echo "Install macOS build dependencies"
    HOMEBREW_NO_AUTO_UPDATE=1 brew install wget cmake ninja android-ndk

    # Verify toolchain installed
    if [ ! -d ${XCTOOLCHAIN} ]
    then
        echo "Please install the swift-6.0.3-RELEASE toolchain (or set XCTOOLCHAIN)"
        echo "On Mac: https://download.swift.org/swift-6.0.3-release/xcode/swift-6.0.3-RELEASE/swift-6.0.3-RELEASE-osx.pkg"
        exit 1
    fi
fi

# Check swift-autolink-extract exists
if [[ ! -f "${XCTOOLCHAIN}/usr/bin/swift-autolink-extract" ]];
then
    echo "Missing symlink '${XCTOOLCHAIN}/usr/bin/swift-autolink-extract'."
    echo "We need 'sudo' permission to create it (just this once)."
    sudo ln -s swift ${XCTOOLCHAIN}/usr/bin/swift-autolink-extract || exit 1
fi

# Copy Swift libraries
mkdir -p $SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH/
cp -rf $SWIFT_SDK_PATH/usr/lib/$ANDROID_LIB/*.so \
    $SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH/
# Copy C stdlib
cp -rf $SWIFT_SDK_PATH/usr/lib/$ANDROID_LIB/libc++_shared.so \
    $SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH/
# Copy Swift dependencies
cp -rf $SWIFT_SDK_PATH/usr/lib/$ANDROID_LIB/libandroid-spawn.so \
    $SRC_ROOT/app/src/main/jniLibs/$ANDROID_ARCH/
