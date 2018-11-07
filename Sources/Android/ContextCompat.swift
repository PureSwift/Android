//
//  ContextCompat.swift
//  Android
//
//  Created by Marco Estrella on 8/29/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Content {
    
    public typealias ContextCompat = AndroidContextCompat
}

open class AndroidContextCompat: JavaObject {
    
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

public extension AndroidContextCompat {
    
    public static func getColor(context: AndroidContext, colorRes: Int) -> Int64 {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = jvalue(i: jint(colorRes))
        
        let __return = JNIMethod.CallStaticIntMethod(className: JNICache.className,
                                                     classCache: &JNICache.jniClass,
                                                     methodName: "getColor",
                                                     methodSig: "(Landroid/content/Context;I)I",
                                                     methodCache: &JNICache.MethodID.getColor,
                                                     args: &__args,
                                                     locals: &__locals )
        return Int64(__return)
    }
    
    public static func getDrawable(context: AndroidContext, drawableRes: Int) -> AndroidGraphicsDrawableDrawable? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = jvalue(i: jint(drawableRes))
        
        let __return = JNIMethod.CallStaticObjectMethod(className: JNICache.className,
                                                        classCache: &JNICache.jniClass,
                                                        methodName: "getDrawable",
                                                        methodSig: "(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;",
                                                        methodCache: &JNICache.MethodID.getDrawable,
                                                        args: &__args,
                                                        locals: &__locals )
        
        return __return != nil ? AndroidGraphicsDrawableDrawable(javaObject: __return) : nil
    }
}

internal extension AndroidContextCompat {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SupportV4.Content.className(["ContextCompat"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var getColor: jmethodID?
            static var getDrawable: jmethodID?
        }
    }
}


