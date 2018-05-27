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
    
    public enum Os: JavaPackage {
        
        public static let package: JNIPackage = Android.package + ["os"]
    }
    
    public enum Content: JavaPackage {
        
        public static let package: JNIPackage = Android.package + ["content"]
    }
    
    public enum Widget: JavaPackage {
        
        public static let package: JNIPackage = Android.package + ["widget"]
    }
    
    public enum View: JavaPackage {
        
        public static let package: JNIPackage = Android.package + ["view"]
    }
    
    public enum Bluetooth: JavaPackage {
        
        public static let package: JNIPackage = Android.package + ["bluetooth"]
        
        public enum LE: JavaPackage {
            
            public static let package: JNIPackage = Android.Bluetooth.package + ["le"]
        }
    }
}

internal extension Android {
    
    internal enum SwiftSupport: JavaPackage {
        
        static let package: JNIPackage = ["org", "pureswift", "swiftandroidsupport"]
        
        internal enum Bluetooth: JavaPackage {
            
            internal static let package: JNIPackage = Android.package + ["bluetooth"]
            
            internal enum LE: JavaPackage {
                
                internal static let package: JNIPackage = Android.Bluetooth.package + ["le"]
            }
        }
        
        internal enum Widget: JavaPackage {
            
            internal static let package: JNIPackage = Android.package + ["widget"]
        }
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


