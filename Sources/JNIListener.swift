//
//  JNIListener.swift
//  Android
//
//  Created by Marco Estrella on 6/27/18.
//

import Foundation
import java_swift
import JNI

internal protocol JNIListener: class, JavaProtocol { }

internal extension JNIListener {
    
    static fileprivate func recoverPointer( _ swiftObject: jlong, _ file: StaticString = #file, _ line: Int = #line ) -> uintptr_t {
        #if os(Android)
        let swiftPointer = uintptr_t(swiftObject&0xffffffff)
        #else
        let swiftPointer = uintptr_t(swiftObject)
        #endif
        if swiftPointer == 0 {
            JNI.report( "Race condition setting swiftObject on Java Proxy. More thought required...", file, line )
        }
        return swiftPointer
    }
    
    internal func swiftValue() -> jvalue {
        return jvalue( j: jlong(unsafeBitCast(Unmanaged.passRetained(self), to: uintptr_t.self)) )
    }
    
    internal func takeOwnership( javaObject: jobject?, _ file: StaticString = #file, _ line: Int = #line ) {
        
        guard javaObject != nil else { return }
        var locals = [jobject]()
        var fieldID: jfieldID?
        
        let existing: jlong = JNIField.GetLongField( fieldName: "__swiftObject", fieldType: "J", fieldCache: &fieldID,
                                                     object: javaObject, file, line )
        
        // get retained pointer
        let swiftValue = self.swiftValue().j
        
        // store pointer in Java property
        JNIField.SetLongField( fieldName: "__swiftObject", fieldType: "J", fieldCache: &fieldID,
                               object: javaObject, value: swiftValue, locals: &locals, file, line )
        
        // release old instance (if any)
        if existing != 0 {
            JNIReleasableProxy.canrelease( swiftObject: existing )
        }
    }
    
    internal static func swiftObject( jniEnv: UnsafeMutablePointer<JNIEnv?>?, javaObject: jobject?, swiftObject: jlong ) -> Self? {
        
        return unsafeBitCast( recoverPointer( swiftObject ), to: Self.self )
    }
}

internal extension JNIListener where Self: JavaObject  {
    
    internal static func release(swiftObject: jlong) {
        
        let toRelease = unsafeBitCast( recoverPointer( swiftObject ), to: JavaObject.self )
        
        Unmanaged.passUnretained(toRelease).release()
    }
}
