//
//  ViewWindowManagerLayoutParams.swift
//  Android
//
//  Created by Marco Estrella on 11/27/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension AndroidWindowManager {
    
    public typealias LayoutParams = AndroidWindowManagerLayoutParams
}

open class AndroidWindowManagerLayoutParams: Android.View.ViewGroup.LayoutParams {
    
    // MARK: - Initialization
    
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
            className: JNICacheWindowManagerLayoutParams.className,
            classCache: &JNICacheWindowManagerLayoutParams.jniClass,
            methodSig: "()V",
            methodCache: &JNICacheWindowManagerLayoutParams.MethodID.newMethod,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    @discardableResult
    public func copyFrom(_ o: AndroidWindowManagerLayoutParams) -> Int {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava(value: o, locals: &__locals)
        
        let __return = JNIMethod.CallIntMethod(
            object: javaObject,
            methodName: "copyFrom",
            methodSig: "(L\(AndroidWindowManagerLayoutParams.JNICacheWindowManagerLayoutParams.className);)I",
            methodCache: &JNICacheWindowManagerLayoutParams.MethodID.copyFrom,
            args: &__args,
            locals: &__locals )
        
        return Int(__return)
    }
}

// MARK: - Private

internal extension AndroidWindowManagerLayoutParams {
    
    /// JNI Cache
    struct JNICacheWindowManagerLayoutParams {
        
        /// JNI Java class signature
        static let classSignature = Android.View.className(["WindowManager$LayoutParams"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
            //static var MATCH_PARENT: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            static var newMethod: jmethodID?
            static var copyFrom: jmethodID?
        }
    }
}
