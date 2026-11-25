//
//  AndroidFontHandle.swift
//  AndroidSilica
//
//  Created by Alsey Coleman Miller on 7/13/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

#if canImport(AndroidGraphics)

import AndroidGraphics
import SwiftJava
import Foundation
import Silica

/// Android Typeface backed font.
///
/// Glyph indices and advances are obtained by shaping through
/// `android.graphics.text.TextRunShaper` (API 31), which also yields the
/// `android.graphics.fonts.Font` needed by `Canvas.drawGlyphs`.
///
/// - Note: `Typeface.create` falls back to the system default for unknown
///   family names (matching FontConfig's fuzzy behavior on Linux), so font
///   creation does not fail for unrecognized names.
public final class AndroidFontHandle: CGFontHandle {

    // MARK: - Constants

    /// Nominal em size used for measuring (Android exposes no font-unit metrics).
    internal static let nominalSize: CGFloat = 2048

    // MARK: - Properties

    public let typeface: Typeface

    public let familyName: String

    // MARK: - Private Properties

    /// Paint configured at the nominal size, used for measuring and shaping.
    private let measuringPaint: Paint

    private let internalMetrics: (ascent: CGFloat, descent: CGFloat, capHeight: CGFloat)

    /// Shaped glyph information, populated by `glyph(for:)`.
    private var glyphCache = [Silica.CGGlyph: (advance: CGFloat, font: AndroidGraphics.Font?)]()

    /// The font of the first shaped glyph, used as a fallback for `Canvas.drawGlyphs`.
    internal private(set) var baseFont: AndroidGraphics.Font?

    // MARK: - Initialization

    /// Resolves a Silica font name (e.g. `"TimesNewRoman-Bold"`).
    public init?(name: String) {

        // parse "Family-Traits"
        let separator: Character = "-"
        let components = name.split(separator: separator, maxSplits: 2, omittingEmptySubsequences: true)

        let family: String
        let traits: String?

        if components.count == 2 {
            family = String(components[0])
            traits = String(components[1])
        } else {
            family = name
            traits = nil
        }

        var isBold = false
        var isItalic = false

        if let traits = traits {
            isBold = traits.contains("Bold")
            isItalic = traits.contains("Italic") || traits.contains("Oblique")
        }

        // Typeface style constants: NORMAL = 0, BOLD = 1, ITALIC = 2, BOLD_ITALIC = 3
        let style: Int32 = (isBold ? 1 : 0) | (isItalic ? 2 : 0)

        guard let typefaceClass = try? JavaClass<Typeface>(),
            let typeface = typefaceClass.create(family, style)
            else { return nil }

        self.typeface = typeface
        self.familyName = family

        let paint = Paint()
        paint.setAntiAlias(true)
        _ = paint.setTypeface(typeface)
        paint.setTextSize(Float(AndroidFontHandle.nominalSize))
        self.measuringPaint = paint

        guard let fontMetrics = paint.getFontMetrics()
            else { return nil }

        // FontMetrics.ascent is negative above the baseline; descent positive below.
        let ascent = CGFloat(-fontMetrics.ascent) / AndroidFontHandle.nominalSize
        let descent = CGFloat(-fontMetrics.descent) / AndroidFontHandle.nominalSize

        // approximate the cap height from the bounds of an uppercase letter
        let bounds = Rect()
        paint.getTextBounds("H", 0, 1, bounds)
        let capHeight = CGFloat(bounds.height()) / AndroidFontHandle.nominalSize

        self.internalMetrics = (ascent: ascent, descent: descent, capHeight: capHeight)
    }

    // MARK: - CGFontHandle

    /// The family name (Android exposes no full font name).
    public var fullName: String { familyName }

    public var unitsPerEm: Int { Int(AndroidFontHandle.nominalSize) }

    public var ascent: CGFloat { internalMetrics.ascent }

    public var descent: CGFloat { internalMetrics.descent }

    public var capHeight: CGFloat { internalMetrics.capHeight }

    public func glyph(for scalar: Unicode.Scalar) -> Silica.CGGlyph {

        let characters = Array(String(scalar).utf16)

        guard let shaperClass = try? JavaClass<TextRunShaper>(),
            let shaped = shaperClass.shapeTextRun(characters, 0, Int32(characters.count),
                                                  0, Int32(characters.count),
                                                  0, 0, false, measuringPaint),
            shaped.glyphCount() > 0
            else { return 0 }

        let glyph = Silica.CGGlyph(truncatingIfNeeded: shaped.getGlyphId(0))

        if glyphCache[glyph] == nil {

            let font = shaped.getFont(0)

            glyphCache[glyph] = (advance: CGFloat(shaped.getAdvance()) / AndroidFontHandle.nominalSize,
                                 font: font)

            if baseFont == nil {
                baseFont = font
            }
        }

        return glyph
    }

    /// Advances for previously shaped glyphs.
    ///
    /// Android exposes no advance lookup by glyph index; advances are memoized
    /// when glyphs are shaped via `glyph(for:)`. Unknown glyph indices report 0.
    public func advances(for glyphs: [Silica.CGGlyph]) -> [CGFloat] {

        return glyphs.map { glyphCache[$0]?.advance ?? 0 }
    }

    // MARK: - Internal Methods

    /// The `android.graphics.fonts.Font` for a previously shaped glyph.
    internal func font(for glyph: Silica.CGGlyph) -> AndroidGraphics.Font? {

        return glyphCache[glyph]?.font
    }
}

#endif // canImport(AndroidGraphics)
