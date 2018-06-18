//
//  AndroidContext.swift
//  PureSwift
//
//  Created by Alsey Coleman Miller on 3/20/18.
//

import Foundation
import java_swift
import java_util

public extension Android.Content {
    
    public typealias Context = AndroidContext
}

open class AndroidContext: JavaObject {
    
    private static let javaClassName = "android/content/Context"
    
    private static var JNIClass: jclass?
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString = #file,
                              _ line: Int = #line ) {
        
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    private static var getSystemService_MethodID: jmethodID?
    
    public func systemService <T> (_ service: T.Type) -> T? where T: JavaObject, T: Android.Content.Context.SystemService {
        
        let serviceName = service.systemServiceName.rawValue
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1)
        
        __args[0] = JNIType.toJava( value: serviceName, locals: &__locals )
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getSystemService",
                                                  methodSig: "(Ljava/lang/String;)Ljava/lang/Object",
                                                  methodCache: &AndroidContext.getSystemService_MethodID,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef( __return ) }
        
        return __return != nil ? T( javaObject: __return ) : nil
    }
    
    private static var BLUETOOTH_SERVICE_FieldID: jfieldID?
    
    internal static var bluetoothService: String? {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "BLUETOOTH_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &BLUETOOTH_SERVICE_FieldID,
                className: javaClassName,
                classCache: &JNIClass )
            
            defer { JNI.DeleteLocalRef( __value ) }
            
            return __value != nil ? String( javaObject: __value ) : nil
        }
    }
    
    private static var LAYOUT_INFLATER_SERVICE_FieldID: jfieldID?
    
    internal static var layoutInflaterService: String? {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "LAYOUT_INFLATER_SERVICE",
                fieldType: "Ljava/lang/String;",
                fieldCache: &LAYOUT_INFLATER_SERVICE_FieldID,
                className: javaClassName,
                classCache: &JNIClass )
            
            defer { JNI.DeleteLocalRef( __value ) }
            
            return __value != nil ? String( javaObject: __value ) : nil
        }
    }
}
