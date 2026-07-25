//
//  Catalog.swift
//  SwiftAndroidApp
//
//  Internal registry backing the public CatalogBridge API. Nothing in this
//  file is extracted by jextract (internal/package visibility only).
//

import AndroidKit
import AndroidContext

/// A single library demo in the catalog.
struct CatalogEntry {
    let name: String
    let summary: String
    let demo: ((String) -> Void) -> Void
}

package enum Catalog {

    /// The global application context, bootstrapped through
    /// `ActivityThread.currentApplication()` by the AndroidContext module and
    /// wrapped as a SwiftJava `Context` for use with the SDK wrappers.
    ///
    /// Wrapped exactly once: `JavaObjectHolder` promotes the incoming
    /// reference to a JNI global ref and deletes the original local ref, so
    /// re-wrapping `AndroidContext`'s cached pointer on a later JNI call
    /// would use a stale reference and crash.
    static var context: AndroidContent.Context? { cachedContext }

    private nonisolated(unsafe) static let cachedContext: AndroidContent.Context? = {
        guard let application = try? AndroidContext.application,
              let environment = try? JavaVirtualMachine.shared().environment() else {
            return nil
        }
        return AndroidContent.Context(
            javaHolder: JavaObjectHolder(
                object: application.pointer,
                environment: environment
            )
        )
    }()

    static func entry(at index: Int64) -> CatalogEntry? {
        let index = Int(index)
        guard entries.indices.contains(index) else { return nil }
        return entries[index]
    }

    static let entries: [CatalogEntry] = [
        CatalogEntry(
            name: "AndroidOS",
            summary: "Build info, SDK level and system clocks (android.os)",
            demo: CatalogDemos.androidOS
        ),
        CatalogEntry(
            name: "AndroidApp",
            summary: "ActivityManager memory info (android.app)",
            demo: CatalogDemos.androidApp
        ),
        CatalogEntry(
            name: "AndroidContent",
            summary: "Package and application info via Context (android.content)",
            demo: CatalogDemos.androidContent
        ),
        CatalogEntry(
            name: "AndroidGraphics",
            summary: "Bitmap creation and colors (android.graphics)",
            demo: CatalogDemos.androidGraphics
        ),
        CatalogEntry(
            name: "AndroidLocation",
            summary: "Location providers and their state (android.location)",
            demo: CatalogDemos.androidLocation
        ),
        CatalogEntry(
            name: "AndroidMedia",
            summary: "Audio streams, volumes and ringer mode (android.media)",
            demo: CatalogDemos.androidMedia
        ),
        CatalogEntry(
            name: "AndroidNet",
            summary: "Connectivity and Wi-Fi state (android.net)",
            demo: CatalogDemos.androidNet
        ),
        CatalogEntry(
            name: "AndroidNFC",
            summary: "NFC adapter availability (android.nfc)",
            demo: CatalogDemos.androidNFC
        ),
        CatalogEntry(
            name: "AndroidUtil",
            summary: "Display metrics and density (android.util)",
            demo: CatalogDemos.androidUtil
        ),
        CatalogEntry(
            name: "AndroidView",
            summary: "ViewConfiguration touch and gesture constants (android.view)",
            demo: CatalogDemos.androidView
        ),
    ]
}
