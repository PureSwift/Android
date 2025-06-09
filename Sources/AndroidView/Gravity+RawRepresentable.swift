//
//  Gravity+RawRepresentable.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 6/9/25.
//

import JavaKit

/// Standard constants and tools for placing an object within a potentially larger container.
public struct ViewGravity: OptionSet, Equatable, Hashable, Codable, Sendable {
    
    public let rawValue: Int32
    
    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
}

internal extension ViewGravity {
        
    static let javaClass = try! JavaClass<AndroidView.Gravity>()
}

// MARK: - Properties

public extension ViewGravity {
    
    /// Indicate whether the supplied gravity has an horizontal pull.
    var isHorizontal: Bool {
        Self.javaClass.isHorizontal(rawValue)
    }
    
    /// Indicate whether the supplied gravity has a vertical pull.
    var isVertical: Bool {
        Self.javaClass.isVertical(rawValue)
    }
}

// MARK: - Constants

public extension ViewGravity {
    
    static let axisClip = ViewGravity(rawValue: javaClass.AXIS_CLIP)
    static let axisPullAfter = ViewGravity(rawValue: javaClass.AXIS_PULL_AFTER)
    static let axisPullBefore = ViewGravity(rawValue: javaClass.AXIS_PULL_BEFORE)
    static let axisSpecified = ViewGravity(rawValue: javaClass.AXIS_SPECIFIED)
    static let axisXShift = ViewGravity(rawValue: javaClass.AXIS_X_SHIFT)
    static let axisYShift = ViewGravity(rawValue: javaClass.AXIS_Y_SHIFT)

    static let bottom = ViewGravity(rawValue: javaClass.BOTTOM)
    static let center = ViewGravity(rawValue: javaClass.CENTER)
    static let centerHorizontal = ViewGravity(rawValue: javaClass.CENTER_HORIZONTAL)
    static let centerVertical = ViewGravity(rawValue: javaClass.CENTER_VERTICAL)

    static let clipHorizontal = ViewGravity(rawValue: javaClass.CLIP_HORIZONTAL)
    static let clipVertical = ViewGravity(rawValue: javaClass.CLIP_VERTICAL)

    static let displayClipHorizontal = ViewGravity(rawValue: javaClass.DISPLAY_CLIP_HORIZONTAL)
    static let displayClipVertical = ViewGravity(rawValue: javaClass.DISPLAY_CLIP_VERTICAL)

    static let end = ViewGravity(rawValue: javaClass.END)
    static let fill = ViewGravity(rawValue: javaClass.FILL)
    static let fillHorizontal = ViewGravity(rawValue: javaClass.FILL_HORIZONTAL)
    static let fillVertical = ViewGravity(rawValue: javaClass.FILL_VERTICAL)

    static let horizontalGravityMask = ViewGravity(rawValue: javaClass.HORIZONTAL_GRAVITY_MASK)
    static let left = ViewGravity(rawValue: javaClass.LEFT)
    static let noGravity = ViewGravity(rawValue: javaClass.NO_GRAVITY)

    static let relativeHorizontalGravityMask = ViewGravity(rawValue: javaClass.RELATIVE_HORIZONTAL_GRAVITY_MASK)
    static let relativeLayoutDirection = ViewGravity(rawValue: javaClass.RELATIVE_LAYOUT_DIRECTION)

    static let right = ViewGravity(rawValue: javaClass.RIGHT)
    static let start = ViewGravity(rawValue: javaClass.START)
    static let top = ViewGravity(rawValue: javaClass.TOP)
    static let verticalGravityMask = ViewGravity(rawValue: javaClass.VERTICAL_GRAVITY_MASK)
}
