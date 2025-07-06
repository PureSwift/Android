//
//  LooperOptions.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if os(Android)
import Android
import AndroidNDK
#endif

public extension Looper {
    
    /// Looper Prepare Options
    struct PrepareOptions: OptionSet, Sendable {
        
        public typealias RawValue = Int
        
        public var rawValue: RawValue

        public init(rawValue: RawValue) {
            self.init(rawValue)
        }
        
        private init(_ raw: RawValue) {
            self.rawValue = raw
        }
    }
}

// MARK: - Constants

public extension Looper.PrepareOptions {
    
    /**
     * This looper will accept calls to ALooper_addFd() that do not
     * have a callback (that is provide NULL for the callback).  In
     * this case the caller of ALooper_pollOnce() or ALooper_pollAll()
     * MUST check the return from these functions to discover when
     * data is available on such fds and process it.
     */
    static var allowNonCallbacks: Looper.PrepareOptions { .init(ALOOPER_PREPARE_ALLOW_NON_CALLBACKS) }
}

// MARK: - CustomStringConvertible

extension Looper.PrepareOptions: CustomStringConvertible, CustomDebugStringConvertible {
    
    /// A textual representation of the binder object flags.
    @inline(never)
    public var description: String {
        let descriptions: [(Looper.PrepareOptions, StaticString)] = [
            (.allowNonCallbacks, ".allowNonCallbacks")
        ]
        return _buildDescription(descriptions)
    }

    /// A textual representation of the binder object flags, suitable for debugging.
    public var debugDescription: String { self.description }
}
