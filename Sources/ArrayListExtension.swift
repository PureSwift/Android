//
//  ArrayListExtension.swift
//  Android
//
//  Created by Marco Estrella on 8/9/18.
//

import Foundation
import java_util
import java_lang

extension ArrayList: Swift.Collection {
    
    public subscript(position: Int) -> JavaObject {
        return self.get(index: position)
    }
    
    public var count: Int {
        
        return self.size()
    }
    
    public func index(after index: Int) -> Int {
        
        return index + 1
    }
    
    public var startIndex: Int {
        
        return 0
    }
    
    public var endIndex: Int {
        
        return count
    }
}
