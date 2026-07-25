//
//  CatalogBridge.swift
//  SwiftAndroidApp
//
//  Public jextract (JNI mode) surface of the library catalog.
//
//  Only jextract-supported types (primitives, String, closures) may appear in
//  public declarations here; the catalog implementation lives in Catalog.swift
//  using internal visibility.
//

/// Number of entries in the library catalog.
public func catalogEntryCount() -> Int64 {
    Int64(Catalog.entries.count)
}

/// Display name of the catalog entry at `index` (e.g. "AndroidOS").
public func catalogEntryName(index: Int64) -> String {
    Catalog.entry(at: index)?.name ?? ""
}

/// One-line summary of what the catalog entry demonstrates.
public func catalogEntrySummary(index: Int64) -> String {
    Catalog.entry(at: index)?.summary ?? ""
}

/// Runs the demo for the catalog entry at `index`.
///
/// Output lines are delivered through the `onLine` callback as they are
/// produced, and `onCompleted` fires exactly once when the demo finishes —
/// demonstrating Swift invoking Java closures/runnable blocks through the
/// jextract JNI bridge.
public func runCatalogDemo(
    index: Int64,
    onLine: (String) -> Void,
    onCompleted: () -> Void
) {
    defer { onCompleted() }
    guard let entry = Catalog.entry(at: index) else {
        onLine("Invalid catalog index \(index)")
        return
    }
    entry.demo(onLine)
}

/// Runs a Java block on the calling thread (Runnable-style round trip).
public func runBlock(block: () -> Void) {
    block()
}
