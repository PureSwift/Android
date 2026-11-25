//
//  Export.swift
//  AndroidSilica
//
//  Created by Alsey Coleman Miller on 7/13/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

@_exported import Silica

// AndroidGraphics and Foundation have types of the same names: in this module
// the names are Silica's, and Android's are written in full
// (`AndroidGraphics.Path`).
typealias Point = Silica.Point
typealias Rect = Silica.Rect
typealias Color = Silica.Color
typealias Path = Silica.Path
typealias Font = Silica.Font
typealias BlendMode = Silica.BlendMode
typealias AffineTransform = Silica.AffineTransform
