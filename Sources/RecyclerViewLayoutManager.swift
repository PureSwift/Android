//
//  RecyclerViewLayoutManager.swift
//  Android
//
//  Created by Marco Estrella on 7/3/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Widget.RecyclerView {
    
    public typealias LayoutManager = AndroidWidgetRecyclerViewLayoutManager
}

/**
 * A LayoutManager is responsible for measuring and positioning item views within a RecyclerView as well as
 * determining the policy for when to recycle item views that are no longer visible to the user. By changing
 * the LayoutManager a RecyclerView can be used to implement a standard vertically scrolling list, a uniform grid,
 * staggered grids, horizontally scrolling collections and more. Several stock layout managers are provided for general use.
 *
 * If the LayoutManager specifies a default constructor or one with the signature (Context, AttributeSet, int, int),
 * RecyclerView will instantiate and set the LayoutManager when being inflated. Most used properties can be then obtained
 * from getProperties(Context, AttributeSet, int, int). In case a LayoutManager specifies both constructors, the non-default constructor will take precedence.
 */
open class AndroidWidgetRecyclerViewLayoutManager: JavaObject {
    
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
            className: LayoutManagerJNICache.className,
            classCache: &LayoutManagerJNICache.jniClass,
            methodSig: "()V",
            methodCache: &LayoutManagerJNICache.MethodID.init_method_1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

internal extension AndroidWidgetRecyclerViewLayoutManager {
    
    /// JNI Cache
    struct LayoutManagerJNICache {
        
        static let classSignature = SupportV7.Widget.className(["RecyclerView$LayoutManager"])
        
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
