//
//  RecyclerViewDividerItemDecoration.swift
//  Android
//
//  Created by Marco Estrella on 12/28/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Widget {
    
    public typealias DividerItemDecoration = AndroidDividerItemDecoration
}

/**
 * DividerItemDecoration is a RecyclerView.ItemDecoration that can be used as a divider between items of a LinearLayoutManager. It supports both HORIZONTAL and VERTICAL orientations.
 */
open class AndroidDividerItemDecoration: AndroidRecyclerViewItemDecoration {
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public convenience init(context: AndroidContext, orientation: Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        __args[1] = jvalue(i: jint(orientation))
        
        let __object = JNIMethod.NewObject(
            className: JNICacheDividerItemDecoration.className,
            classCache: &JNICacheDividerItemDecoration.jniClass,
            methodSig: "(L\(AndroidContext.JNICache.className);I)V",
            methodCache: &JNICacheDividerItemDecoration.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public static var HORIZONTAL: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "HORIZONTAL",
                fieldType: "I",
                fieldCache: &JNICacheDividerItemDecoration.FieldID.HORIZONTAL,
                className: JNICacheDividerItemDecoration.className,
                classCache: &JNICacheDividerItemDecoration.jniClass )
            
            return Int(__value)
        }
    }
    
    public static var VERTICAL: Int {
        
        get {
            
            let __value = JNIField.GetStaticIntField(
                fieldName: "VERTICAL",
                fieldType: "I",
                fieldCache: &JNICacheDividerItemDecoration.FieldID.VERTICAL,
                className: JNICacheDividerItemDecoration.className,
                classCache: &JNICacheDividerItemDecoration.jniClass )
            
            return Int(__value)
        }
    }
}

internal extension AndroidDividerItemDecoration {
    
    /// JNI Cache
    struct JNICacheDividerItemDecoration {
        
        static let classSignature = SupportV7.Widget.className(["DividerItemDecoration"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        struct FieldID {
            
            static var HORIZONTAL: jfieldID?
            static var VERTICAL: jfieldID?
        }
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
        }
    }
}
