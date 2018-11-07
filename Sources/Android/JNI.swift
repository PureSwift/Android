//
//  JNI.swift
//  Android
//
//  Created by Alsey Coleman Miller on 3/22/18.
//

import Foundation
import JNI
import java_swift

// MARK: - JNINativeMethodEntry

internal protocol JNINativeMethodEntry {
    
    associatedtype Thunk
    
    static var name: String { get }
    
    static var signature: JNIMethodSignature { get }
    
    static var thunk: Thunk { get }
}

extension JNINativeMethodEntry {
    
    static var method: JNINativeMethod {
        
        return JNINativeMethod ( name: strdup(name),
                                 signature: strdup(signature.rawValue),
                                 fnPtr: unsafeBitCast( thunk, to: UnsafeMutableRawPointer.self ) )
    }
}

extension JNINativeMethod {
    
    static var finalize: JNINativeMethod {
        
        return JNINativeMethod(
            name: strdup("__finalize"),
            signature: strdup("(J)V"),
            fnPtr: unsafeBitCast( JNIReleasableProxy__finalize_thunk, to: UnsafeMutableRawPointer.self ) )
    }
}

// MARK: - JNIListener

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
    
    internal static func swiftObject(from pointer: jlong) -> Self? {
        
        return unsafeBitCast( recoverPointer( pointer ), to: Self.self )
    }
}

internal extension JNIListener where Self: JavaObject  {
    
    internal static func release(swiftObject: jlong) {
        
        let toRelease = unsafeBitCast( recoverPointer( swiftObject ), to: JavaObject.self )
        
        Unmanaged.passUnretained(toRelease).release()
    }
}
