# Build image for cross-compiling the package with the official
# Swift SDK for Android.
FROM swift:6.3.2-noble

ARG SWIFT_SDK_URL=https://download.swift.org/swift-6.3.2-release/android-sdk/swift-6.3.2-RELEASE/swift-6.3.2-RELEASE_android.artifactbundle.tar.gz
ARG SWIFT_SDK_CHECKSUM=939e933549d12d28f2e0bf71019d734d309859e9773c572657ce565a81f85d68

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl unzip \
    && rm -rf /var/lib/apt/lists/*

RUN swift sdk install "$SWIFT_SDK_URL" --checksum "$SWIFT_SDK_CHECKSUM" \
    && swift sdk list

# record the triples the installed Swift SDK supports, so a build can select one by architecture
RUN find / -path '*swift-sdks*' -name 'swift-sdk.json' -exec cat {} + \
    | grep -o '"[a-z0-9_]*-unknown-linux-android[a-z]*[0-9]*"' \
    | tr -d '"' | sort -u > /usr/local/share/swift-android-triples \
    && cat /usr/local/share/swift-android-triples

WORKDIR /package
