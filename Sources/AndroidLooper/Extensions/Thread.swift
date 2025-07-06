//
//  Thread.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

import Foundation

public extension Thread {
    
    /**
     * Prepares a looper associated with the calling thread, and returns it.
     * If the thread already has a looper, it is returned.  Otherwise, a new
     * one is created, associated with the thread, and returned.
     *
     * The opts may be `ALOOPER_PREPARE_ALLOW_NON_CALLBACKS` or 0.
     */
    static func withLooper<T, E>(
        options: Looper.PrepareOptions = [],
        _ body: (borrowing Looper) throws(E) -> T
    ) throws(E) -> T {
        try Looper.currentThread(options: options, body)
    }
}
