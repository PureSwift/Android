//
//  Syscalls.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 6/14/25.
//

#if !os(Android)
/// __android_log_write(int prio, const char *tag, const char *text)
internal func __android_log_write(_ priority: CInt, _ tag: UnsafePointer<CChar>?, _ text: UnsafePointer<CChar>?) -> CInt {
    fatalError("Shim")
}
#endif
