//
//  AndroidBackend.swift
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

/// Android Canvas rendering backend.
/// The Android rendering backend: fonts from `Typeface`, PNG codecs from
/// `BitmapFactory` and `Bitmap`, and bitmaps drawn with `Canvas`.
public enum AndroidBackend: SilicaBackendProtocol {

    /// Makes Android the default rendering backend.
    public static func register() {
        SilicaBackend.register(AndroidBackend.self, name: "Android")
    }

    internal static func registerIfNeeded() {
        SilicaBackend.registerIfNeeded(AndroidBackend.self, name: "Android")
    }

    // MARK: - SilicaBackendProtocol

    public static func fontFace(named name: String) -> (any Silica.FontFace)? {
        AndroidFontHandle(name: name)
    }

    public static func decodePNG(_ data: Data) -> Silica.Image? {
        let bytes = data.map { Int8(bitPattern: $0) }
        guard let factoryClass = try? JavaClass<BitmapFactory>(),
            let bitmap = factoryClass.decodeByteArray(bytes, 0, Int32(bytes.count))
            else { return nil }
        return Silica.Image(bitmap)
    }

    public static func encodePNG(_ image: Silica.Image) -> Data? {
        guard let bitmap = image.toAndroidBitmap() else { return nil }
        let stream = ByteArrayOutputStream()
        guard bitmap.compress(Bitmap.CompressFormat(.PNG), 100, stream) else { return nil }
        let bytes = stream.toByteArray()
        return Data(bytes.map { UInt8(bitPattern: $0) })
    }

    public static func makeBitmapRenderer(size: Silica.Size, scale: Double) -> (any Renderer)? {
        try? AndroidCanvasRenderer(bitmap: size, scale: scale)
    }
}


public extension Silica.Image {

    /// An image of an Android bitmap's pixels,
    /// normalizing the pixel format to premultiplied RGBA.
    convenience init?(_ bitmap: AndroidGraphics.Bitmap, scale: Double = 1) {

        let width = Int(bitmap.getWidth())
        let height = Int(bitmap.getHeight())

        guard width > 0, height > 0
            else { return nil }

        let bytesPerRow = width * 4
        var data = Data(count: bytesPerRow * height)

        data.withUnsafeMutableBytes { (buffer: UnsafeMutableRawBufferPointer) in

            let bytes = buffer.baseAddress!.assumingMemoryBound(to: UInt8.self)

            for y in 0 ..< height {

                let row = bytes + (y * bytesPerRow)

                for x in 0 ..< width {

                    // non-premultiplied ARGB color value
                    let color = UInt32(bitPattern: bitmap.getPixel(Int32(x), Int32(y)))

                    let alpha = UInt8((color >> 24) & 0xFF)
                    let red   = UInt8((color >> 16) & 0xFF)
                    let green = UInt8((color >> 8) & 0xFF)
                    let blue  = UInt8(color & 0xFF)

                    func premultiply(_ component: UInt8) -> UInt8 {
                        return UInt8((UInt16(component) * UInt16(alpha) + 127) / 255)
                    }

                    row[x * 4]     = premultiply(red)
                    row[x * 4 + 1] = premultiply(green)
                    row[x * 4 + 2] = premultiply(blue)
                    row[x * 4 + 3] = alpha
                }
            }
        }

        self.init(width: width, height: height, bytesPerRow: bytesPerRow, data: data, scale: scale)
    }

    /// Converts to an Android bitmap (`ARGB_8888`).
    func toAndroidBitmap() -> AndroidGraphics.Bitmap? {

        var pixels = [Int32]()
        pixels.reserveCapacity(width * height)

        data.withUnsafeBytes { (buffer: UnsafeRawBufferPointer) in

            let bytes = buffer.baseAddress!.assumingMemoryBound(to: UInt8.self)

            for y in 0 ..< height {

                let row = bytes + (y * bytesPerRow)

                for x in 0 ..< width {

                    let red   = row[x * 4]
                    let green = row[x * 4 + 1]
                    let blue  = row[x * 4 + 2]
                    let alpha = row[x * 4 + 3]

                    // un-premultiply into an ARGB color value
                    func unpremultiply(_ component: UInt8) -> UInt32 {
                        guard alpha > 0 else { return 0 }
                        return min(255, (UInt32(component) * 255 + UInt32(alpha) / 2) / UInt32(alpha))
                    }

                    let color: UInt32 = (UInt32(alpha) << 24)
                        | (unpremultiply(red) << 16)
                        | (unpremultiply(green) << 8)
                        | unpremultiply(blue)

                    pixels.append(Int32(bitPattern: color))
                }
            }
        }

        guard let bitmapClass = try? JavaClass<AndroidGraphics.Bitmap>()
            else { return nil }

        return bitmapClass.createBitmap(pixels, Int32(width), Int32(height), Bitmap.Config(.ARGB_8888))
    }
}

#endif // canImport(AndroidGraphics)
