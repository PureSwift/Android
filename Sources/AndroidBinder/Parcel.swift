//
//  AndroidParcel.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

#if canImport(Android)
import Android
import CAndroidNDK
#endif
import Binder

// MARK: - Parcel

/**
 * Android Binder Parcel
 *
 * This object represents a package of data that can be sent between processes. When transacting, an
 * instance of it is automatically created to be used for the transaction. When two processes use
 * binder to communicate, they must agree on a format of this parcel to be used in order to transfer
 * data. This is usually done in an IDL (see AIDL, specifically).
 */
public struct Parcel: ~Copyable {

    internal let handle: Handle

    internal init(handle: Handle) {
        self.handle = handle
    }

    deinit {
        handle.delete()
    }
}

// MARK: - Initialization

public extension Parcel {

    /// Directly initialize from a pointer.
    init(_ pointer: OpaquePointer) {
        self.handle = .init(pointer)
    }

    /**
     * Creates a parcel.
     *
     * Available since API level 31.
     *
     * \return A parcel which is not related to any IBinder objects.
     */
    @available(Android 31, *)
    init() {
        self.handle = .create()
    }
}

// MARK: - Properties

public extension Parcel {

    /**
     * Gets the current position within the parcel.
     *
     * Available since API level 29.
     */
    var dataPosition: Int {
        Int(handle.dataPosition)
    }

    /**
     * Returns the total amount of data contained in the parcel.
     *
     * Available since API level 31.
     */
    @available(Android 31, *)
    var dataSize: Int {
        Int(handle.dataSize)
    }
}

// MARK: - Methods

public extension Parcel {

    /// Access the underlying opaque pointer.
    func withUnsafePointer<E, Result>(_ body: (OpaquePointer) throws(E) -> Result) throws(E) -> Result where E: Error {
        try body(handle.pointer)
    }

    /**
     * Sets the position within the parcel.
     *
     * This must be called with a position that has been previously returned from
     * AParcel_getDataPosition. If writes are made after setting the data position, they must
     * be made in the exact same sequence used before resetting data position. Writing over
     * objects such as binders or file descriptors is not supported.
     *
     * Available since API level 29.
     */
    func setDataPosition(_ position: Int) throws(AndroidBinderError) {
        try handle.setDataPosition(Int32(position)).get()
    }

    /**
     * Resets the parcel to its initial state.
     *
     * Available since API level 31.
     */
    @available(Android 31, *)
    func reset() throws(AndroidBinderError) {
        try handle.reset().get()
    }

    /**
     * Appends all data from another parcel into this parcel.
     *
     * Available since API level 31.
     *
     * \param other the parcel to read from.
     * \param start starting position in \p other (must be a value from getDataPosition).
     * \param size number of bytes to copy from \p other.
     */
    @available(Android 31, *)
    func appendContents(of other: borrowing Parcel, start: Int = 0, size: Int) throws(AndroidBinderError) {
        try handle.appendFrom(other.handle, start: Int32(start), size: Int32(size)).get()
    }

    /**
     * Marshals the parcel data into a byte buffer.
     *
     * Available since API level 33.
     *
     * \param start starting position in this parcel.
     * \param length number of bytes to marshal, or nil to marshal from \p start to end.
     * \return the marshaled bytes.
     */
    @available(Android 33, *)
    func marshal(start: Int = 0, length: Int? = nil) throws(AndroidBinderError) -> [UInt8] {
        let len = length ?? (dataSize - start)
        var buffer = [UInt8](repeating: 0, count: len)
        if let base = buffer.withUnsafeMutableBufferPointer({ $0.baseAddress }) {
            try handle.marshal(into: base, start: start, length: len).get()
        }
        return buffer
    }

    /**
     * Unmarshals the parcel from a byte buffer.
     *
     * Available since API level 33.
     *
     * \param data the bytes to unmarshal.
     */
    @available(Android 33, *)
    func unmarshal(_ data: [UInt8]) throws(AndroidBinderError) {
        if let base = data.withUnsafeBufferPointer({ $0.baseAddress }) {
            try handle.unmarshal(base, length: data.count).get()
        }
    }
}

// MARK: - Write Methods

public extension Parcel {

    /**
     * Writes an Int32 value to the parcel.
     *
     * Available since API level 29.
     */
    func writeInt32(_ value: Int32) throws(AndroidBinderError) {
        try handle.writeInt32(value).get()
    }

    /**
     * Writes a UInt32 value to the parcel.
     *
     * Available since API level 29.
     */
    func writeUInt32(_ value: UInt32) throws(AndroidBinderError) {
        try handle.writeUInt32(value).get()
    }

    /**
     * Writes an Int64 value to the parcel.
     *
     * Available since API level 29.
     */
    func writeInt64(_ value: Int64) throws(AndroidBinderError) {
        try handle.writeInt64(value).get()
    }

    /**
     * Writes a UInt64 value to the parcel.
     *
     * Available since API level 29.
     */
    func writeUInt64(_ value: UInt64) throws(AndroidBinderError) {
        try handle.writeUInt64(value).get()
    }

    /**
     * Writes a Bool value to the parcel.
     *
     * Available since API level 29.
     */
    func writeBool(_ value: Bool) throws(AndroidBinderError) {
        try handle.writeBool(value).get()
    }

    /**
     * Writes a Float value to the parcel.
     *
     * Available since API level 29.
     */
    func writeFloat(_ value: Float) throws(AndroidBinderError) {
        try handle.writeFloat(value).get()
    }

    /**
     * Writes a Double value to the parcel.
     *
     * Available since API level 29.
     */
    func writeDouble(_ value: Double) throws(AndroidBinderError) {
        try handle.writeDouble(value).get()
    }

    /**
     * Writes a char16_t value to the parcel.
     *
     * Available since API level 29.
     */
    func writeChar(_ value: UInt16) throws(AndroidBinderError) {
        try handle.writeChar(value).get()
    }

    /**
     * Writes an int8_t (byte) value to the parcel.
     *
     * Available since API level 29.
     */
    func writeByte(_ value: Int8) throws(AndroidBinderError) {
        try handle.writeByte(value).get()
    }

    /**
     * Writes a String to the parcel encoded as UTF-8.
     *
     * Available since API level 29.
     */
    func writeString(_ value: String) throws(AndroidBinderError) {
        try handle.writeString(value).get()
    }

    /**
     * Writes an AIBinder (strong binder reference) to the parcel.
     *
     * Available since API level 29.
     *
     * \param binder the binder to write, or nil for a null binder.
     */
    func writeStrongBinder(_ binder: AndroidBinder?) throws(AndroidBinderError) {
        try handle.writeStrongBinder(binder).get()
    }

    /**
     * Writes a file descriptor to the parcel.
     *
     * This duplicates the fd when writing, so the caller retains ownership.
     *
     * Available since API level 29.
     *
     * \param fd the file descriptor to write, or -1 for a null file descriptor.
     */
    func writeFileDescriptor(_ fd: Int32) throws(AndroidBinderError) {
        try handle.writeFileDescriptor(fd).get()
    }

    /**
     * Writes an AStatus as the status header of a reply parcel.
     *
     * Available since API level 29.
     */
    func writeStatusHeader(_ status: borrowing Status) throws(AndroidBinderError) {
        try handle.writeStatusHeader(status).get()
    }

    /**
     * Writes a nullable Int8 array to the parcel.
     *
     * Available since API level 29.
     *
     * \param values the array to write, or nil to write a null array.
     */
    func writeByteArray(_ values: [Int8]?) throws(AndroidBinderError) {
        try handle.writeByteArray(values).get()
    }

    /**
     * Writes a nullable Int32 array to the parcel.
     *
     * Available since API level 29.
     */
    func writeInt32Array(_ values: [Int32]?) throws(AndroidBinderError) {
        try handle.writeInt32Array(values).get()
    }

    /**
     * Writes a nullable UInt32 array to the parcel.
     *
     * Available since API level 29.
     */
    func writeUInt32Array(_ values: [UInt32]?) throws(AndroidBinderError) {
        try handle.writeUInt32Array(values).get()
    }

    /**
     * Writes a nullable Int64 array to the parcel.
     *
     * Available since API level 29.
     */
    func writeInt64Array(_ values: [Int64]?) throws(AndroidBinderError) {
        try handle.writeInt64Array(values).get()
    }

    /**
     * Writes a nullable UInt64 array to the parcel.
     *
     * Available since API level 29.
     */
    func writeUInt64Array(_ values: [UInt64]?) throws(AndroidBinderError) {
        try handle.writeUInt64Array(values).get()
    }

    /**
     * Writes a nullable Float array to the parcel.
     *
     * Available since API level 29.
     */
    func writeFloatArray(_ values: [Float]?) throws(AndroidBinderError) {
        try handle.writeFloatArray(values).get()
    }

    /**
     * Writes a nullable Double array to the parcel.
     *
     * Available since API level 29.
     */
    func writeDoubleArray(_ values: [Double]?) throws(AndroidBinderError) {
        try handle.writeDoubleArray(values).get()
    }

    /**
     * Writes a nullable char16_t array to the parcel.
     *
     * Available since API level 29.
     */
    func writeCharArray(_ values: [UInt16]?) throws(AndroidBinderError) {
        try handle.writeCharArray(values).get()
    }

    /**
     * Writes a nullable Bool array to the parcel.
     *
     * Available since API level 29.
     */
    func writeBoolArray(_ values: [Bool]?) throws(AndroidBinderError) {
        try handle.writeBoolArray(values).get()
    }
}

// MARK: - Read Methods

public extension Parcel {

    /**
     * Reads an Int32 value from the parcel.
     *
     * Available since API level 29.
     */
    func readInt32() throws(AndroidBinderError) -> Int32 {
        try handle.readInt32().get()
    }

    /**
     * Reads a UInt32 value from the parcel.
     *
     * Available since API level 29.
     */
    func readUInt32() throws(AndroidBinderError) -> UInt32 {
        try handle.readUInt32().get()
    }

    /**
     * Reads an Int64 value from the parcel.
     *
     * Available since API level 29.
     */
    func readInt64() throws(AndroidBinderError) -> Int64 {
        try handle.readInt64().get()
    }

    /**
     * Reads a UInt64 value from the parcel.
     *
     * Available since API level 29.
     */
    func readUInt64() throws(AndroidBinderError) -> UInt64 {
        try handle.readUInt64().get()
    }

    /**
     * Reads a Bool value from the parcel.
     *
     * Available since API level 29.
     */
    func readBool() throws(AndroidBinderError) -> Bool {
        try handle.readBool().get()
    }

    /**
     * Reads a Float value from the parcel.
     *
     * Available since API level 29.
     */
    func readFloat() throws(AndroidBinderError) -> Float {
        try handle.readFloat().get()
    }

    /**
     * Reads a Double value from the parcel.
     *
     * Available since API level 29.
     */
    func readDouble() throws(AndroidBinderError) -> Double {
        try handle.readDouble().get()
    }

    /**
     * Reads a char16_t value from the parcel.
     *
     * Available since API level 29.
     */
    func readChar() throws(AndroidBinderError) -> UInt16 {
        try handle.readChar().get()
    }

    /**
     * Reads an int8_t (byte) value from the parcel.
     *
     * Available since API level 29.
     */
    func readByte() throws(AndroidBinderError) -> Int8 {
        try handle.readByte().get()
    }

    /**
     * Reads a UTF-8 String from the parcel.
     *
     * Available since API level 29.
     */
    func readString() throws(AndroidBinderError) -> String {
        try handle.readString().get()
    }

    /**
     * Reads an AIBinder (strong binder reference) from the parcel.
     *
     * The returned binder has a +1 strong reference that the caller owns.
     *
     * Available since API level 29.
     */
    func readStrongBinder() throws(AndroidBinderError) -> AndroidBinder {
        try handle.readStrongBinder().get()
    }

    /**
     * Reads a file descriptor from the parcel.
     *
     * The caller owns the returned fd and is responsible for closing it.
     *
     * Available since API level 29.
     *
     * \return the file descriptor, or -1 if a null file descriptor was written.
     */
    func readFileDescriptor() throws(AndroidBinderError) -> Int32 {
        try handle.readFileDescriptor().get()
    }

    /**
     * Reads the status header from a reply parcel.
     *
     * Available since API level 29.
     */
    func readStatusHeader() throws(AndroidBinderError) -> Status {
        try handle.readStatusHeader().get()
    }

    /**
     * Reads a nullable Int8 array from the parcel.
     *
     * Available since API level 29.
     *
     * \return the array, or nil if a null array was written.
     */
    func readByteArray() throws(AndroidBinderError) -> [Int8]? {
        try handle.readByteArray().get()
    }

    /**
     * Reads a nullable Int32 array from the parcel.
     *
     * Available since API level 29.
     */
    func readInt32Array() throws(AndroidBinderError) -> [Int32]? {
        try handle.readInt32Array().get()
    }

    /**
     * Reads a nullable UInt32 array from the parcel.
     *
     * Available since API level 29.
     */
    func readUInt32Array() throws(AndroidBinderError) -> [UInt32]? {
        try handle.readUInt32Array().get()
    }

    /**
     * Reads a nullable Int64 array from the parcel.
     *
     * Available since API level 29.
     */
    func readInt64Array() throws(AndroidBinderError) -> [Int64]? {
        try handle.readInt64Array().get()
    }

    /**
     * Reads a nullable UInt64 array from the parcel.
     *
     * Available since API level 29.
     */
    func readUInt64Array() throws(AndroidBinderError) -> [UInt64]? {
        try handle.readUInt64Array().get()
    }

    /**
     * Reads a nullable Float array from the parcel.
     *
     * Available since API level 29.
     */
    func readFloatArray() throws(AndroidBinderError) -> [Float]? {
        try handle.readFloatArray().get()
    }

    /**
     * Reads a nullable Double array from the parcel.
     *
     * Available since API level 29.
     */
    func readDoubleArray() throws(AndroidBinderError) -> [Double]? {
        try handle.readDoubleArray().get()
    }

    /**
     * Reads a nullable char16_t array from the parcel.
     *
     * Available since API level 29.
     */
    func readCharArray() throws(AndroidBinderError) -> [UInt16]? {
        try handle.readCharArray().get()
    }

    /**
     * Reads a nullable Bool array from the parcel.
     *
     * Available since API level 29.
     */
    func readBoolArray() throws(AndroidBinderError) -> [Bool]? {
        try handle.readBoolArray().get()
    }
}

// MARK: - Supporting Types

internal extension Parcel {

    struct Handle {

        let pointer: OpaquePointer

        init(_ pointer: OpaquePointer) {
            self.pointer = pointer
        }
    }
}

// MARK: - Handle: Lifecycle

internal extension Parcel.Handle {

    /**
     * Creates a parcel.
     *
     * Available since API level 31.
     */
    @available(Android 31, *)
    static func create() -> Parcel.Handle {
        guard let pointer = AParcel_create() else {
            fatalError("Unable to initialize \(Self.self) \(#function)")
        }
        return Parcel.Handle(pointer)
    }

    /**
     * Cleans up a parcel.
     *
     * Available since API level 29.
     */
    func delete() {
        AParcel_delete(pointer)
    }
}

// MARK: - Handle: Position & Size

internal extension Parcel.Handle {

    /**
     * Gets the current position within the parcel.
     *
     * Available since API level 29.
     */
    var dataPosition: Int32 {
        AParcel_getDataPosition(pointer)
    }

    /**
     * Returns the total amount of data contained in the parcel.
     *
     * Available since API level 31.
     */
    @available(Android 31, *)
    var dataSize: Int32 {
        AParcel_getDataSize(pointer)
    }

    /**
     * Sets the position within the parcel.
     *
     * Available since API level 29.
     */
    func setDataPosition(_ position: Int32) -> Result<Void, AndroidBinderError> {
        AParcel_setDataPosition(pointer, position).mapError()
    }

    /**
     * Resets the parcel to its initial state.
     *
     * Available since API level 31.
     */
    @available(Android 31, *)
    func reset() -> Result<Void, AndroidBinderError> {
        AParcel_reset(pointer).mapError()
    }

    /**
     * Appends data from `from` into this parcel.
     *
     * Available since API level 31.
     */
    @available(Android 31, *)
    func appendFrom(_ from: Parcel.Handle, start: Int32, size: Int32) -> Result<Void, AndroidBinderError> {
        AParcel_appendFrom(from.pointer, pointer, start, size).mapError()
    }

    /**
     * Marshals the parcel data into a buffer.
     *
     * Available since API level 33.
     */
    @available(Android 33, *)
    func marshal(into buffer: UnsafeMutablePointer<UInt8>, start: Int, length: Int) -> Result<Void, AndroidBinderError> {
        AParcel_marshal(pointer, buffer, start, length).mapError()
    }

    /**
     * Unmarshals the parcel from a buffer.
     *
     * Available since API level 33.
     */
    @available(Android 33, *)
    func unmarshal(_ data: UnsafePointer<UInt8>, length: Int) -> Result<Void, AndroidBinderError> {
        AParcel_unmarshal(pointer, data, length).mapError()
    }
}

// MARK: - Handle: Scalar Writes

internal extension Parcel.Handle {

    func writeInt32(_ value: Int32) -> Result<Void, AndroidBinderError> {
        AParcel_writeInt32(pointer, value).mapError()
    }

    func writeUInt32(_ value: UInt32) -> Result<Void, AndroidBinderError> {
        AParcel_writeUint32(pointer, value).mapError()
    }

    func writeInt64(_ value: Int64) -> Result<Void, AndroidBinderError> {
        AParcel_writeInt64(pointer, value).mapError()
    }

    func writeUInt64(_ value: UInt64) -> Result<Void, AndroidBinderError> {
        AParcel_writeUint64(pointer, value).mapError()
    }

    func writeBool(_ value: Bool) -> Result<Void, AndroidBinderError> {
        AParcel_writeBool(pointer, value).mapError()
    }

    func writeFloat(_ value: Float) -> Result<Void, AndroidBinderError> {
        AParcel_writeFloat(pointer, value).mapError()
    }

    func writeDouble(_ value: Double) -> Result<Void, AndroidBinderError> {
        AParcel_writeDouble(pointer, value).mapError()
    }

    func writeChar(_ value: UInt16) -> Result<Void, AndroidBinderError> {
        AParcel_writeChar(pointer, value).mapError()
    }

    func writeByte(_ value: Int8) -> Result<Void, AndroidBinderError> {
        AParcel_writeByte(pointer, value).mapError()
    }

    func writeString(_ value: String) -> Result<Void, AndroidBinderError> {
        value.withCString { cStr in
            AParcel_writeString(pointer, cStr, Int32(value.utf8.count)).mapError()
        }
    }

    func writeStrongBinder(_ binder: AndroidBinder?) -> Result<Void, AndroidBinderError> {
        AParcel_writeStrongBinder(pointer, binder?.handle.pointer).mapError()
    }

    func writeFileDescriptor(_ fd: Int32) -> Result<Void, AndroidBinderError> {
        AParcel_writeParcelFileDescriptor(pointer, fd).mapError()
    }

    func writeStatusHeader(_ status: borrowing Status) -> Result<Void, AndroidBinderError> {
        AParcel_writeStatusHeader(pointer, status.handle.pointer).mapError()
    }
}

// MARK: - Handle: Scalar Reads

internal extension Parcel.Handle {

    func readInt32() -> Result<Int32, AndroidBinderError> {
        var value: Int32 = 0
        return AParcel_readInt32(pointer, &value).mapError(value)
    }

    func readUInt32() -> Result<UInt32, AndroidBinderError> {
        var value: UInt32 = 0
        return AParcel_readUint32(pointer, &value).mapError(value)
    }

    func readInt64() -> Result<Int64, AndroidBinderError> {
        var value: Int64 = 0
        return AParcel_readInt64(pointer, &value).mapError(value)
    }

    func readUInt64() -> Result<UInt64, AndroidBinderError> {
        var value: UInt64 = 0
        return AParcel_readUint64(pointer, &value).mapError(value)
    }

    func readBool() -> Result<Bool, AndroidBinderError> {
        var value = false
        return AParcel_readBool(pointer, &value).mapError(value)
    }

    func readFloat() -> Result<Float, AndroidBinderError> {
        var value: Float = 0
        return AParcel_readFloat(pointer, &value).mapError(value)
    }

    func readDouble() -> Result<Double, AndroidBinderError> {
        var value: Double = 0
        return AParcel_readDouble(pointer, &value).mapError(value)
    }

    func readChar() -> Result<UInt16, AndroidBinderError> {
        var value: UInt16 = 0
        return AParcel_readChar(pointer, &value).mapError(value)
    }

    func readByte() -> Result<Int8, AndroidBinderError> {
        var value: Int8 = 0
        return AParcel_readByte(pointer, &value).mapError(value)
    }

    func readString() -> Result<String, AndroidBinderError> {
        var ctx = ParcelStringReadContext(buffer: nil)
        let status = withUnsafeMutablePointer(to: &ctx) { ctxPtr -> binder_status_t in
            AParcel_readString(pointer, ctxPtr) { userData, length, outBuffer -> Bool in
                guard let userData = userData else { return false }
                let buf = UnsafeMutablePointer<CChar>.allocate(capacity: Int(length) + 1)
                buf[Int(length)] = 0
                userData.assumingMemoryBound(to: ParcelStringReadContext.self).pointee.buffer = buf
                outBuffer?.pointee = buf
                return true
            }
        }
        defer { ctx.buffer?.deallocate() }
        guard status == STATUS_OK else { return status.mapError(as: String.self) }
        guard let buf = ctx.buffer else { return .success("") }
        return .success(String(cString: buf))
    }

    func readStrongBinder() -> Result<AndroidBinder, AndroidBinderError> {
        var binderPtr: OpaquePointer? = nil
        let status = AParcel_readStrongBinder(pointer, &binderPtr)
        guard status == STATUS_OK else { return status.mapError(as: AndroidBinder.self) }
        guard let ptr = binderPtr else {
            return .failure(AndroidBinderError(AndroidBinderError.ErrorCode.unexpectedNull))
        }
        return .success(AndroidBinder(ptr))
    }

    func readFileDescriptor() -> Result<Int32, AndroidBinderError> {
        var fd: Int32 = -1
        return AParcel_readParcelFileDescriptor(pointer, &fd).mapError(fd)
    }

    func readStatusHeader() -> Result<Status, AndroidBinderError> {
        var statusPtr: OpaquePointer? = nil
        let statusCode = AParcel_readStatusHeader(pointer, &statusPtr)
        guard statusCode == STATUS_OK else { return statusCode.mapError(as: Status.self) }
        guard let ptr = statusPtr else {
            return .failure(AndroidBinderError(AndroidBinderError.ErrorCode.unexpectedNull))
        }
        return .success(Status(ptr))
    }
}

// MARK: - Handle: Array Writes

internal extension Parcel.Handle {

    func writeByteArray(_ values: [Int8]?) -> Result<Void, AndroidBinderError> {
        guard let values = values else {
            return AParcel_writeByteArray(pointer, nil, -1).mapError()
        }
        if values.isEmpty {
            return AParcel_writeByteArray(pointer, nil, 0).mapError()
        }
        return values.withUnsafeBufferPointer { buf in
            AParcel_writeByteArray(pointer, buf.baseAddress, Int32(values.count)).mapError()
        }
    }

    func writeInt32Array(_ values: [Int32]?) -> Result<Void, AndroidBinderError> {
        guard let values = values else {
            return AParcel_writeInt32Array(pointer, nil, -1).mapError()
        }
        if values.isEmpty {
            return AParcel_writeInt32Array(pointer, nil, 0).mapError()
        }
        return values.withUnsafeBufferPointer { buf in
            AParcel_writeInt32Array(pointer, buf.baseAddress, Int32(values.count)).mapError()
        }
    }

    func writeUInt32Array(_ values: [UInt32]?) -> Result<Void, AndroidBinderError> {
        guard let values = values else {
            return AParcel_writeUint32Array(pointer, nil, -1).mapError()
        }
        if values.isEmpty {
            return AParcel_writeUint32Array(pointer, nil, 0).mapError()
        }
        return values.withUnsafeBufferPointer { buf in
            AParcel_writeUint32Array(pointer, buf.baseAddress, Int32(values.count)).mapError()
        }
    }

    func writeInt64Array(_ values: [Int64]?) -> Result<Void, AndroidBinderError> {
        guard let values = values else {
            return AParcel_writeInt64Array(pointer, nil, -1).mapError()
        }
        if values.isEmpty {
            return AParcel_writeInt64Array(pointer, nil, 0).mapError()
        }
        return values.withUnsafeBufferPointer { buf in
            AParcel_writeInt64Array(pointer, buf.baseAddress, Int32(values.count)).mapError()
        }
    }

    func writeUInt64Array(_ values: [UInt64]?) -> Result<Void, AndroidBinderError> {
        guard let values = values else {
            return AParcel_writeUint64Array(pointer, nil, -1).mapError()
        }
        if values.isEmpty {
            return AParcel_writeUint64Array(pointer, nil, 0).mapError()
        }
        return values.withUnsafeBufferPointer { buf in
            AParcel_writeUint64Array(pointer, buf.baseAddress, Int32(values.count)).mapError()
        }
    }

    func writeFloatArray(_ values: [Float]?) -> Result<Void, AndroidBinderError> {
        guard let values = values else {
            return AParcel_writeFloatArray(pointer, nil, -1).mapError()
        }
        if values.isEmpty {
            return AParcel_writeFloatArray(pointer, nil, 0).mapError()
        }
        return values.withUnsafeBufferPointer { buf in
            AParcel_writeFloatArray(pointer, buf.baseAddress, Int32(values.count)).mapError()
        }
    }

    func writeDoubleArray(_ values: [Double]?) -> Result<Void, AndroidBinderError> {
        guard let values = values else {
            return AParcel_writeDoubleArray(pointer, nil, -1).mapError()
        }
        if values.isEmpty {
            return AParcel_writeDoubleArray(pointer, nil, 0).mapError()
        }
        return values.withUnsafeBufferPointer { buf in
            AParcel_writeDoubleArray(pointer, buf.baseAddress, Int32(values.count)).mapError()
        }
    }

    func writeCharArray(_ values: [UInt16]?) -> Result<Void, AndroidBinderError> {
        guard let values = values else {
            return AParcel_writeCharArray(pointer, nil, -1).mapError()
        }
        if values.isEmpty {
            return AParcel_writeCharArray(pointer, nil, 0).mapError()
        }
        return values.withUnsafeBufferPointer { buf in
            AParcel_writeCharArray(pointer, buf.baseAddress, Int32(values.count)).mapError()
        }
    }

    func writeBoolArray(_ values: [Bool]?) -> Result<Void, AndroidBinderError> {
        guard let values = values else {
            return AParcel_writeBoolArray(pointer, nil, -1, nil).mapError()
        }
        if values.isEmpty {
            return AParcel_writeBoolArray(pointer, nil, 0, nil).mapError()
        }
        return values.withUnsafeBufferPointer { buf in
            var ctx = ParcelBoolWriteContext(elements: buf.baseAddress)
            return withUnsafePointer(to: &ctx) { ctxPtr in
                AParcel_writeBoolArray(pointer, ctxPtr, Int32(values.count)) { userData, index -> Bool in
                    userData!.assumingMemoryBound(to: ParcelBoolWriteContext.self).pointee.elements![Int(index)]
                }.mapError()
            }
        }
    }
}

// MARK: - Handle: Array Reads

internal extension Parcel.Handle {

    func readByteArray() -> Result<[Int8]?, AndroidBinderError> {
        var ctx = ParcelInt8ArrayReadContext(buffer: nil, count: 0, isNull: true)
        let status = withUnsafeMutablePointer(to: &ctx) { ctxPtr -> binder_status_t in
            AParcel_readByteArray(pointer, ctxPtr) { userData, length, outBuffer -> Bool in
                let ctx = userData!.assumingMemoryBound(to: ParcelInt8ArrayReadContext.self)
                if length < 0 { return true }
                ctx.pointee.isNull = false
                if length > 0 {
                    let buf = UnsafeMutablePointer<Int8>.allocate(capacity: Int(length))
                    ctx.pointee.buffer = buf
                    ctx.pointee.count = length
                    outBuffer?.pointee = buf
                }
                return true
            }
        }
        defer { ctx.buffer?.deallocate() }
        guard status == STATUS_OK else { return status.mapError(as: [Int8]?.self) }
        if ctx.isNull { return .success(nil) }
        if let buf = ctx.buffer {
            return .success(Array(UnsafeBufferPointer(start: buf, count: Int(ctx.count))))
        }
        return .success([])
    }

    func readInt32Array() -> Result<[Int32]?, AndroidBinderError> {
        var ctx = ParcelInt32ArrayReadContext(buffer: nil, count: 0, isNull: true)
        let status = withUnsafeMutablePointer(to: &ctx) { ctxPtr -> binder_status_t in
            AParcel_readInt32Array(pointer, ctxPtr) { userData, length, outBuffer -> Bool in
                let ctx = userData!.assumingMemoryBound(to: ParcelInt32ArrayReadContext.self)
                if length < 0 { return true }
                ctx.pointee.isNull = false
                if length > 0 {
                    let buf = UnsafeMutablePointer<Int32>.allocate(capacity: Int(length))
                    ctx.pointee.buffer = buf
                    ctx.pointee.count = length
                    outBuffer?.pointee = buf
                }
                return true
            }
        }
        defer { ctx.buffer?.deallocate() }
        guard status == STATUS_OK else { return status.mapError(as: [Int32]?.self) }
        if ctx.isNull { return .success(nil) }
        if let buf = ctx.buffer {
            return .success(Array(UnsafeBufferPointer(start: buf, count: Int(ctx.count))))
        }
        return .success([])
    }

    func readUInt32Array() -> Result<[UInt32]?, AndroidBinderError> {
        var ctx = ParcelUInt32ArrayReadContext(buffer: nil, count: 0, isNull: true)
        let status = withUnsafeMutablePointer(to: &ctx) { ctxPtr -> binder_status_t in
            AParcel_readUint32Array(pointer, ctxPtr) { userData, length, outBuffer -> Bool in
                let ctx = userData!.assumingMemoryBound(to: ParcelUInt32ArrayReadContext.self)
                if length < 0 { return true }
                ctx.pointee.isNull = false
                if length > 0 {
                    let buf = UnsafeMutablePointer<UInt32>.allocate(capacity: Int(length))
                    ctx.pointee.buffer = buf
                    ctx.pointee.count = length
                    outBuffer?.pointee = buf
                }
                return true
            }
        }
        defer { ctx.buffer?.deallocate() }
        guard status == STATUS_OK else { return status.mapError(as: [UInt32]?.self) }
        if ctx.isNull { return .success(nil) }
        if let buf = ctx.buffer {
            return .success(Array(UnsafeBufferPointer(start: buf, count: Int(ctx.count))))
        }
        return .success([])
    }

    func readInt64Array() -> Result<[Int64]?, AndroidBinderError> {
        var ctx = ParcelInt64ArrayReadContext(buffer: nil, count: 0, isNull: true)
        let status = withUnsafeMutablePointer(to: &ctx) { ctxPtr -> binder_status_t in
            AParcel_readInt64Array(pointer, ctxPtr) { userData, length, outBuffer -> Bool in
                let ctx = userData!.assumingMemoryBound(to: ParcelInt64ArrayReadContext.self)
                if length < 0 { return true }
                ctx.pointee.isNull = false
                if length > 0 {
                    let buf = UnsafeMutablePointer<Int64>.allocate(capacity: Int(length))
                    ctx.pointee.buffer = buf
                    ctx.pointee.count = length
                    outBuffer?.pointee = buf
                }
                return true
            }
        }
        defer { ctx.buffer?.deallocate() }
        guard status == STATUS_OK else { return status.mapError(as: [Int64]?.self) }
        if ctx.isNull { return .success(nil) }
        if let buf = ctx.buffer {
            return .success(Array(UnsafeBufferPointer(start: buf, count: Int(ctx.count))))
        }
        return .success([])
    }

    func readUInt64Array() -> Result<[UInt64]?, AndroidBinderError> {
        var ctx = ParcelUInt64ArrayReadContext(buffer: nil, count: 0, isNull: true)
        let status = withUnsafeMutablePointer(to: &ctx) { ctxPtr -> binder_status_t in
            AParcel_readUint64Array(pointer, ctxPtr) { userData, length, outBuffer -> Bool in
                let ctx = userData!.assumingMemoryBound(to: ParcelUInt64ArrayReadContext.self)
                if length < 0 { return true }
                ctx.pointee.isNull = false
                if length > 0 {
                    let buf = UnsafeMutablePointer<UInt64>.allocate(capacity: Int(length))
                    ctx.pointee.buffer = buf
                    ctx.pointee.count = length
                    outBuffer?.pointee = buf
                }
                return true
            }
        }
        defer { ctx.buffer?.deallocate() }
        guard status == STATUS_OK else { return status.mapError(as: [UInt64]?.self) }
        if ctx.isNull { return .success(nil) }
        if let buf = ctx.buffer {
            return .success(Array(UnsafeBufferPointer(start: buf, count: Int(ctx.count))))
        }
        return .success([])
    }

    func readFloatArray() -> Result<[Float]?, AndroidBinderError> {
        var ctx = ParcelFloatArrayReadContext(buffer: nil, count: 0, isNull: true)
        let status = withUnsafeMutablePointer(to: &ctx) { ctxPtr -> binder_status_t in
            AParcel_readFloatArray(pointer, ctxPtr) { userData, length, outBuffer -> Bool in
                let ctx = userData!.assumingMemoryBound(to: ParcelFloatArrayReadContext.self)
                if length < 0 { return true }
                ctx.pointee.isNull = false
                if length > 0 {
                    let buf = UnsafeMutablePointer<Float>.allocate(capacity: Int(length))
                    ctx.pointee.buffer = buf
                    ctx.pointee.count = length
                    outBuffer?.pointee = buf
                }
                return true
            }
        }
        defer { ctx.buffer?.deallocate() }
        guard status == STATUS_OK else { return status.mapError(as: [Float]?.self) }
        if ctx.isNull { return .success(nil) }
        if let buf = ctx.buffer {
            return .success(Array(UnsafeBufferPointer(start: buf, count: Int(ctx.count))))
        }
        return .success([])
    }

    func readDoubleArray() -> Result<[Double]?, AndroidBinderError> {
        var ctx = ParcelDoubleArrayReadContext(buffer: nil, count: 0, isNull: true)
        let status = withUnsafeMutablePointer(to: &ctx) { ctxPtr -> binder_status_t in
            AParcel_readDoubleArray(pointer, ctxPtr) { userData, length, outBuffer -> Bool in
                let ctx = userData!.assumingMemoryBound(to: ParcelDoubleArrayReadContext.self)
                if length < 0 { return true }
                ctx.pointee.isNull = false
                if length > 0 {
                    let buf = UnsafeMutablePointer<Double>.allocate(capacity: Int(length))
                    ctx.pointee.buffer = buf
                    ctx.pointee.count = length
                    outBuffer?.pointee = buf
                }
                return true
            }
        }
        defer { ctx.buffer?.deallocate() }
        guard status == STATUS_OK else { return status.mapError(as: [Double]?.self) }
        if ctx.isNull { return .success(nil) }
        if let buf = ctx.buffer {
            return .success(Array(UnsafeBufferPointer(start: buf, count: Int(ctx.count))))
        }
        return .success([])
    }

    func readCharArray() -> Result<[UInt16]?, AndroidBinderError> {
        var ctx = ParcelUInt16ArrayReadContext(buffer: nil, count: 0, isNull: true)
        let status = withUnsafeMutablePointer(to: &ctx) { ctxPtr -> binder_status_t in
            AParcel_readCharArray(pointer, ctxPtr) { userData, length, outBuffer -> Bool in
                let ctx = userData!.assumingMemoryBound(to: ParcelUInt16ArrayReadContext.self)
                if length < 0 { return true }
                ctx.pointee.isNull = false
                if length > 0 {
                    let buf = UnsafeMutablePointer<UInt16>.allocate(capacity: Int(length))
                    ctx.pointee.buffer = buf
                    ctx.pointee.count = length
                    outBuffer?.pointee = buf
                }
                return true
            }
        }
        defer { ctx.buffer?.deallocate() }
        guard status == STATUS_OK else { return status.mapError(as: [UInt16]?.self) }
        if ctx.isNull { return .success(nil) }
        if let buf = ctx.buffer {
            return .success(Array(UnsafeBufferPointer(start: buf, count: Int(ctx.count))))
        }
        return .success([])
    }

    func readBoolArray() -> Result<[Bool]?, AndroidBinderError> {
        var ctx = ParcelBoolReadContext(elements: nil, count: 0, isNull: true)
        let status = withUnsafeMutablePointer(to: &ctx) { ctxPtr -> binder_status_t in
            AParcel_readBoolArray(
                pointer, ctxPtr,
                { userData, length -> Bool in
                    let ctx = userData!.assumingMemoryBound(to: ParcelBoolReadContext.self)
                    if length < 0 { return true }
                    ctx.pointee.isNull = false
                    if length > 0 {
                        ctx.pointee.elements = UnsafeMutablePointer<Bool>.allocate(capacity: Int(length))
                        ctx.pointee.count = length
                    }
                    return true
                },
                { userData, index, value in
                    let ctx = userData!.assumingMemoryBound(to: ParcelBoolReadContext.self)
                    ctx.pointee.elements?[Int(index)] = value
                }
            )
        }
        defer { ctx.elements?.deallocate() }
        guard status == STATUS_OK else { return status.mapError(as: [Bool]?.self) }
        if ctx.isNull { return .success(nil) }
        if let elements = ctx.elements {
            return .success(Array(UnsafeBufferPointer(start: elements, count: Int(ctx.count))))
        }
        return .success([])
    }
}

// MARK: - Private C Callback Context Types

private struct ParcelStringReadContext {
    var buffer: UnsafeMutablePointer<CChar>?
}

private struct ParcelBoolWriteContext {
    var elements: UnsafePointer<Bool>?
}

private struct ParcelBoolReadContext {
    var elements: UnsafeMutablePointer<Bool>?
    var count: Int32
    var isNull: Bool
}

private struct ParcelInt8ArrayReadContext {
    var buffer: UnsafeMutablePointer<Int8>?
    var count: Int32
    var isNull: Bool
}

private struct ParcelInt32ArrayReadContext {
    var buffer: UnsafeMutablePointer<Int32>?
    var count: Int32
    var isNull: Bool
}

private struct ParcelUInt32ArrayReadContext {
    var buffer: UnsafeMutablePointer<UInt32>?
    var count: Int32
    var isNull: Bool
}

private struct ParcelInt64ArrayReadContext {
    var buffer: UnsafeMutablePointer<Int64>?
    var count: Int32
    var isNull: Bool
}

private struct ParcelUInt64ArrayReadContext {
    var buffer: UnsafeMutablePointer<UInt64>?
    var count: Int32
    var isNull: Bool
}

private struct ParcelFloatArrayReadContext {
    var buffer: UnsafeMutablePointer<Float>?
    var count: Int32
    var isNull: Bool
}

private struct ParcelDoubleArrayReadContext {
    var buffer: UnsafeMutablePointer<Double>?
    var count: Int32
    var isNull: Bool
}

private struct ParcelUInt16ArrayReadContext {
    var buffer: UnsafeMutablePointer<UInt16>?
    var count: Int32
    var isNull: Bool
}
