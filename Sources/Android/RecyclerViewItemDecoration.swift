//
//  RecyclerViewItemDecoration.swift
//  Android
//
//  Created by Marco Estrella on 12/28/18.
//

import Foundation
import java_swift
import JNI

public extension AndroidWidgetRecyclerView {
    
    public typealias ItemDecoration = AndroidRecyclerViewItemDecoration
}

/* An ItemDecoration allows the application to add a special drawing and layout offset to specific item views from the adapter's data set.
 * This can be useful for drawing dividers between items, highlights, visual grouping boundaries and more.
 */
open class AndroidRecyclerViewItemDecoration: JavaObject {
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public convenience init() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __object = JNIMethod.NewObject(
            className: JNICacheItemDecorator.className,
            classCache: &JNICacheItemDecorator.jniClass,
            methodSig: "()V",
            methodCache: &JNICacheItemDecorator.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

internal extension AndroidRecyclerViewItemDecoration {
    
    /// JNI Cache
    struct JNICacheItemDecorator {
        
        static let classSignature = SupportV7.Widget.className(["RecyclerView$ItemDecoration"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_method_1: jmethodID?
        }
    }
}
