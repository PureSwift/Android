//
//  VectorDrawableCompat.swift
//  Android
//
//  Created by Marco Estrella on 8/29/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Graphics.Drawable {
    
    public typealias VectorDrawableCompat = AndroidVectorDrawableCompat
}

public class AndroidVectorDrawableCompat: AndroidGraphicsDrawableDrawable {
    
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

public extension AndroidVectorDrawableCompat {
    
    public static func create(res: AndroidContentResResources, resId: Int, theme: JavaObject?) -> AndroidVectorDrawableCompat? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 3 )
        
        __args[0] = JNIType.toJava(value: res, locals: &__locals)
        __args[1] = jvalue(i: jint(resId))
        __args[2] = JNIType.toJava(value: theme, locals: &__locals)
        
        let __return = JNIMethod.CallStaticObjectMethod(className: JNICache.className,
                                                        classCache: &JNICache.jniClass,
                                                        methodName: "create",
                                                        methodSig: "(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/support/graphics/drawable/VectorDrawableCompat;",
                                                        methodCache: &JNICache.MethodID.create,
                                                        args: &__args,
                                                        locals: &__locals )
        
        return __return != nil ? AndroidVectorDrawableCompat(javaObject: __return) : nil
    }
    
}

internal extension AndroidVectorDrawableCompat {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/support/graphics/drawable/VectorDrawableCompat"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var create: jmethodID?
        }
    }
}

