//
//  Error.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

import SystemPackage

/// Android Looper Error
public enum AndroidLooperError: Swift.Error {
    
    /// Underlying Bionic Error
    case bionic(Errno)
    
    case addFileDescriptor(FileDescriptor)
    
    /// Unable to remove the file descriptor.
    case removeFileDescriptor(FileDescriptor)
    
    /// File Descriptor not registered
    case fileDescriptorNotRegistered(FileDescriptor)
    
    /// Poll Timeout
    case pollTimeout
    
    /// Poll Error
    case pollError
}
