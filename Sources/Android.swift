//
//  Android.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/21/18.
//

import JNI

/// Android namespace.
public enum Android: JavaPackage {
    
    public static let package = ["android"]
    
    public enum Content: JavaPackage {
        
        public static let package = Android.package + ["content"]
    }
    
    public enum Widget: JavaPackage {
        
        public static let package = Android.package + ["widget"]
    }
    
    public enum View: JavaPackage {
        
        public static let package = Android.package + ["view"]
    }
    
    public enum Bluetooth: JavaPackage {
        
        public static let package = Android.package + ["bluetooth"]
        
        public enum LE: JavaPackage {
            
            public static let package = Android.Bluetooth.package + ["le"]
        }
    }
}

public protocol JavaPackage {
    
    static var package: [String] { get }
}
