//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift Logging API open source project
//
// Copyright (c) 2018-2019 Apple Inc. and the Swift Logging API project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of Swift Logging API project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

#if os(Android)
import Android
#endif
import SystemPackage

/// Android Logger
public struct AndroidLogger: Equatable, Hashable, Sendable {
    
    public let tag: Tag
    
    public let priority: LogPriority
    
    public init(
        tag: Tag,
        priority: LogPriority = .info
    ) {
        self.tag = tag
        self.priority = priority
    }
    
    /// Writes the text to the log, with priority and tag.
    public func log(_ message: String) throws(SystemPackage.Errno) {
        try log(message).get()
    }
    
    internal func log(_ message: String) -> Result<Void, SystemPackage.Errno> {
        let priority = CLogPriority(priority)
        let tag = tag.rawValue
        let result = message.withCString { messageCString in
            tag.withCString { tagCString in
                __android_log_write(
                   priority,
                   tagCString,
                   messageCString
                )
            }
        }
        // 1 if the message was written to the log, or -EPERM if it was not; see __android_log_is_loggable().
        guard result == 1 else {
            let error = Errno(rawValue: result)
            return .failure(error)
        }
        return .success(())
    }
}

public extension AndroidLogger {
    
    typealias Priority = LogPriority
    
    typealias Tag = LogTag
}
