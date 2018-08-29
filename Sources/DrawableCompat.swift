//
//  DrawableCompat.swift
//  Android
//
//  Created by Marco Estrella on 8/29/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Graphics.Drawable {
    
    public typealias DrawableCompat = AndroidDrawableCompat
}

open class AndroidDrawableCompat: JavaObject {
    
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

public extension AndroidDrawableCompat {
    
    public static func wrap(drawable: AndroidGraphicsDrawableDrawable) -> AndroidGraphicsDrawableDrawable? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: drawable, locals: &__locals)
        
        let __return = JNIMethod.CallStaticObjectMethod(className: JNICache.className,
                                                        classCache: &JNICache.jniClass,
                                                        methodName: "wrap",
                                                        methodSig: "(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;",
                                                        methodCache: &JNICache.MethodID.wrap,
                                                        args: &__args,
                                                        locals: &__locals )
        
        return __return != nil ? AndroidGraphicsDrawableDrawable(javaObject: __return) : nil
    }
}

internal extension AndroidDrawableCompat {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Graphics.Drawable.className(["DrawableCompat"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var wrap: jmethodID?
        }
    }
}
