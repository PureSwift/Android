//
//  Exception.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

/**
 * Top level exceptions types for Android binder errors, mapping to Java
 * exceptions. Also see Parcel.java.
 */
public enum Exception: Int32, Sendable, CaseIterable {
    
    /// SecurityException
    case security = -1

    /// BadParcelableException
    case badParcelable = -2

    /// IllegalArgumentException
    case illegalArgument = -3

    /// NullPointerException
    case nullPointer = -4

    /// IllegalStateException
    case illegalState = -5

    /// NetworkOnMainThreadException
    case networkMainThread = -6

    /// UnsupportedOperationException
    case unsupportedOperation = -7

    /// Service-specific exception.
    case serviceSpecific = -8

    /// ParcelableException
    case parcelable = -9

    /**
     * Special value indicating that the transaction
     * has failed at a low level on native binder proxies.
     */
    case transactionFailed = -129
}
