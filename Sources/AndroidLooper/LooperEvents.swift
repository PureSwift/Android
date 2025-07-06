//
//  LooperEvents.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if os(Android)
import Android
import AndroidNDK
#endif

public extension Looper {
    
    /**
     * Flags for file descriptor events that a looper can monitor.
     *
     * These flag bits can be combined to monitor multiple events at once.
     */
    struct Events: OptionSet, Sendable {
        
        public typealias RawValue = CInt
        
        public var rawValue: RawValue

        public init(rawValue: RawValue) {
            self.rawValue = rawValue
        }
        
        private init(_ raw: RawValue) {
            self.rawValue = raw
        }
    }
}

// MARK: - Constants

public extension Looper.Events {
    
    /**
     * The file descriptor is available for read operations.
     */
    static var input: Looper.Events { .init(ALOOPER_EVENT_INPUT) }
    
    /**
     * The file descriptor is available for write operations.
     */
    static var output: Looper.Events { .init(ALOOPER_EVENT_OUTPUT) }
    
    /**
     * The file descriptor has encountered an error condition.
     *
     * The looper always sends notifications about errors; it is not necessary
     * to specify this event flag in the requested event set.
     */
    static var error: Looper.Events { .init(ALOOPER_EVENT_ERROR) }
    
    /**
     * The file descriptor was hung up.
     * For example, indicates that the remote end of a pipe or socket was closed.
     *
     * The looper always sends notifications about hangups; it is not necessary
     * to specify this event flag in the requested event set.
     */
    static var hangup: Looper.Events { .init(ALOOPER_EVENT_HANGUP)}
    
    /**
     * The file descriptor is invalid.
     * For example, the file descriptor was closed prematurely.
     *
     * The looper always sends notifications about invalid file descriptors; it is not necessary
     * to specify this event flag in the requested event set.
     */
    static var invalid: Looper.Events { .init(ALOOPER_EVENT_INVALID) }
}

// MARK: - CustomStringConvertible

extension Looper.Events: CustomStringConvertible, CustomDebugStringConvertible {
    
    /// A textual representation of the binder object flags.
    @inline(never)
    public var description: String {
        let descriptions: [(Looper.Events, StaticString)] = [
            (.input, ".input"),
            (.output, ".output"),
            (.error, ".error"),
            (.hangup, ".hangup"),
            (.invalid, ".invalid")
        ]
        return _buildDescription(descriptions)
    }

    /// A textual representation of the binder object flags, suitable for debugging.
    public var debugDescription: String { self.description }
}
