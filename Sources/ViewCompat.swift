//
//  ViewCompat.swift
//  Android
//
//  Created by Marco Estrella on 8/29/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Graphics.Drawable {
    
    public typealias ViewCompat = AndroidViewCompat
}

open class AndroidViewCompat: JavaObject {
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
}

public extension AndroidViewCompat {
    
    public static func generateViewId() -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallStaticIntMethod(className: JNICache.className,
                                                     classCache: &JNICache.jniClass,
                                                     methodName: "generateViewId",
                                                     methodSig: "()I",
                                                     methodCache: &JNICache.MethodID.generateViewId,
                                                     args: &__args,
                                                     locals: &__locals )
        return Int(__return)
    }
}

internal extension AndroidViewCompat {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SupportV4.View.className(["ViewCompat"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var generateViewId: jmethodID?
        }
    }
}
