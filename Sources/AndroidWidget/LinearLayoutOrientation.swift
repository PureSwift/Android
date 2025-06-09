//
//  LinearLayoutOrientation.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 6/9/25.
//

import JavaKit

public extension LinearLayout {
    
    struct Orientation: RawRepresentable, Equatable, Hashable, Codable, Sendable {
        
        public let rawValue: Int32
        
        public init(rawValue: Int32) {
            self.rawValue = rawValue
        }
    }
}

public extension LinearLayout {
    
    var orientation: LinearLayout.Orientation {
        get {
            .init(rawValue: getOrientation())
        }
        set {
            setOrientation(newValue.rawValue)
        }
    }
}

public extension LinearLayout.Orientation {
    
    static let vertical = LinearLayout.Orientation(rawValue: try! JavaClass<LinearLayout>().VERTICAL)
    
    static var horizontal = LinearLayout.Orientation(rawValue: try! JavaClass<LinearLayout>().HORIZONTAL)
}
