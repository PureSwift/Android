//
//  GraphicsDrawableDrawable.swift
//  Android
//
//  Created by Marco Estrella on 7/18/18.
//

import Foundation
import java_lang

public extension Android.Graphics.Drawable {
    
    public typealias Drawable = AndroidGraphicsDrawableDrawable
}

/***
 * A Drawable is a general abstraction for "something that can be drawn." Most often you will deal with Drawable
 * as the type of resource retrieved for drawing things to the screen; the Drawable class provides a generic API
 * for dealing with an underlying visual resource that may take a variety of forms. Unlike a View, a Drawable does
 * not have any facility to receive events or otherwise interact with the user.
 */
open class AndroidGraphicsDrawableDrawable: JavaObject {
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString = #file,
                              _ line: Int = #line ) {
        
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public required init( javaObject: jobject? ) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init(){
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __object = JNIMethod.NewObject(
            className: DrawableJNICache.className,
            classCache: &DrawableJNICache.jniClass,
            methodSig: "()V",
            methodCache: &DrawableJNICache.MethodID.newMethod1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension AndroidGraphicsDrawableDrawable {
    
    /// JNI Cache
    struct DrawableJNICache {
        
        /// JNI Java class signature
        static let classSignature = Android.Graphics.Drawable.className(["Drawable"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var newMethod1: jmethodID?
        }
    }
}

