// Auto-generated by Java-to-Swift wrapper generator.
import JavaIO
import JavaUtil
import JavaKit
import JavaKitCollection
import JavaKitFunction
import JavaRuntime

@JavaClass("android.os.Parcel")
open class Parcel: JavaObject {
  @JavaMethod
  open func hasFileDescriptors() -> Bool

  @JavaMethod
  open func hasFileDescriptors(_ arg0: Int32, _ arg1: Int32) -> Bool

  @JavaMethod
  open func writeStringArray(_ arg0: [String])

  @JavaMethod
  open func createStringArray() -> [String]

  @JavaMethod
  open func readStringArray(_ arg0: [String])

  @JavaMethod
  open func writeBinderArray(_ arg0: [IBinder?])

  @JavaMethod
  open func writeInterfaceArray(_ arg0: [IInterface?])

  @JavaMethod
  open func readDoubleArray(_ arg0: [Double])

  @JavaMethod
  open func createBinderArray() -> [IBinder?]

  @JavaMethod
  open func readBinderArray(_ arg0: [IBinder?])

  @JavaMethod
  open func createInterfaceArray(_ arg0: JavaIntFunction<JavaArray>?, _ arg1: JavaFunction<IBinder, IInterface>?) -> [IInterface?]

  @JavaMethod
  open func readInterfaceArray(_ arg0: [IInterface?], _ arg1: JavaFunction<IBinder, IInterface>?)

  @JavaMethod
  open func writeTypedList(_ arg0: List<Parcelable>?)

  @JavaMethod
  open func writeStringList(_ arg0: List<JavaString>?)

  @JavaMethod
  open func writeBinderList(_ arg0: List<IBinder>?)

  @JavaMethod
  open func writeInterfaceList(_ arg0: List<IInterface>?)

  @JavaMethod
  open func writeParcelableList(_ arg0: List<Parcelable>?, _ arg1: Int32)

  @JavaMethod
  open func writeTypedArray(_ arg0: [Parcelable?], _ arg1: Int32)

  @JavaMethod
  open func writeTypedObject(_ arg0: Parcelable?, _ arg1: Int32)

  @JavaMethod
  open func writeFixedArray(_ arg0: JavaObject?, _ arg1: Int32, _ arg2: [Int32])

  @JavaMethod
  open func writeValue(_ arg0: JavaObject?)

  @JavaMethod
  open func writeParcelable(_ arg0: Parcelable?, _ arg1: Int32)

  @JavaMethod
  open func writeParcelableCreator(_ arg0: Parcelable?)

  @JavaMethod
  open func writeSerializable(_ arg0: Serializable?)

  @JavaMethod
  open func writeException(_ arg0: Exception?)

  @JavaMethod
  open func writeNoException()

  @JavaMethod
  open func readException(_ arg0: Int32, _ arg1: String)

  @JavaMethod
  open func readException()

  @JavaMethod
  open func readStrongBinder() -> IBinder!

  @JavaMethod
  open func readFileDescriptor() -> ParcelFileDescriptor!
    
  @JavaMethod
  open func readMap<K: AnyJavaObject, V: AnyJavaObject>(_ arg0: Map<K, V>?, _ arg1: JavaClassLoader?)

  @JavaMethod
  open func readMap(_ arg0: Map<JavaObject, JavaObject>?, _ arg1: JavaClassLoader?, _ arg2: JavaClass<JavaObject>?, _ arg3: JavaClass<JavaObject>?)

  @JavaMethod
  open func readList(_ arg0: JavaKitCollection.List<JavaObject>?, _ arg1: JavaClassLoader?, _ arg2: JavaClass<JavaObject>?)

  @JavaMethod
  open func readList(_ arg0: JavaKitCollection.List<JavaObject>?, _ arg1: JavaClassLoader?)

  @JavaMethod
  open func readHashMap(_ arg0: JavaClassLoader?, _ arg1: JavaClass<JavaObject>?, _ arg2: JavaClass<JavaObject>?) -> HashMap<JavaObject, JavaObject>!

  @JavaMethod
  open func readHashMap(_ arg0: JavaClassLoader?) -> HashMap<JavaObject, JavaObject>!

  @JavaMethod
  open func readBundle(_ arg0: JavaClassLoader?) -> Bundle!

  @JavaMethod
  open func readBundle() -> Bundle!

  @JavaMethod
  open func readPersistableBundle(_ arg0: JavaClassLoader?) -> PersistableBundle!

  @JavaMethod
  open func readPersistableBundle() -> PersistableBundle!

  @JavaMethod
  open func readByteArray(_ arg0: [Int8])

  @JavaMethod
  open func readBlob() -> [Int8]

  @JavaMethod
  open func readArrayList(_ arg0: JavaClassLoader?) -> ArrayList<JavaObject>!

  @JavaMethod
  open func readArrayList(_ arg0: JavaClassLoader?, _ arg1: JavaClass<JavaObject>?) -> ArrayList<JavaObject>!

  @JavaMethod
  open func readArray(_ arg0: JavaClassLoader?) -> [JavaObject?]

  @JavaMethod
  open func readArray(_ arg0: JavaClassLoader?, _ arg1: JavaClass<JavaObject>?) -> [JavaObject?]

  @JavaMethod
  open func createTypedArrayList(_ arg0: Parcelable.Creator<JavaObject>?) -> ArrayList<JavaObject>!

  @JavaMethod
  open func readTypedList(_ arg0: List<JavaObject>?, _ arg1: Parcelable.Creator<JavaObject>?)

  @JavaMethod
  open func createStringArrayList() -> ArrayList<JavaString>!

  @JavaMethod
  open func createBinderArrayList() -> ArrayList<IBinder>!

  @JavaMethod
  open func createInterfaceArrayList(_ arg0: JavaFunction<IBinder, IInterface>?) -> ArrayList<IInterface>!

  @JavaMethod
  open func readStringList(_ arg0: List<JavaString>?)

  @JavaMethod
  open func readBinderList(_ arg0: List<IBinder>?)

  @JavaMethod
  open func readInterfaceList(_ arg0: List<IInterface>?, _ arg1: JavaFunction<IBinder, IInterface>?)

  @JavaMethod
  open func readParcelableList(_ arg0: List<JavaObject>?, _ arg1: JavaClassLoader?, _ arg2: JavaClass<JavaObject>?) -> List<JavaObject>!

  @JavaMethod
  open func readParcelableList(_ arg0: List<Parcelable>?, _ arg1: JavaClassLoader?) -> List<Parcelable>!

  @JavaMethod
  open func createTypedArray(_ arg0: Parcelable.Creator<JavaObject>?) -> [JavaObject?]

  @JavaMethod
  open func readTypedArray(_ arg0: [JavaObject?], _ arg1: Parcelable.Creator<JavaObject>?)

  @JavaMethod
  open func readTypedObject(_ arg0: Parcelable.Creator<JavaObject>?) -> JavaObject!

  @JavaMethod
  open func readFixedArray(_ arg0: JavaObject?, _ arg1: Parcelable.Creator<Parcelable>?)

  @JavaMethod
  open func readFixedArray(_ arg0: JavaObject?)

  @JavaMethod
  open func readFixedArray(_ arg0: JavaObject?, _ arg1: JavaFunction<IBinder, IInterface>?)

  @JavaMethod
  open func createFixedArray(_ arg0: JavaClass<JavaObject>?, _ arg1: Parcelable.Creator<Parcelable>?, _ arg2: [Int32]) -> JavaObject!

  @JavaMethod
  open func createFixedArray(_ arg0: JavaClass<JavaObject>?, _ arg1: JavaFunction<IBinder, IInterface>?, _ arg2: [Int32]) -> JavaObject!

  @JavaMethod
  open func createFixedArray(_ arg0: JavaClass<JavaObject>?, _ arg1: [Int32]) -> JavaObject!

  @JavaMethod
  open func writeParcelableArray(_ arg0: [Parcelable?], _ arg1: Int32)

  @JavaMethod
  open func readParcelable(_ arg0: JavaClassLoader?, _ arg1: JavaClass<JavaObject>?) -> JavaObject!

  @JavaMethod
  open func readParcelable(_ arg0: JavaClassLoader?) -> Parcelable!

  @JavaMethod
  open func readParcelableCreator(_ arg0: JavaClassLoader?, _ arg1: JavaClass<JavaObject>?) -> Parcelable.Creator<JavaObject>!

  @JavaMethod
  open func readParcelableCreator(_ arg0: JavaClassLoader?) -> Parcelable.Creator<JavaObject>!

  @JavaMethod
  open func readParcelableArray(_ arg0: JavaClassLoader?) -> [Parcelable?]

  @JavaMethod
  open func readParcelableArray(_ arg0: JavaClassLoader?, _ arg1: JavaClass<JavaObject>?) -> [JavaObject?]

  @JavaMethod
  open func readSerializable(_ arg0: JavaClassLoader?, _ arg1: JavaClass<JavaObject>?) -> JavaObject!

  @JavaMethod
  open func readSerializable() -> Serializable!

  @JavaMethod
  open func recycle()

  @JavaMethod
  open func setPropagateAllowBlocking()

  @JavaMethod
  open func dataSize() -> Int32

  @JavaMethod
  open func dataAvail() -> Int32

  @JavaMethod
  open func dataPosition() -> Int32

  @JavaMethod
  open func dataCapacity() -> Int32

  @JavaMethod
  open func setDataSize(_ arg0: Int32)

  @JavaMethod
  open func setDataPosition(_ arg0: Int32)

  @JavaMethod
  open func setDataCapacity(_ arg0: Int32)

  @JavaMethod
  open func marshall() -> [Int8]

  @JavaMethod
  open func unmarshall(_ arg0: [Int8], _ arg1: Int32, _ arg2: Int32)

  @JavaMethod
  open func appendFrom(_ arg0: Parcel?, _ arg1: Int32, _ arg2: Int32)

  @JavaMethod
  open func writeInterfaceToken(_ arg0: String)

  @JavaMethod
  open func enforceInterface(_ arg0: String)

  @JavaMethod
  open func enforceNoDataAvail()

  @JavaMethod
  open func writeByteArray(_ arg0: [Int8])

  @JavaMethod
  open func writeByteArray(_ arg0: [Int8], _ arg1: Int32, _ arg2: Int32)

  @JavaMethod
  open func writeBlob(_ arg0: [Int8], _ arg1: Int32, _ arg2: Int32)

  @JavaMethod
  open func writeBlob(_ arg0: [Int8])

  @JavaMethod
  open func writeStrongBinder(_ arg0: IBinder?)

  @JavaMethod
  open func writeStrongInterface(_ arg0: IInterface?)
  
  @JavaMethod
  open func writeFileDescriptor(_ arg0: FileDescriptor?)

  @JavaMethod
  open func writeMap(_ arg0: Map<JavaObject, JavaObject>?)
    
  @JavaMethod
  open func writeBundle(_ arg0: Bundle?)

  @JavaMethod
  open func writePersistableBundle(_ arg0: PersistableBundle?)

  @JavaMethod
  open func writeArray(_ arg0: [JavaObject?])

  @JavaMethod
  open func writeBooleanArray(_ arg0: [Bool])

  @JavaMethod
  open func createBooleanArray() -> [Bool]

  @JavaMethod
  open func readBooleanArray(_ arg0: [Bool])

  @JavaMethod
  open func writeCharArray(_ arg0: [UInt16])

  @JavaMethod
  open func createCharArray() -> [UInt16]

  @JavaMethod
  open func readCharArray(_ arg0: [UInt16])

  @JavaMethod
  open func writeIntArray(_ arg0: [Int32])

  @JavaMethod
  open func createIntArray() -> [Int32]

  @JavaMethod
  open func readIntArray(_ arg0: [Int32])

  @JavaMethod
  open func writeLongArray(_ arg0: [Int64])

  @JavaMethod
  open func createLongArray() -> [Int64]

  @JavaMethod
  open func readLongArray(_ arg0: [Int64])

  @JavaMethod
  open func writeFloatArray(_ arg0: [Float])

  @JavaMethod
  open func createFloatArray() -> [Float]

  @JavaMethod
  open func readFloatArray(_ arg0: [Float])

  @JavaMethod
  open func writeDoubleArray(_ arg0: [Double])

  @JavaMethod
  open func createDoubleArray() -> [Double]

  @JavaMethod
  open override func finalize() throws

  @JavaMethod
  open func writeInt(_ arg0: Int32)

  @JavaMethod
  open func readInt() -> Int32

  @JavaMethod
  open func readLong() -> Int64

  @JavaMethod
  open func readByte() -> Int8

  @JavaMethod
  open func writeLong(_ arg0: Int64)

  @JavaMethod
  open func writeByte(_ arg0: Int8)

  @JavaMethod
  open func writeFloat(_ arg0: Float)

  @JavaMethod
  open func readFloat() -> Float

  @JavaMethod
  open func writeList(_ arg0: List<JavaObject>?)

  @JavaMethod
  open func writeDouble(_ arg0: Double)

  @JavaMethod
  open func readDouble() -> Double

  @JavaMethod
  open func readBoolean() -> Bool

  @JavaMethod
  open func writeBoolean(_ arg0: Bool)

  @JavaMethod
  open func readString() -> String

  @JavaMethod
  open func writeString(_ arg0: String)

  @JavaMethod
  open func readValue(_ arg0: JavaClassLoader?) -> JavaObject!

  @JavaMethod
  open func createByteArray() -> [Int8]
}
extension JavaClass<Parcel> {
  @JavaStaticField(isFinal: true)
  public var STRING_CREATOR: Parcelable.Creator<JavaString>!

  @JavaStaticMethod
  public func obtain() -> Parcel!

  @JavaStaticMethod
  public func obtain(_ arg0: IBinder?) -> Parcel!
}
