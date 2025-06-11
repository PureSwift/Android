//
//  TextView.swift
//  SwiftAndroidApp
//
//  Created by Alsey Coleman Miller on 6/11/25.
//

import AndroidKit

extension TextView {
    
    var text: String {
        get {
            getText().toString()
        }
        set {
            setText(JavaString(newValue).as(CharSequence.self))
        }
    }
}
