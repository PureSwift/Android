//
//  UtilSparseArray.swift
//  Android
//
//  Created by Marco Estrella on 5/27/18.
//

import Foundation
import java_swift
import java_util

public extension Android.Util {
    
    public typealias SparseArray = AndroidSparseArray
}

/**
 * Advertise data packet container for Bluetooth LE advertising. This represents the data to be advertised as well as
 * the scan response data for active scans.
 *
 * Use AdvertiseData.Builder to create an instance of AdvertiseData to be advertised.
 */
public final class AndroidSparseArray: JavaObject {
    
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
    
    /**
     * Creates a new SparseArray containing no mappings
     */
    public convenience init() {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __object = JNIMethod.NewObject( className: JNICache.className,
                                            classCache: &JNICache.jniClass,
                                            methodSig: "()V",
                                            methodCache: &JNICache.MethodID.init_no_arguments,
                                            args: &__args,
                                            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }

    /**
     * Creates a new SparseArray containing no mappings that will not require any additional memory allocation to store the specified number of mappings.
     */
    public convenience init(initialCapacity : Int) {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = jvalue( i: jint(initialCapacity) )
        
        let __object = JNIMethod.NewObject( className: JNICache.className,
                                            classCache: &JNICache.jniClass,
                                            methodSig: "(I)V",
                                            methodCache: &JNICache.MethodID.init_initial_capacity,
                                            args: &__args,
                                            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

// MARK: - JNI

private extension Android.Util.SparseArray {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/util/SparseArray"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_no_arguments: jmethodID?
            static var init_initial_capacity: jmethodID?
            static var fromString: jmethodID?
            static var getUuid: jmethodID?
            static var toString: jmethodID?
        }
    }
}

