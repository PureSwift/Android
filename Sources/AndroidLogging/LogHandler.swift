//
//  LogHandler.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 6/14/25.
//

#if os(Android)
import Android
#endif

#if canImport(Logging)
import Logging

public struct AndroidLogHandler: LogHandler {
    
    public var logLevel: Logger.Level = .info
    public var metadataProvider: Logger.MetadataProvider?

    public enum TagSource: Sendable {
        case label
        case source
    }

    private let label: String
    private let tagSource: TagSource

  @Sendable
  public static func taggedByLabel(
    label: String
  ) -> AndroidLogHandler {
    AndroidLogHandler(
      label: label,
      tagSource: .label,
      metadataProvider: LoggingSystem.metadataProvider
    )
  }

  @Sendable
  public static func taggedByLabel(
    label: String,
    metadataProvider: Logger.MetadataProvider?
  ) -> AndroidLogHandler {
    AndroidLogHandler(label: label, tagSource: .label, metadataProvider: metadataProvider)
  }

  @Sendable
  public static func taggedBySource(
    label: String
  ) -> AndroidLogHandler {
    AndroidLogHandler(
      label: label,
      tagSource: .source,
      metadataProvider: LoggingSystem.metadataProvider
    )
  }

  @Sendable
  public static func taggedBySource(
    label: String,
    metadataProvider: Logger.MetadataProvider?
  ) -> AndroidLogHandler {
    AndroidLogHandler(label: label, tagSource: .source, metadataProvider: metadataProvider)
  }

  @Sendable
  init(
    label: String,
    tagSource: TagSource = .label,
    metadataProvider: Logger.MetadataProvider? = nil
  ) {
    self.label = label
    self.metadataProvider = metadataProvider
    self.tagSource = tagSource
  }

  public func log(
    level: Logger.Level,
    message: Logger.Message,
    metadata: Logger.Metadata?,
    source: String,
    file: String,
    function: String,
    line: UInt
  ) {
    var text = "\(prettyMetadata.map { "\($0) " } ?? "")"

    if tagSource == .label {
      text += "[\(source)] "
    }

    text += "\(message)"
      
      #if os(Android)
      let androidLogPriority = CInt(level.androidLogPriority.rawValue)
      #else
      let androidLogPriority: CInt = .min
      #endif

    _ = __android_log_write(
        androidLogPriority,
      tagSource == .label ? label : source,
      text
    )
  }

  private var prettyMetadata: String?
  public var metadata = Logger.Metadata() {
    didSet {
      prettyMetadata = prettify(metadata)
    }
  }

  private func prettify(_ metadata: Logger.Metadata) -> String? {
    if metadata.isEmpty {
      return nil
    } else {
      return metadata.lazy.sorted(by: { $0.key < $1.key }).map { "\($0)=\($1)" }
        .joined(separator: " ")
    }
  }

  public subscript(metadataKey metadataKey: String) -> Logger.Metadata.Value? {
    get {
      metadata[metadataKey]
    }
    set(newValue) {
      metadata[metadataKey] = newValue
    }
  }
}

extension Logger.Level {
    
    var priority: LogPriority {
        switch self {
        case .trace:
            return .verbose
        case .debug:
            return .debug
        case .info:
            return .info
        case .notice:
            return .info
        case .warning:
            return .warning
        case .error:
            return .error
        case .critical:
            return .fatal
        }
    }
}

#if os(Android)
private extension Logger.Level {
    
    var androidLogPriority: CLogPriority {
        .init(priority)
    }
}
#endif

#endif
