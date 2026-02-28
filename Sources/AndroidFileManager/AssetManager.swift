//
//  AssetManager.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 2/27/26.
//

#if os(Android)
import Android
import CAndroidNDK
#endif

/// Wrapper around Android `AAssetManager`.
public struct AssetManager: @unchecked Sendable {

    internal let pointer: OpaquePointer

    /// Creates a manager from an existing native pointer.
    public init(_ pointer: OpaquePointer) {
        self.pointer = pointer
    }
}

// MARK: - Methods

public extension AssetManager {

    /// Opens an asset by path.
    ///
    /// - Parameters:
    ///   - path: Relative path under the APK `assets/` directory.
    ///   - mode: Access hint for Android's asset backend.
    func open(_ path: String, mode: AssetMode = .streaming) throws(AndroidFileManagerError) -> Asset {
        guard let pointer = path.withCString({
            AAssetManager_open(pointer, $0, mode.rawValue)
        }) else {
            throw .openAsset(path)
        }
        return Asset(pointer)
    }
}

// MARK: - Supporting Types

public extension AssetManager {

    /// `AAssetManager_open` mode flags.
    enum AssetMode: Int32, Sendable {
        case unknown = 0
        case random = 1
        case streaming = 2
        case buffer = 3
    }
}

