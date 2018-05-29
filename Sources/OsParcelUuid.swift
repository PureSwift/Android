//
//  OsParcelUuid.swift
//  Android
//
//  Created by Marco Estrella on 5/24/18.
//

import Foundation
import java_swift
import java_util

public extension Android.OS {
    
    public typealias ParcelUuid = AndroidOsParcelUuid
}

public final class AndroidOsParcelUuid: JavaObject {

    public convenience init?( casting object: java_swift.JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public convenience init( arg0: java_util.UUID ) {
        var __locals = [jobject]()
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava( value: arg0, locals: &__locals )
        
        let __object = JNIMethod.NewObject( className: JNICache.className,
                                            classCache: &JNICache.jniClass,
                                            methodSig: "(Ljava/util/UUID;)V",
                                            methodCache: &JNICache.MethodID.init_uuid,
                                            args: &__args, locals: &__locals )
        self.init( javaObject: __object )
        JNI.DeleteLocalRef( __object )
    }
    
    public class func fromString( arg0: String ) -> Android.OS.ParcelUuid? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        __args[0] = JNIType.toJava( value: arg0, locals: &__locals )
        
        let __return = JNIMethod.CallStaticObjectMethod( className: JNICache.className,
                                                         classCache: &JNICache.jniClass,
                                                         methodName: "fromString",
                                                         methodSig: "(Ljava/lang/String;)Landroid/os/ParcelUuid;",
                                                         methodCache: &JNICache.MethodID.fromString,
                                                         args: &__args, locals: &__locals )
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? Android.OS.ParcelUuid( javaObject: __return ) : nil
    }
    
    public func getUuid() -> java_util.UUID? {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        
        let __return = JNIMethod.CallObjectMethod( object: javaObject,
                                                   methodName: "getUuid",
                                                   methodSig: "()Ljava/util/UUID;",
                                                   methodCache: &JNICache.MethodID.getUuid,
                                                   args: &__args, locals: &__locals )
        defer { JNI.DeleteLocalRef( __return ) }
        return __return != nil ? java_util.UUID( javaObject: __return ) : nil
    }
}

// MARK: - JNI

private extension Android.OS.ParcelUuid {
    
    /// JNI Cache
    struct JNICache {
        
        /// JNI Java class name
        static let className = "android/os/ParcelUuid"
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Field ID cache
        struct FieldID {
            
            static var PHY_LE_1M: jfieldID?
        }
        
        /// JNI Method ID cache
        struct MethodID {
            
            static var init_uuid: jmethodID?
            static var fromString: jmethodID?
            static var getUuid: jmethodID?
            static var toString: jmethodID?
        }
    }
}
