//
//  Android.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import JNI

/// Android namespace.
public enum Android: JavaPackage {
    
    public static let package: JNIPackage = ["android"]
    
    public enum Util: JavaPackage {
        
        public static let package: JNIPackage = Android.package + ["util"]
    }
    
    public enum OS: JavaPackage {
        
        public static let package: JNIPackage = Android.package + ["os"]
    }
    
    public enum Content: JavaPackage {
        
        public static let package: JNIPackage = Android.package + ["content"]
        
        public enum PM: JavaPackage {
            
            public static let package: JNIPackage = Android.Content.package + ["pm"]
        }
        
        public enum Res: JavaPackage {
            
            public static let package: JNIPackage = Android.Content.package + ["res"]
        }
    }
    
    public enum Widget: JavaPackage {
        
        public static let package: JNIPackage = Android.package + ["widget"]
    }
    
    public enum View: JavaPackage {
        
        public static let package: JNIPackage = Android.package + ["view"]
    }
    
    public enum App: JavaPackage {
        
        public static let package: JNIPackage = Android.package + ["app"]
    }
    
    public enum Bluetooth: JavaPackage {
        
        public static let package: JNIPackage = Android.package + ["bluetooth"]
        
        public enum LE: JavaPackage {
            
            public static let package: JNIPackage = Android.Bluetooth.package + ["le"]
        }
    }
    
    public enum Graphics: JavaPackage {
        
        public static let package: JNIPackage = Android.package + ["graphics"]
        
        public enum Drawable: JavaPackage {
            
            public static let package: JNIPackage = Android.Graphics.package + ["drawable"]
        }
    }
}

public enum SupportV7: JavaPackage {
    
    public static let package: JNIPackage = ["android", "support", "v7"]
    
    public enum Widget: JavaPackage {
        
        public static let package: JNIPackage = SupportV7.package + ["widget"]
    }
}

public enum SupportV4: JavaPackage {
    
    public static let package: JNIPackage = ["android", "support", "v4"]
    
    public enum View: JavaPackage {
        
        public static let package: JNIPackage = SupportV4.package + ["view"]
    }
}

/// Support Library namespace.
public enum SwiftSupport: JavaPackage {

    public static let package: JNIPackage = ["org", "pureswift", "swiftandroidsupport"]
    
    public enum Bluetooth: JavaPackage {
        
        public static let package: JNIPackage = SwiftSupport.package + ["bluetooth"]
        
        public enum LE: JavaPackage {
            
            public static let package: JNIPackage = SwiftSupport.Bluetooth.package + ["le"]
        }
    }
        
    public enum Widget: JavaPackage {
        
        public static let package: JNIPackage = SwiftSupport.package + ["widget"]
    }
    
    public enum App: JavaPackage {
        
        public static let package: JNIPackage = SwiftSupport.package + ["app"]
    }
    
    public enum Content: JavaPackage {
        
        public static let package: JNIPackage = SwiftSupport.package + ["content"]
    }
    
    public enum RecyclerView: JavaPackage {
        
        public static let package: JNIPackage = SwiftSupport.package + ["recyclerview"]
    }
    
    public enum View: JavaPackage {
        
        public static let package: JNIPackage = SwiftSupport.package + ["view"]
    }
}

public protocol JavaPackage {
    
    static var package: JNIPackage { get }
}

public extension JavaPackage {
    
    static func className(_ metaClass: JNIMetaClass) -> JNIClassName {
         
        return (Self.package ☕️ metaClass)
    }
}

internal extension JNIPackage {
    
    static func + (lhs: JNIPackage, rhs: [String]) -> JNIPackage {
        
        return JNIPackage(elements: lhs.elements + rhs)!
    }
}


