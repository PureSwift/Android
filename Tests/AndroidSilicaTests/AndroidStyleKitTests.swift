//
//  AndroidStyleKitTests.swift
//  AndroidSilicaTests
//
//  Created by Alsey Coleman Miller on 7/13/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

#if canImport(AndroidGraphics) && os(Android)

import Testing
import Foundation
import SwiftJava
import JavaIO
import AndroidOS
import AndroidApp
import AndroidContext
@preconcurrency import AndroidContent
import AndroidSilica
import SilicaTestSupport

/// Renders the shared StyleKit content through the Android Canvas backend.
///
/// These tests run on-device via `skip android test` and require API 31+
/// for glyph rendering (`Canvas.drawGlyphs`).
@Suite(.serialized)
struct AndroidStyleKitTests {

    @Test func simpleShapes() throws {
        let data = try render(name: "android_simpleShapes", size: Silica.Size(width: 240, height: 120)) { TestStyleKit.drawSimpleShapes(in: $0) }
        try expectPDF(data)
    }

    @Test func advancedShapes() throws {
        let data = try render(name: "android_advancedShapes", size: Silica.Size(width: 240, height: 120)) { TestStyleKit.drawAdvancedShapes(in: $0) }
        try expectPDF(data)
    }

    @Test func swiftLogo() throws {
        let size = Silica.Size(width: 200, height: 200)
        let data = try render(name: "android_SwiftLogo", size: size) { TestStyleKit.drawSwiftLogo(in: $0, frame: Silica.Rect(origin: .zero, size: size)) }
        try expectPDF(data)
    }

    @Test func singleLineText() throws {
        let data = try render(name: "android_singleLineText", size: Silica.Size(width: 240, height: 120)) { TestStyleKit.drawSingleLineText(in: $0) }
        try expectPDF(data)
    }

    @Test func bitmapContext() throws {
        AndroidBackend.register()

        let context = GraphicsContext(try AndroidCanvasRenderer(bitmap: Silica.Size(width: 20, height: 20)))
        context.fillColor = Silica.Color(red: 1, green: 0, blue: 0)
        context.addRect(Silica.Rect(x: 0, y: 0, width: 20, height: 20))
        context.fillPath()

        let image = try #require(context.makeImage())
        #expect(image.width == 20)
        #expect(image.height == 20)

        // solid red (premultiplied RGBA)
        #expect(image.data[0] > 200)
        #expect(image.data[1] < 50)
    }

    // MARK: - Utilities

    private func render(name: String, size: Size, _ drawing: (GraphicsContext) -> Void) throws -> Data {

        AndroidBackend.register()

        let path = try Self.outputDirectory() + "/" + name + ".pdf"

        let context = GraphicsContext(try AndroidCanvasRenderer(pdf: URL(fileURLWithPath: path), size: size))

        drawing(context)

        try context.finish()

        print("Wrote to \(path)")

        return try Data(contentsOf: URL(fileURLWithPath: path))
    }

    private func expectPDF(_ data: Data) throws {
        #expect(data.count > 4)
        #expect(String(decoding: data.prefix(4), as: UTF8.self) == "%PDF")
    }

    private struct ContextError: Error { }

    /// Cached by `outputDirectory()`; safe because the suite is serialized.
    private nonisolated(unsafe) static var cachedOutputDirectory: String?

    /// The application cache directory — the reliably writable location
    /// inside the on-device test harness.
    private static func outputDirectory() throws -> String {

        if let cached = cachedOutputDirectory {
            return cached
        }

        let jvm = try JavaVirtualMachine.shared()
        let environment = try jvm.environment()

        // get the low-level application context from swift-android-native
        // and wrap it in the @JavaClass Context (like PureSwift/Android's tests).
        // JavaObjectHolder takes ownership of a local reference (it promotes it
        // to a global reference and deletes the local one), so hand it a fresh
        // local reference rather than the stored context pointer.
        let lowLevelContext = try AndroidContext.application

        guard let localContext = environment.interface.NewLocalRef(environment, lowLevelContext.pointer)
            else { throw ContextError() }

        let application = Application(javaHolder: JavaObjectHolder(object: localContext, environment: environment))

        let context = try #require(application.as(AndroidContent.Context.self))
        let cacheDirectory = try #require(context.getCacheDir())

        let path = cacheDirectory.getAbsolutePath()

        cachedOutputDirectory = path

        return path
    }
}

#endif // canImport(AndroidGraphics) && os(Android)
