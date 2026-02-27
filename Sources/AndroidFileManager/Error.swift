//
//  Error.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 2/27/26.
//

/// Android file manager error.
public enum AndroidFileManagerError: Swift.Error, Equatable, Sendable {

    /// Unable to initialize an `AConfiguration` instance.
    case invalidConfiguration

    /// Unable to initialize an `AStorageManager` instance.
    case invalidStorageManager

    /// Unable to open asset at the specified path.
    case openAsset(String)

    /// Error reading asset bytes (result code).
    case readAsset(Int32)

    /// Error seeking within asset (result code).
    case seekAsset(Int64)

    /// Error mounting OBB file (result code).
    case mountObb(Int32)

    /// Error unmounting OBB file (result code).
    case unmountObb(Int32)
}
