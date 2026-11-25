//
//  AndroidCanvasRenderer.swift
//  AndroidSilica
//
//  Created by Alsey Coleman Miller on 7/13/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

#if canImport(AndroidGraphics)

import AndroidGraphics
import SwiftJava
import JavaIO
import JavaLangIO
import Foundation
import Silica

/// A renderer drawing with `android.graphics.Canvas`: into a PDF, a bitmap,
/// or a canvas a view's draw pass hands over.
///
/// Android's canvas has its origin at the top left with y down, as Silica
/// does, and keeps the transform and the clip in its own save stack. The
/// colors, the stroke style, the alpha, the blend mode and the shadow are
/// kept here and applied to each paint. PDF pages are in points (1/72 inch).
///
/// - Note: `finish()` is mandatory for a PDF: the document is only written to
///   disk then. JNI objects must be used from a thread attached to the JVM:
///   make, use and finish a renderer on one thread.
/// - Note: Glyphs need API 31 (`Canvas.drawGlyphs`). Shadows aren't blurred.
///   Blend modes `PorterDuff` lacks draw as normal: color dodge and burn,
///   soft and hard light, difference, exclusion, hue, saturation, color,
///   luminosity and plus darker. A transparency layer composites with its
///   alpha and blend mode, but casts no shadow.
public final class AndroidCanvasRenderer: Renderer {

    // MARK: - Properties

    public let size: Silica.Size

    /// Device pixels per point.
    public let scale: Double

    /// The canvas drawn on (a new one on each PDF page).
    public private(set) var canvas: AndroidGraphics.Canvas

    private let pdfDocument: PdfDocument?

    private let pdfURL: URL?

    private let bitmap: AndroidGraphics.Bitmap?

    private var page: PdfDocument.Page?

    private var pageNumber: Int32 = 0

    private var isFinished = false

    private var state = State()

    /// Saved states, with the canvas save count to restore to.
    private var stack: [(state: State, saveCount: Int32)] = []

    // MARK: - Initialization

    /// A PDF at a file URL, `size` points a page. Call `finish()` to write it.
    public init(pdf url: URL, size: Silica.Size) throws(SilicaError) {
        let document = PdfDocument()
        let info = PdfDocument.PageInfo.Builder(Int32(size.width), Int32(size.height), 1).create()
        guard let page = document.startPage(info), let canvas = page.getCanvas()
            else { throw SilicaError.invalidContext }
        self.pdfDocument = document
        self.pdfURL = url
        self.bitmap = nil
        self.size = size
        self.scale = 1
        self.page = page
        self.canvas = canvas
        self.pageNumber = 1
        AndroidBackend.registerIfNeeded()
    }

    /// A bitmap `size` points across, `scale` pixels per point.
    public init(bitmap size: Silica.Size, scale: Double = 1) throws(SilicaError) {
        let width = Int32((size.width * scale).rounded(.up))
        let height = Int32((size.height * scale).rounded(.up))
        guard width > 0, height > 0,
            let bitmapClass = try? JavaClass<AndroidGraphics.Bitmap>(),
            let bitmap = bitmapClass.createBitmap(width, height, Bitmap.Config(.ARGB_8888))
            else { throw SilicaError.noMemory }
        self.pdfDocument = nil
        self.pdfURL = nil
        self.bitmap = bitmap
        self.size = size
        self.scale = scale
        self.canvas = Canvas(bitmap)
        if scale != 1 {
            canvas.scale(Float(scale), Float(scale))
        }
        state.ctm = AffineTransform(scaleX: scale, y: scale)
        AndroidBackend.registerIfNeeded()
    }

    /// A canvas someone else made (e.g. the one `View.onDraw` hands over),
    /// `size` points across, whose matrix maps points to its pixels.
    public init(canvas: AndroidGraphics.Canvas, size: Silica.Size, scale: Double = 1) {
        self.pdfDocument = nil
        self.pdfURL = nil
        self.bitmap = nil
        self.size = size
        self.scale = scale
        self.canvas = canvas
        state.ctm = AffineTransform(scaleX: scale, y: scale)
        AndroidBackend.registerIfNeeded()
    }

    // MARK: - Graphics State

    public func saveState() {
        stack.append((state, canvas.save()))
    }

    public func restoreState() {
        guard let saved = stack.popLast() else { return }
        canvas.restoreToCount(saved.saveCount)
        state = saved.state
    }

    public func concatenate(_ transform: Silica.AffineTransform) {
        state.ctm = transform.concatenating(state.ctm)
        canvas.concat(transform.toAndroid())
    }

    public func setAlpha(_ alpha: Double) {
        state.alpha = alpha
    }

    public func setBlendMode(_ mode: Silica.BlendMode) {
        state.blendMode = mode
    }

    public func setShouldAntialias(_ shouldAntialias: Bool) {
        state.shouldAntialias = shouldAntialias
    }

    public func setFillColor(_ color: Silica.Color) {
        state.fillColor = color
    }

    public func setStrokeColor(_ color: Silica.Color) {
        state.strokeColor = color
    }

    public func setStrokeStyle(_ style: StrokeStyle) {
        state.strokeStyle = style
    }

    public func setShadow(_ shadow: Shadow?) {
        state.shadow = shadow
    }

    // MARK: - Painting

    public func fill(_ path: Silica.Path, rule: FillRule) {
        let androidPath = path.toAndroid(rule: rule)
        withShadow { canvas, color in
            canvas.drawPath(androidPath, paint(.fill, color: color ?? state.fillColor))
        }
    }

    public func stroke(_ path: Silica.Path) {
        let androidPath = path.toAndroid(rule: .winding)
        withShadow { canvas, color in
            canvas.drawPath(androidPath, paint(.stroke, color: color ?? state.strokeColor))
        }
    }

    public func clip(to path: Silica.Path, rule: FillRule) {
        _ = canvas.clipPath(path.toAndroid(rule: rule))
    }

    public func clear(_ rect: Silica.Rect) {
        let count = canvas.save()
        _ = canvas.clipRect(rect.toAndroid())
        canvas.drawColor(0, PorterDuff.Mode(.CLEAR))
        canvas.restoreToCount(count)
    }

    public func draw(_ image: Silica.Image, in rect: Silica.Rect) {
        guard let bitmap = image.toAndroidBitmap() else { return }
        withShadow { canvas, color in
            if let color {
                // the shadow of an image is its rectangle
                canvas.drawRect(rect.toAndroid(), paint(.fill, color: color))
            } else {
                let imagePaint = paint(.fill, color: .black)
                imagePaint.setFilterBitmap(true)
                canvas.drawBitmap(bitmap, nil, rect.toAndroid(), imagePaint)
            }
        }
    }

    public func drawLinearGradient(_ gradient: Gradient, start: Silica.Point, end: Silica.Point, options: GradientOptions) {
        let dx = end.x - start.x, dy = end.y - start.y
        let length = (dx * dx + dy * dy).squareRoot()
        guard length > 0, gradient.stops.isEmpty == false else { return }
        let shader = LinearGradient(Float(start.x), Float(start.y), Float(end.x), Float(end.y),
                                    colors(of: gradient), gradient.stops.map { Float($0.location) },
                                    Shader.TileMode(.CLAMP))
        // an end that doesn't extend is cut off by the line through it, across the axis
        let count = canvas.save()
        if options != [.drawsBeforeStartLocation, .drawsAfterEndLocation] {
            let far = 1e6
            let ux = dx / length, uy = dy / length
            let from = options.contains(.drawsBeforeStartLocation) ? -far : 0
            let to = options.contains(.drawsAfterEndLocation) ? length + far : length
            let band = AndroidGraphics.Path()
            let corners = [(from, -far), (to, -far), (to, far), (from, far)]
            for (index, corner) in corners.enumerated() {
                let x = Float(start.x + ux * corner.0 - uy * corner.1)
                let y = Float(start.y + uy * corner.0 + ux * corner.1)
                if index == 0 { band.moveTo(x, y) } else { band.lineTo(x, y) }
            }
            band.close()
            _ = canvas.clipPath(band)
        }
        let gradientPaint = paint(.fill, color: .black)
        _ = gradientPaint.setShader(shader)
        canvas.drawPaint(gradientPaint)
        canvas.restoreToCount(count)
    }

    /// Paints a radial gradient. Android's gradients have one center: two
    /// circles with different centers draw around the end circle's.
    public func drawRadialGradient(_ gradient: Gradient, startCenter: Silica.Point, startRadius: Double,
                                   endCenter: Silica.Point, endRadius: Double, options: GradientOptions) {
        guard endRadius > 0, endRadius > startRadius, startRadius >= 0, gradient.stops.isEmpty == false else { return }
        // stops at radii from the start circle's to the end circle's
        let positions = gradient.stops.map { Float((startRadius + $0.location * (endRadius - startRadius)) / endRadius) }
        let shader = RadialGradient(Float(endCenter.x), Float(endCenter.y), Float(endRadius),
                                    colors(of: gradient), positions, Shader.TileMode(.CLAMP))
        let count = canvas.save()
        if options.contains(.drawsAfterEndLocation) == false {
            let circle = AndroidGraphics.Path()
            circle.addCircle(Float(endCenter.x), Float(endCenter.y), Float(endRadius), AndroidGraphics.Path.Direction(.CW))
            _ = canvas.clipPath(circle)
        }
        if options.contains(.drawsBeforeStartLocation) == false, startRadius > 0 {
            let hole = AndroidGraphics.Path()
            hole.setFillType(AndroidGraphics.Path.FillType(.EVEN_ODD))
            hole.addRect(-1e6, -1e6, 1e6, 1e6, AndroidGraphics.Path.Direction(.CW))
            hole.addCircle(Float(startCenter.x), Float(startCenter.y), Float(startRadius), AndroidGraphics.Path.Direction(.CW))
            _ = canvas.clipPath(hole)
        }
        let gradientPaint = paint(.fill, color: .black)
        _ = gradientPaint.setShader(shader)
        canvas.drawPaint(gradientPaint)
        canvas.restoreToCount(count)
    }

    public func beginTransparencyLayer(in rect: Silica.Rect?) {
        let paint = Paint()
        paint.setAlpha(Int32((min(max(state.alpha, 0), 1) * 255).rounded()))
        if let mode = state.blendMode.toAndroid() {
            _ = paint.setXfermode(PorterDuffXfermode(mode))
        }
        let saveCount = canvas.saveLayer(rect?.toAndroid(), paint)
        stack.append((state, saveCount))
        state.alpha = 1
        state.shadow = nil
        state.blendMode = .normal
    }

    public func endTransparencyLayer() {
        restoreState()
    }

    /// Draws glyphs with `Canvas.drawGlyphs` (API 31), each under the text
    /// matrix's linear part at its baseline origin.
    public func draw(_ glyphs: [Glyph], at positions: [Silica.Point], font: Silica.Font,
                     textMatrix: Silica.AffineTransform, mode: TextDrawingMode) {
        guard let face = font.face as? AndroidFontHandle, font.size > 0, glyphs.isEmpty == false else { return }
        let styles: [PaintStyle]
        switch mode {
        case .fill, .fillClip: styles = [.fill]
        case .stroke, .strokeClip: styles = [.stroke]
        case .fillStroke, .fillStrokeClip: styles = [.fill, .stroke]
        case .invisible, .clip: return
        }
        let matrix = textMatrix.linear.toAndroid()
        withShadow { canvas, shadowColor in
            for style in styles {
                let glyphPaint = paint(style, color: shadowColor ?? (style == .fill ? state.fillColor : state.strokeColor))
                glyphPaint.setTextSize(Float(font.size))
                for (glyph, position) in zip(glyphs, positions) {
                    guard let glyphFont = face.font(for: glyph) ?? face.baseFont else { continue }
                    let count = canvas.save()
                    canvas.translate(Float(position.x), Float(position.y))
                    canvas.concat(matrix)
                    canvas.drawGlyphs([Int32(glyph)], 0, [0, 0], 0, 1, glyphFont, glyphPaint)
                    canvas.restoreToCount(count)
                }
            }
        }
    }

    // MARK: - Document

    public func beginPage() {
        guard let document = pdfDocument, isFinished == false else { return }
        if page != nil {
            endPage()
        }
        pageNumber += 1
        let info = PdfDocument.PageInfo.Builder(Int32(size.width), Int32(size.height), pageNumber).create()
        guard let newPage = document.startPage(info), let newCanvas = newPage.getCanvas() else { return }
        page = newPage
        canvas = newCanvas
        // a page starts with no transform or clip
        stack.removeAll()
        state.ctm = .identity
    }

    public func endPage() {
        guard let document = pdfDocument, let openPage = page else { return }
        document.finishPage(openPage)
        page = nil
    }

    /// Writes the PDF to disk and closes it. A PDF isn't written without it.
    public func finish() throws(SilicaError) {
        guard isFinished == false else { return }
        defer { isFinished = true }
        guard let document = pdfDocument, let url = pdfURL else { return }
        if page != nil {
            endPage()
        }
        do {
            let stream = try FileOutputStream(url.path)
            try document.writeTo(stream)
            try stream.close()
        } catch {
            throw SilicaError.writeError
        }
        document.close()
    }

    public func makeImage() -> Silica.Image? {
        guard let bitmap else { return nil }
        return Silica.Image(bitmap, scale: scale)
    }
}

// MARK: - Private

private extension AndroidCanvasRenderer {

    struct State {
        var ctm: Silica.AffineTransform = .identity
        var fillColor: Silica.Color = .black
        var strokeColor: Silica.Color = .black
        var strokeStyle = StrokeStyle()
        var alpha: Double = 1
        var blendMode: Silica.BlendMode = .normal
        var shouldAntialias = true
        var shadow: Shadow?
    }

    enum PaintStyle {
        case fill
        case stroke
    }

    /// A paint in a color with the alpha and blend mode; a stroke paint has the stroke style.
    func paint(_ style: PaintStyle, color: Silica.Color) -> Paint {
        let paint = Paint()
        paint.setAntiAlias(state.shouldAntialias)
        paint.setColor(color.opacity(state.alpha).androidValue)
        if let mode = state.blendMode.toAndroid() {
            _ = paint.setXfermode(PorterDuffXfermode(mode))
        }
        switch style {
        case .fill:
            paint.setStyle(Paint.Style(.FILL))
        case .stroke:
            let stroke = state.strokeStyle
            paint.setStyle(Paint.Style(.STROKE))
            paint.setStrokeWidth(Float(stroke.lineWidth))
            paint.setStrokeMiter(Float(stroke.miterLimit))
            switch stroke.lineCap {
            case .butt: paint.setStrokeCap(Paint.Cap(.BUTT))
            case .round: paint.setStrokeCap(Paint.Cap(.ROUND))
            case .square: paint.setStrokeCap(Paint.Cap(.SQUARE))
            }
            switch stroke.lineJoin {
            case .miter: paint.setStrokeJoin(Paint.Join(.MITER))
            case .round: paint.setStrokeJoin(Paint.Join(.ROUND))
            case .bevel: paint.setStrokeJoin(Paint.Join(.BEVEL))
            }
            // Android needs an even number of lengths
            var lengths = stroke.dash.map { Float($0) }
            if lengths.count % 2 == 1 { lengths += lengths }
            if lengths.isEmpty == false, lengths.allSatisfy({ $0 >= 0 }), lengths.contains(where: { $0 > 0 }) {
                _ = paint.setPathEffect(DashPathEffect(lengths, Float(stroke.dashPhase)))
            }
        }
        return paint
    }

    /// Draws `body` twice when there's a shadow: first at the shadow's offset
    /// in the shadow color (the silhouette, unblurred), then as itself, with nil.
    func withShadow(_ body: (AndroidGraphics.Canvas, Silica.Color?) -> Void) {
        if let shadow = state.shadow, shadow.color.alpha > 0, let inverse = state.ctm.invertedIfPossible() {
            // the offset is in base space, `scale` pixels a point: the same move in user space
            let offset = Silica.Size(width: shadow.offset.width * scale, height: shadow.offset.height * scale)
                .applying(inverse.linear)
            let count = canvas.save()
            canvas.translate(Float(offset.width), Float(offset.height))
            body(canvas, shadow.color)
            canvas.restoreToCount(count)
        }
        body(canvas, nil)
    }

    /// The gradient's colors with the alpha.
    func colors(of gradient: Gradient) -> [Int32] {
        gradient.stops.map { $0.color.opacity(state.alpha).androidValue }
    }
}

// MARK: - Conversion

internal extension Silica.Color {

    /// The color as Android's ARGB value.
    var androidValue: Int32 {
        func component(_ value: Double) -> UInt32 {
            UInt32((max(0, min(1, value)) * 255).rounded())
        }
        let argb = (component(alpha) << 24) | (component(red) << 16) | (component(green) << 8) | component(blue)
        return Int32(bitPattern: argb)
    }
}

internal extension Silica.Rect {

    func toAndroid() -> RectF {
        RectF(Float(minX), Float(minY), Float(maxX), Float(maxY))
    }
}

internal extension Silica.AffineTransform {

    func toAndroid() -> AndroidGraphics.Matrix {
        let matrix = AndroidGraphics.Matrix()
        matrix.setValues([Float(a), Float(c), Float(tx),
                          Float(b), Float(d), Float(ty),
                          0, 0, 1])
        return matrix
    }
}

internal extension Silica.Path {

    func toAndroid(rule: FillRule) -> AndroidGraphics.Path {
        let path = AndroidGraphics.Path()
        path.setFillType(AndroidGraphics.Path.FillType(rule == .evenOdd ? .EVEN_ODD : .WINDING))
        for element in elements {
            switch element {
            case let .move(point):
                path.moveTo(Float(point.x), Float(point.y))
            case let .line(point):
                path.lineTo(Float(point.x), Float(point.y))
            case let .quadCurve(point, control):
                path.quadTo(Float(control.x), Float(control.y), Float(point.x), Float(point.y))
            case let .curve(point, control1, control2):
                path.cubicTo(Float(control1.x), Float(control1.y), Float(control2.x), Float(control2.y),
                             Float(point.x), Float(point.y))
            case .closeSubpath:
                path.close()
            }
        }
        return path
    }
}

internal extension Silica.BlendMode {

    /// The Porter-Duff mode, or nil to draw normally (also for modes
    /// `PorterDuff` lacks).
    func toAndroid() -> PorterDuff.Mode? {
        switch self {
        case .normal: return nil
        case .multiply: return PorterDuff.Mode(.MULTIPLY)
        case .screen: return PorterDuff.Mode(.SCREEN)
        case .overlay: return PorterDuff.Mode(.OVERLAY)
        case .darken: return PorterDuff.Mode(.DARKEN)
        case .lighten: return PorterDuff.Mode(.LIGHTEN)
        case .clear: return PorterDuff.Mode(.CLEAR)
        case .copy: return PorterDuff.Mode(.SRC)
        case .sourceIn: return PorterDuff.Mode(.SRC_IN)
        case .sourceOut: return PorterDuff.Mode(.SRC_OUT)
        case .sourceAtop: return PorterDuff.Mode(.SRC_ATOP)
        case .destinationOver: return PorterDuff.Mode(.DST_OVER)
        case .destinationIn: return PorterDuff.Mode(.DST_IN)
        case .destinationOut: return PorterDuff.Mode(.DST_OUT)
        case .destinationAtop: return PorterDuff.Mode(.DST_ATOP)
        case .xor: return PorterDuff.Mode(.XOR)
        case .plusLighter: return PorterDuff.Mode(.ADD)
        case .colorDodge, .colorBurn, .softLight, .hardLight, .difference, .exclusion,
             .hue, .saturation, .color, .luminosity, .plusDarker:
            return nil
        }
    }
}

#endif // canImport(AndroidGraphics)
