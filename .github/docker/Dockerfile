# Build image for cross-compiling the package with the official
# Swift SDK for Android.
FROM swift:6.3.2-noble

ARG SWIFT_SDK_URL=https://download.swift.org/swift-6.3.2-release/android-sdk/swift-6.3.2-RELEASE/swift-6.3.2-RELEASE_android.artifactbundle.tar.gz
ARG SWIFT_SDK_CHECKSUM=939e933549d12d28f2e0bf71019d734d309859e9773c572657ce565a81f85d68
ARG ANDROID_NDK_VERSION=r27d

ENV ANDROID_NDK_HOME=/usr/local/lib/android/sdk/ndk/${ANDROID_NDK_VERSION}

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl unzip \
    && rm -rf /var/lib/apt/lists/*

# the Swift SDK links against the NDK sysroot, which it does not bundle
RUN mkdir -p "$(dirname "$ANDROID_NDK_HOME")" \
    && curl -fsSL -o /tmp/ndk.zip \
        "https://dl.google.com/android/repository/android-ndk-${ANDROID_NDK_VERSION}-linux.zip" \
    && unzip -q /tmp/ndk.zip -d /tmp \
    && mv "/tmp/android-ndk-${ANDROID_NDK_VERSION}" "$ANDROID_NDK_HOME" \
    && rm /tmp/ndk.zip

RUN swift sdk install "$SWIFT_SDK_URL" --checksum "$SWIFT_SDK_CHECKSUM" \
    && swift sdk list

# the artifact bundle expects the NDK sysroot at `ndk-sysroot` inside the bundle
RUN BUNDLE=$(dirname "$(find / -path '*swift-sdks*' -name 'swift-sdk.json' | head -1)") \
    && ln -s "$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/sysroot" "$BUNDLE/ndk-sysroot" \
    && test -f "$BUNDLE/ndk-sysroot/usr/include/jni.h"

WORKDIR /package
