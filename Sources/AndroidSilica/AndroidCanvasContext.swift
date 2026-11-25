//
//  AndroidCanvasContext.swift
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

/// Android Canvas backed implementation of `CGContext`.
///
/// Android's Canvas is already a top-left origin, y-down coordinate system, so no
/// base flip is required. PDF output uses `android.graphics.pdf.PdfDocument`,
/// whose page canvas operates in points (1/72 inch).
///
/// The current transformation matrix is tracked on the Swift side: path points are
/// transformed into device space at add time (matching Cairo and Quartz semantics)
/// and strokes are rendered under the CTM so pen geometry transforms correctly.
///
/// - Note: `finish()` is mandatory for PDF destinations — the document is only
///   written to disk when it is called. JNI-backed objects must be used from a
///   JVM-attached thread; a context should be created, used and finished on the
///   same thread.
/// - Note: Glyph rendering requires Android API 31 (`Canvas.drawGlyphs`).
public final class AndroidCanvasContext: Silica.CGContext {

    // MARK: - Properties

    public let size: CGSize

    /// Android's Canvas is natively top-left origin, y-down.
    public var isFlipped: Bool { true }

    /// The underlying Android canvas (replaced on `beginPage()` for PDF destinations).
    public private(set) var canvas: AndroidGraphics.Canvas

    public var textMatrix = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)

    // MARK: - Private Properties

    private let pdfDocument: PdfDocument?

    private let pdfURL: URL?

    private let bitmap: AndroidGraphics.Bitmap?

    private var page: PdfDocument.Page?

    private var pageNumber: Int32 = 0

    private var isFinished = false

    private var internalState: State = State()

    private var devicePath = AndroidGraphics.Path()

    /// Mirror of the current path (device space) for the `path` accessor.
    private var deviceElements = [PathElement]()

    private var deviceCurrentPoint: CGPoint?

    private var deviceSubpathStart: CGPoint?

    private var saveCounts = [Int32]()

    private var layerCounts = [Int32]()

    // MARK: - Initialization

    /// Creates a PDF drawing destination at the specified file URL.
    ///
    /// Call `finish()` to write the document to disk.
    public init(pdf url: URL, size: CGSize) throws(SilicaError) {

        let document = PdfDocument()

        self.pdfDocument = document
        self.pdfURL = url
        self.bitmap = nil
        self.size = size

        let info = PdfDocument.PageInfo.Builder(Int32(size.width), Int32(size.height), 1).create()

        guard let page = document.startPage(info),
            let canvas = page.getCanvas()
            else { throw SilicaError.invalidContext }

        self.page = page
        self.canvas = canvas
        self.pageNumber = 1

        AndroidBackend.registerIfNeeded()
    }

    /// Creates a bitmap drawing destination of the specified size.
    public init(bitmap size: CGSize) throws(SilicaError) {

        guard let bitmapClass = try? JavaClass<AndroidGraphics.Bitmap>(),
            let bitmap = bitmapClass.createBitmap(Int32(size.width), Int32(size.height), Bitmap.Config(.ARGB_8888))
            else { throw SilicaError.noMemory }

        self.pdfDocument = nil
        self.pdfURL = nil
        self.bitmap = bitmap
        self.size = size
        self.canvas = Canvas(bitmap)

        AndroidBackend.registerIfNeeded()
    }

    /// Wraps an existing canvas (e.g. provided to `View.onDraw`).
    public init(canvas: AndroidGraphics.Canvas, size: CGSize) {

        self.pdfDocument = nil
        self.pdfURL = nil
        self.bitmap = nil
        self.size = size
        self.canvas = canvas

        AndroidBackend.registerIfNeeded()
    }

    // MARK: - Defining Pages

    public func beginPage() {

        guard let document = pdfDocument, isFinished == false
            else { return }

        if page != nil {
            endPage()
        }

        pageNumber += 1

        let info = PdfDocument.PageInfo.Builder(Int32(size.width), Int32(size.height), pageNumber).create()

        guard let newPage = document.startPage(info),
            let newCanvas = newPage.getCanvas()
            else { assertionFailure("Unable to start PDF page"); return }

        page = newPage
        canvas = newCanvas
        saveCounts.removeAll()
        layerCounts.removeAll()
    }

    public func endPage() {

        guard let document = pdfDocument, let openPage = page
            else { return }

        document.finishPage(openPage)
        page = nil
    }

    /// Writes the PDF document to disk and closes it.
    ///
    /// This method is mandatory for PDF destinations.
    public func finish() throws(SilicaError) {

        guard isFinished == false
            else { return }

        defer { isFinished = true }

        guard let document = pdfDocument, let url = pdfURL
            else { return }

        if page != nil {
            endPage()
        }

        let stream: FileOutputStream

        do {
            stream = try FileOutputStream(url.path)
        }
        catch {
            throw SilicaError.writeError
        }

        do {
            try document.writeTo(stream)
            try stream.close()
        }
        catch {
            throw SilicaError.writeError
        }

        document.close()
    }

    // MARK: - Transforming the Coordinate Space

    public var currentTransform: CGAffineTransform {

        return internalState.ctm
    }

    public func scaleBy(x: CGFloat, y: CGFloat) {

        concatenate(CGAffineTransform(a: x, b: 0, c: 0, d: y, tx: 0, ty: 0))
    }

    public func translateBy(x: CGFloat, y: CGFloat) {

        concatenate(CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: x, ty: y))
    }

    public func rotateBy(_ angle: CGFloat) {

        let cosine = cos(angle)
        let sine = sin(angle)

        concatenate(CGAffineTransform(a: cosine, b: sine, c: -sine, d: cosine, tx: 0, ty: 0))
    }

    public func concatenate(_ transform: CGAffineTransform) {

        // new = transform * ctm (transform applied first, in user space)
        internalState.ctm = transform.multiplied(by: internalState.ctm)
    }

    // MARK: - Saving and Restoring the Graphics State

    public func save() throws(SilicaError) {

        saveCounts.append(canvas.save())

        let newState = internalState.copy
        newState.next = internalState
        internalState = newState
    }

    public func restore() throws(SilicaError) {

        guard let restoredState = internalState.next,
            let saveCount = saveCounts.popLast()
            else { throw .invalidRestore }

        canvas.restoreToCount(saveCount)
        internalState = restoredState
    }

    // MARK: - Graphics State Attributes

    public var shouldAntialias: Bool {

        get { return internalState.shouldAntialias }

        set { internalState.shouldAntialias = newValue }
    }

    public var lineWidth: CGFloat {

        get { return internalState.lineWidth }

        set { internalState.lineWidth = newValue }
    }

    public var lineJoin: CGLineJoin {

        get { return internalState.lineJoin }

        set { internalState.lineJoin = newValue }
    }

    public var lineCap: CGLineCap {

        get { return internalState.lineCap }

        set { internalState.lineCap = newValue }
    }

    public var miterLimit: CGFloat {

        get { return internalState.miterLimit }

        set { internalState.miterLimit = newValue }
    }

    public var lineDash: (phase: CGFloat, lengths: [CGFloat]) {

        get { return internalState.lineDash }

        set { internalState.lineDash = newValue }
    }

    public var tolerance: CGFloat {

        get { return internalState.tolerance }

        set { internalState.tolerance = newValue }
    }

    public var fillColor: CGColor {

        get { return internalState.fill ?? CGColor.black }

        set { internalState.fill = newValue }
    }

    public var strokeColor: CGColor {

        get { return internalState.stroke ?? CGColor.black }

        set { internalState.stroke = newValue }
    }

    public var alpha: CGFloat {

        get { return internalState.alpha }

        set {

            internalState.alpha = newValue

            // match the Cairo backend: setting alpha overwrites the color alpha
            internalState.fill?.alpha = newValue
            internalState.stroke?.alpha = newValue
        }
    }

    public func setShadow(offset: CGSize, radius: CGFloat, color: CGColor) {

        internalState.shadow = (offset: offset, radius: radius, color: color)
    }

    // MARK: - Constructing Paths

    public var path: CGPath {

        let inverse = internalState.ctm.inverse

        return CGPath(elements: deviceElements.map { $0.applying(inverse) })
    }

    public var currentPoint: CGPoint? {

        guard let devicePoint = deviceCurrentPoint
            else { return nil }

        return devicePoint.applying(internalState.ctm.inverse)
    }

    public func beginPath() {

        devicePath.reset()
        deviceElements.removeAll()
        deviceCurrentPoint = nil
        deviceSubpathStart = nil
    }

    public func closePath() {

        devicePath.close()
        deviceElements.append(.closeSubpath)
        deviceCurrentPoint = deviceSubpathStart
    }

    public func move(to point: CGPoint) {

        let device = point.applying(internalState.ctm)

        devicePath.moveTo(Float(device.x), Float(device.y))
        deviceElements.append(.moveToPoint(device))
        deviceCurrentPoint = device
        deviceSubpathStart = device
    }

    public func addLine(to point: CGPoint) {

        let device = point.applying(internalState.ctm)

        devicePath.lineTo(Float(device.x), Float(device.y))
        deviceElements.append(.addLineToPoint(device))
        deviceCurrentPoint = device
    }

    public func addCurve(to end: CGPoint, control1: CGPoint, control2: CGPoint) {

        let deviceControl1 = control1.applying(internalState.ctm)
        let deviceControl2 = control2.applying(internalState.ctm)
        let deviceEnd = end.applying(internalState.ctm)

        devicePath.cubicTo(Float(deviceControl1.x), Float(deviceControl1.y),
                           Float(deviceControl2.x), Float(deviceControl2.y),
                           Float(deviceEnd.x), Float(deviceEnd.y))
        deviceElements.append(.addCurveToPoint(deviceControl1, deviceControl2, deviceEnd))
        deviceCurrentPoint = deviceEnd
    }

    public func addArc(center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool) {

        // Match Cairo's angle normalization: arcs sweep from the start angle to the
        // end angle in increasing direction (decreasing when clockwise).
        let start = Double(startAngle)
        var end = Double(endAngle)

        if clockwise {
            while end > start { end -= 2.0 * .pi }
        } else {
            while end < start { end += 2.0 * .pi }
        }

        let radius = Double(radius)

        func point(at angle: Double) -> CGPoint {
            return CGPoint(x: center.x + CGFloat(radius * Foundation.cos(angle)),
                           y: center.y + CGFloat(radius * Foundation.sin(angle)))
        }

        let startPoint = point(at: start)

        // Cairo adds a line from the current point to the arc start (or moves to it).
        if deviceCurrentPoint != nil {
            addLine(to: startPoint)
        } else {
            move(to: startPoint)
        }

        let total = end - start

        guard total != 0, radius > 0
            else { return }

        // subdivide into segments of at most 90°, lowered to cubic Béziers
        let segments = max(1, Int((abs(total) / (Double.pi / 2.0)).rounded(.up)))
        let delta = total / Double(segments)
        let k = (4.0 / 3.0) * Foundation.tan(delta / 4.0)

        var angle1 = start

        for _ in 0 ..< segments {

            let angle2 = angle1 + delta

            let p1 = point(at: angle1)
            let p2 = point(at: angle2)

            let control1 = CGPoint(x: p1.x - CGFloat(k * radius * Foundation.sin(angle1)),
                                   y: p1.y + CGFloat(k * radius * Foundation.cos(angle1)))
            let control2 = CGPoint(x: p2.x + CGFloat(k * radius * Foundation.sin(angle2)),
                                   y: p2.y - CGFloat(k * radius * Foundation.cos(angle2)))

            addCurve(to: p2, control1: control1, control2: control2)

            angle1 = angle2
        }
    }

    public func addRect(_ rect: CGRect) {

        move(to: CGPoint(x: rect.minX, y: rect.minY))
        addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        closePath()
    }

    // MARK: - Painting Paths

    public func strokePath() {

        if let shadow = internalState.shadow {
            drawShadow(shadow) { canvas, paint in
                self.strokeUnderTransform(paint: paint, canvas: canvas)
            }
        }

        strokeUnderTransform(paint: strokePaint(), canvas: canvas)
        resetPath()
    }

    public func fillPath(evenOdd: Bool, preserve: Bool) {

        devicePath.setFillType(Path.FillType(evenOdd ? .EVEN_ODD : .WINDING))

        if let shadow = internalState.shadow {
            drawShadow(shadow) { canvas, paint in
                canvas.drawPath(self.devicePath, paint)
            }
        }

        canvas.drawPath(devicePath, fillPaint())

        if preserve == false {
            resetPath()
        }
    }

    public func clear() {

        clip(evenOdd: false)
    }

    public func clip(evenOdd: Bool) {

        devicePath.setFillType(Path.FillType(evenOdd ? .EVEN_ODD : .WINDING))
        _ = canvas.clipPath(devicePath)
        resetPath()
    }

    // MARK: - Transparency Layers

    public func beginTransparencyLayer(in rect: CGRect?, auxiliaryInfo: CGAuxiliaryInfo?) {

        let alpha = Int32((internalState.alpha * 255).rounded())

        let count: Int32

        if let rect = rect {
            // transform the user-space rect corners into device space and take their bounds
            let corners = [
                CGPoint(x: rect.minX, y: rect.minY).applying(internalState.ctm),
                CGPoint(x: rect.maxX, y: rect.minY).applying(internalState.ctm),
                CGPoint(x: rect.minX, y: rect.maxY).applying(internalState.ctm),
                CGPoint(x: rect.maxX, y: rect.maxY).applying(internalState.ctm)
            ]
            let minX = corners.map { $0.x }.min()!
            let minY = corners.map { $0.y }.min()!
            let maxX = corners.map { $0.x }.max()!
            let maxY = corners.map { $0.y }.max()!
            let bounds = RectF(Float(minX), Float(minY), Float(maxX), Float(maxY))
            count = canvas.saveLayerAlpha(bounds, alpha)
        } else {
            count = canvas.saveLayerAlpha(nil, alpha)
        }

        layerCounts.append(count)

        let newState = internalState.copy
        newState.next = internalState
        newState.alpha = 1.0
        newState.shadow = nil
        internalState = newState
    }

    public func endTransparencyLayer() {

        guard let count = layerCounts.popLast()
            else { return }

        canvas.restoreToCount(count)

        if let restoredState = internalState.next {
            internalState = restoredState
        }
    }

    // MARK: - Drawing Images

    public func draw(_ image: CGImage, in rect: CGRect) {

        guard let bitmap = image.toAndroidBitmap()
            else { assertionFailure("Unable to convert image"); return }

        // Silica's `draw(_:in:)` follows Apple's y-up image convention (callers
        // flip the CTM to draw upright, as UIKit code does), so mirror the image
        // vertically about the rect's centerline.
        _ = canvas.save()
        canvas.concat(internalState.ctm.toAndroid())
        canvas.translate(0, Float(rect.minY + rect.maxY))
        canvas.scale(1, -1)

        let destination = RectF(Float(rect.minX), Float(rect.minY), Float(rect.maxX), Float(rect.maxY))
        let paint = Paint()
        paint.setAntiAlias(internalState.shouldAntialias)
        canvas.drawBitmap(bitmap, nil, destination, paint)

        canvas.restore()
    }

    // MARK: - Drawing Text

    public var font: CGFont? {

        return internalState.font
    }

    public func setFont(_ font: CGFont) {

        internalState.font = font
    }

    public var fontSize: CGFloat {

        get { return internalState.fontSize }

        set { internalState.fontSize = newValue }
    }

    public var characterSpacing: CGFloat {

        get { return internalState.characterSpacing }

        set { internalState.characterSpacing = newValue }
    }

    public var textDrawingMode: CGTextDrawingMode {

        get { return internalState.textMode }

        set { internalState.textMode = newValue }
    }

    /// Primitive glyph rendering; positions are user-space baseline origins.
    ///
    /// Requires Android API 31 (`Canvas.drawGlyphs`). The linear components of the
    /// text matrix (scale / rotation of glyph shapes) are not supported on Android.
    public func draw(glyphs: [(glyph: CGGlyph, position: CGPoint)]) {

        guard let font = internalState.font,
            fontSize > 0.0 && glyphs.isEmpty == false
            else { return }

        guard let handle = font.handle as? AndroidFontHandle
            else { assertionFailure("Font \(font.name) was not loaded by the Android backend"); return }

        guard internalState.textMode != .invisible
            else { return }

        let paint = Paint()
        paint.setAntiAlias(internalState.shouldAntialias)
        paint.setColor(colorValue(internalState.fill ?? .black))
        paint.setTextSize(Float(fontSize))

        switch internalState.textMode {
        case .stroke, .strokeClip:
            paint.setStyle(Paint.Style(.STROKE))
            paint.setColor(colorValue(internalState.stroke ?? .black))
            paint.setStrokeWidth(Float(internalState.lineWidth))
        case .fillStroke, .fillStrokeClip:
            paint.setStyle(Paint.Style(.FILL_AND_STROKE))
            paint.setStrokeWidth(Float(internalState.lineWidth))
        default:
            paint.setStyle(Paint.Style(.FILL))
        }

        _ = canvas.save()
        canvas.concat(internalState.ctm.toAndroid())

        for element in glyphs {

            let glyphFont = handle.font(for: element.glyph) ?? handle.baseFont

            canvas.drawGlyphs([Int32(element.glyph)], 0,
                              [Float(element.position.x), Float(element.position.y)], 0,
                              1, glyphFont, paint)
        }

        canvas.restore()
    }

    // MARK: - Bitmap Contexts

    public func makeImage() -> CGImage? {

        guard let bitmap = self.bitmap
            else { return nil }

        return CGImage(bitmap)
    }

    // MARK: - Private Methods

    private func resetPath() {

        beginPath()
    }

    private func fillPaint() -> Paint {

        let paint = Paint()
        paint.setAntiAlias(internalState.shouldAntialias)
        paint.setStyle(Paint.Style(.FILL))
        paint.setColor(colorValue(internalState.fill ?? .black))
        return paint
    }

    private func strokePaint() -> Paint {

        let paint = Paint()
        paint.setAntiAlias(internalState.shouldAntialias)
        paint.setStyle(Paint.Style(.STROKE))
        paint.setColor(colorValue(internalState.stroke ?? .black))
        paint.setStrokeWidth(Float(internalState.lineWidth))
        paint.setStrokeMiter(Float(internalState.miterLimit))

        switch internalState.lineCap {
        case .butt: paint.setStrokeCap(Paint.Cap(.BUTT))
        case .round: paint.setStrokeCap(Paint.Cap(.ROUND))
        case .square: paint.setStrokeCap(Paint.Cap(.SQUARE))
        }

        switch internalState.lineJoin {
        case .miter: paint.setStrokeJoin(Paint.Join(.MITER))
        case .round: paint.setStrokeJoin(Paint.Join(.ROUND))
        case .bevel: paint.setStrokeJoin(Paint.Join(.BEVEL))
        }

        let dash = internalState.lineDash

        if dash.lengths.isEmpty == false {
            _ = paint.setPathEffect(DashPathEffect(dash.lengths.map { Float($0) }, Float(dash.phase)))
        }

        return paint
    }

    /// Strokes the current device-space path with the pen transformed by the CTM,
    /// reproducing Cairo's stroke semantics (including non-uniform scales).
    private func strokeUnderTransform(paint: Paint, canvas: AndroidGraphics.Canvas) {

        let ctm = internalState.ctm

        // transform the device path back into user space
        let userPath = AndroidGraphics.Path()
        devicePath.transform(ctm.inverse.toAndroid(), userPath)

        _ = canvas.save()
        canvas.concat(ctm.toAndroid())
        canvas.drawPath(userPath, paint)
        canvas.restore()
    }

    /// Draws the shadow pass: the shape silhouette in the shadow color at the
    /// shadow offset (no blur, matching the Cairo backend's emulation).
    private func drawShadow(_ shadow: (offset: CGSize, radius: CGFloat, color: CGColor),
                            _ draw: (AndroidGraphics.Canvas, Paint) -> ()) {

        let ctm = internalState.ctm

        // the offset is specified in user space
        let deviceOffset = CGSize(width: ctm.a * shadow.offset.width + ctm.c * shadow.offset.height,
                                  height: ctm.b * shadow.offset.width + ctm.d * shadow.offset.height)

        let paint = Paint()
        paint.setAntiAlias(internalState.shouldAntialias)
        paint.setStyle(Paint.Style(.FILL))
        paint.setColor(colorValue(shadow.color))

        _ = canvas.save()
        canvas.translate(Float(deviceOffset.width), Float(deviceOffset.height))
        draw(canvas, paint)
        canvas.restore()
    }

    private func colorValue(_ color: CGColor) -> Int32 {

        func component(_ value: CGFloat) -> UInt32 {
            return UInt32((max(0, min(1, value)) * 255).rounded())
        }

        let argb: UInt32 = (component(color.alpha) << 24)
            | (component(color.red) << 16)
            | (component(color.green) << 8)
            | component(color.blue)

        return Int32(bitPattern: argb)
    }
}

// MARK: - State

internal extension AndroidCanvasContext {

    fileprivate final class State {

        var next: State?
        var ctm = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
        var alpha: CGFloat = 1.0
        var fill: CGColor?
        var stroke: CGColor?
        var shadow: (offset: CGSize, radius: CGFloat, color: CGColor)?
        var font: CGFont?
        var fontSize: CGFloat = 0.0
        var characterSpacing: CGFloat = 0.0
        var textMode = CGTextDrawingMode()
        var shouldAntialias = true
        var lineWidth: CGFloat = 1.0
        var lineCap = CGLineCap()
        var lineJoin = CGLineJoin()
        var miterLimit: CGFloat = 10.0
        var lineDash: (phase: CGFloat, lengths: [CGFloat]) = (0.0, [])
        var tolerance: CGFloat = 0.1

        init() { }

        var copy: State {

            let copy = State()

            copy.next = next
            copy.ctm = ctm
            copy.alpha = alpha
            copy.fill = fill
            copy.stroke = stroke
            copy.shadow = shadow
            copy.font = font
            copy.fontSize = fontSize
            copy.characterSpacing = characterSpacing
            copy.textMode = textMode
            copy.shouldAntialias = shouldAntialias
            copy.lineWidth = lineWidth
            copy.lineCap = lineCap
            copy.lineJoin = lineJoin
            copy.miterLimit = miterLimit
            copy.lineDash = lineDash
            copy.tolerance = tolerance

            return copy
        }
    }
}

// MARK: - Geometry Helpers

internal extension CGAffineTransform {

    /// The result of applying `self` first, then `other`.
    func multiplied(by other: CGAffineTransform) -> CGAffineTransform {

        return CGAffineTransform(
            a: a * other.a + b * other.c,
            b: a * other.b + b * other.d,
            c: c * other.a + d * other.c,
            d: c * other.b + d * other.d,
            tx: tx * other.a + ty * other.c + other.tx,
            ty: tx * other.b + ty * other.d + other.ty
        )
    }

    var inverse: CGAffineTransform {

        let determinant = a * d - b * c

        guard determinant != 0
            else { return self }

        return CGAffineTransform(
            a: d / determinant,
            b: -b / determinant,
            c: -c / determinant,
            d: a / determinant,
            tx: (c * ty - d * tx) / determinant,
            ty: (b * tx - a * ty) / determinant
        )
    }

    func toAndroid() -> AndroidGraphics.Matrix {

        let matrix = AndroidGraphics.Matrix()

        matrix.setValues([
            Float(a), Float(c), Float(tx),
            Float(b), Float(d), Float(ty),
            0, 0, 1
        ])

        return matrix
    }
}

internal extension PathElement {

    func applying(_ transform: CGAffineTransform) -> PathElement {

        switch self {

        case let .moveToPoint(point):
            return .moveToPoint(point.applying(transform))

        case let .addLineToPoint(point):
            return .addLineToPoint(point.applying(transform))

        case let .addQuadCurveToPoint(control, destination):
            return .addQuadCurveToPoint(control.applying(transform), destination.applying(transform))

        case let .addCurveToPoint(control1, control2, destination):
            return .addCurveToPoint(control1.applying(transform), control2.applying(transform), destination.applying(transform))

        case .closeSubpath:
            return .closeSubpath
        }
    }
}

#endif // canImport(AndroidGraphics)
