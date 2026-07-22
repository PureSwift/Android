# Build image for cross-compiling the package with the official
# Swift SDK for Android.
FROM swift:6.3.2-noble

ARG SWIFT_SDK_URL=https://download.swift.org/swift-6.3.2-release/android/swift-6.3.2-RELEASE/swift-6.3.2-RELEASE-android-24-0.1.artifactbundle.tar.gz
ARG SWIFT_SDK_CHECKSUM=

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl unzip \
    && rm -rf /var/lib/apt/lists/*

RUN if [ -n "$SWIFT_SDK_CHECKSUM" ]; then \
        swift sdk install "$SWIFT_SDK_URL" --checksum "$SWIFT_SDK_CHECKSUM"; \
    else \
        swift sdk install "$SWIFT_SDK_URL"; \
    fi \
    && swift sdk list

WORKDIR /package
