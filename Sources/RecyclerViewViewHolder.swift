//
//  RecyclerViewViewHolder.swift
//  Android
//
//  Created by Marco Estrella on 7/2/18.
//

import Foundation
import java_swift
import JNI

public extension Android.Widget {
    
    public typealias RecyclerViewViewHolder = AndroidWidgetRecyclerViewViewHolder
}

open class AndroidWidgetRecyclerViewViewHolder: JavaObject {
    
    public required init(javaObject: jobject?) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    /// Create a Swift-owned Java Object.
    public convenience init(itemView: Android.View.View) {
        
        self.init(javaObject: nil)
        
        let hasOldJavaObject = javaObject != nil
        
        var locals = [jobject]()
        
        var methodID: jmethodID?
        
        var args: [jvalue] = [self.swiftValue()]
        
        // returned objects are always local refs
        guard let __object: jobject = JNIMethod.NewObject(className: AndroidWidgetRecyclerViewViewHolder.JNICache.className,
                                                          classObject: AndroidWidgetRecyclerViewViewHolder.JNICache.jniClass,
                                                          methodSig: "(J)V",
                                                          methodCache: &methodID,
                                                          args: &args,
                                                          locals: &locals )
            
            else { fatalError("Could not initialize \(className)") }
        
        self.javaObject = __object // dereference old value, add global ref for new value
        
        JNI.DeleteLocalRef( __object ) // delete local ref
        
        /// Release old swift value.
        if hasOldJavaObject {
            
            try! finalize()
        }
    }
}

extension AndroidWidgetRecyclerViewViewHolder: JNIListener { }

fileprivate extension AndroidWidgetRecyclerViewViewHolder {
    
    /// JNI Cache
    struct JNICache {
        
        static let classSignature = SwiftSupport.Widget.className(["SwiftRecyclerViewAdapter"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
    }
}

