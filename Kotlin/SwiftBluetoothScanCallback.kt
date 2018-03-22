package com.jmarkstar.swiftandroid

import android.bluetooth.*
import android.bluetooth.le.ScanCallback
import android.content.Context
import android.bluetooth.le.ScanResult

/**
 * Created by coleman on 3/17/18.
 */

@SuppressWarnings("JniMissingFunction")
public final class SwiftBluetoothScanCallback(__swiftObject: Long): ScanCallback()
{

    val __swiftObject: Long

    init {

        this.__swiftObject = __swiftObject
    }

    external fun __onScanResult(swiftObject: Long, callbackType: Int, result: android.bluetooth.le.ScanResult?)

    override fun onScanResult(callbackType: Int, result: android.bluetooth.le.ScanResult?) {

        __onScanResult(__swiftObject, callbackType, result)
    }

    external fun __onBatchScanResults(swiftObject: Long, results: MutableList<ScanResult>?)

    override fun onBatchScanResults(results: MutableList<ScanResult>?) {

        __onBatchScanResults(__swiftObject, results)
    }

    external fun __onScanFailed(swiftObject: Long, errorCode: Int)

    override fun onScanFailed(errorCode: Int) {

        __onScanFailed(__swiftObject, errorCode)
    }

    external fun __finalize(__swiftObject: Long)

    fun finalize() {
        __finalize(__swiftObject)
    }
}


/*
/* public final */ class SwiftBluetoothLowEnergyManager(val context: Context) : Responder {

    private val listener: Listener

    private external fun bind(self: Responder): Listener

    init {

        listener = bind(this)
    }

    private val bluetoothManager = context.getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager

    private val adapter = bluetoothManager.adapter

    override fun startScan(settings: SwiftBluetoothBinding.ScanSettings,
                           callback: SwiftBluetoothBinding.ScanCallback) {

        val leScanSettingsBuilder = android.bluetooth.le.ScanSettings.Builder()
        leScanSettingsBuilder.setScanMode(settings.scanMode)
        //leScanSettingsBuilder.setCallbackType(settings.callbackType)
        leScanSettingsBuilder.setReportDelay(settings.reportDelayMiliseconds)
        //leScanSettingsBuilder.setNumOfMatches(settings.numberOfMatchesPerFilter)
        val leScanSettings = leScanSettingsBuilder.build() as android.bluetooth.le.ScanSettings

        val leScanCallback = SwiftScanCallback()
        leScanCallback.callback = callback
        leScanCallback.context = context

        adapter.bluetoothLeScanner.startScan(
                null,
                leScanSettings,
                leScanCallback
        )
    }

    override fun stopScan(callback: SwiftBluetoothBinding.ScanCallback) {

        val leScanCallback = SwiftScanCallback()
        leScanCallback.callback = callback
        leScanCallback.context = context

        adapter.bluetoothLeScanner.stopScan(leScanCallback)
    }

    private class SwiftScanCallback: android.bluetooth.le.ScanCallback() {

        var callback: SwiftBluetoothBinding.ScanCallback? = null

        var context: Context? = null

        override fun onScanResult(callbackType: Int, result: android.bluetooth.le.ScanResult?) {

            if (result != null) {

                val swiftResult = SwiftScanResult(result!!, context!!)

                callback?.onScanResult(callbackType, swiftResult)
            }
        }

        override fun onBatchScanResults(results: MutableList<ScanResult>?) {

            val swiftResults = results!!.map { SwiftScanResult(it, this.context!!) }

            callback?.onBatchScanResults(swiftResults)
        }

        override fun onScanFailed(errorCode: Int) {

            callback?.onScanFailed(errorCode)
        }
    }

    private class SwiftScanResult(result: android.bluetooth.le.ScanResult, context: Context): SwiftBluetoothBinding.ScanResult {

        val scanResult: android.bluetooth.le.ScanResult

        val context: Context

        init {

            this.context = context
            this.scanResult = result
        }


        override fun getDevice(): SwiftBluetoothBinding.BluetoothDevice {

            return SwiftBluetoothDevice(device = scanResult.device, context = context)
        }

        // Scan record, including advertising data and scan response data.
        override fun getScanRecord(): SwiftBluetoothBinding.ScanRecord {

            return SwiftScanRecord(scanResult.scanRecord)
        }

        // Received signal strength.
        override fun getRSSI(): Int {

            return scanResult.rssi
        }

        override fun getTimeStamp(): Long {

            return scanResult.timestampNanos
        }

        override fun toString(): String {

            return scanResult.toString()
        }
    }

    private class SwiftScanRecord(record: android.bluetooth.le.ScanRecord): SwiftBluetoothBinding.ScanRecord {

        val record: android.bluetooth.le.ScanRecord

        init {

            this.record = record
        }
    }

    private class SwiftBluetoothDevice(device: android.bluetooth.BluetoothDevice, context: Context): SwiftBluetoothBinding.BluetoothDevice {

        var context: Context

        val device: android.bluetooth.BluetoothDevice

        init {

            this.device = device
            this.context = context
        }

        override fun getAddress(): String {

            return device.address
        }

        override fun getName(): String {

            return device.name
        }

        override fun getType(): Int {

            return device.type
        }

        override fun getDeviceClass(): Int {

            return device.bluetoothClass.hashCode()
        }

        override fun connect(transport: Int, listener: SwiftBluetoothBinding.Peripheral.Listener): SwiftBluetoothBinding.Peripheral.Responder {

            val gattCallback = SwiftPeripheralListener()
            gattCallback.listener = listener

            val gattClient = device.connectGatt(context, false, gattCallback, transport)

            return SwiftPeripheralResponder(gattClient)
        }
    }

    private class SwiftService(service: BluetoothGattService): SwiftBluetoothBinding.GATTService {

        val service: BluetoothGattService

        init {

            this.service = service
        }

        override fun getUUID(): String {

            return service.uuid.toString()
        }
    }

    private class SwiftCharacteristic(characteristic: BluetoothGattCharacteristic): SwiftBluetoothBinding.GATTCharacteristic {

        val characteristic: BluetoothGattCharacteristic

        init {

            this.characteristic = characteristic
        }

        override fun getUUID(): String {

            return characteristic.uuid.toString()
        }
    }

    private class SwiftDescriptor(descriptor: BluetoothGattDescriptor): SwiftBluetoothBinding.GATTDescriptor {

        val descriptor: BluetoothGattDescriptor

        init {

            this.descriptor = descriptor
        }

        override fun getUUID(): String {

            return descriptor.uuid.toString()
        }
    }

    private class SwiftPeripheralListener: BluetoothGattCallback() {

        var listener: SwiftBluetoothBinding.Peripheral.Listener? = null

        override fun onServicesDiscovered(gatt: BluetoothGatt, status: Int) {

            listener?.onServicesDiscovered(status)
        }

        override fun onCharacteristicRead(gatt: BluetoothGatt, characteristic: BluetoothGattCharacteristic, status: Int) {

            val swiftCharacteristic = SwiftCharacteristic(characteristic!!)

            listener?.onCharacteristicRead(swiftCharacteristic, status)
        }

        override fun onCharacteristicWrite(gatt: BluetoothGatt, characteristic: BluetoothGattCharacteristic, status: Int) {

            val swiftCharacteristic = SwiftCharacteristic(characteristic!!)

            listener?.onCharacteristicWrite(swiftCharacteristic, status)
        }

        override fun onCharacteristicChanged(gatt: BluetoothGatt, characteristic: BluetoothGattCharacteristic) {

            val swiftCharacteristic = SwiftCharacteristic(characteristic!!)

            listener?.onCharacteristicChanged(swiftCharacteristic)
        }

        override fun onDescriptorRead(gatt: BluetoothGatt, descriptor: BluetoothGattDescriptor, status: Int) {

            val swiftDescriptor = SwiftDescriptor(descriptor)

            listener?.onDescriptorRead(swiftDescriptor, status)
        }

        override fun onDescriptorWrite(gatt: BluetoothGatt, descriptor: BluetoothGattDescriptor, status: Int) {

            val swiftDescriptor = SwiftDescriptor(descriptor)

            listener?.onDescriptorRead(swiftDescriptor, status)
        }

        override fun onReliableWriteCompleted(gatt: BluetoothGatt, status: Int) {

            listener?.onReliableWriteCompleted(status)
        }

        override fun onReadRemoteRssi(gatt: BluetoothGatt, rssi: Int, status: Int) {

            listener?.onReadRemoteRssi(rssi, status)
        }

        override fun onMtuChanged(gatt: BluetoothGatt, mtu: Int, status: Int) {

            listener?.onMtuChanged(mtu, status)
        }
    }

    private class SwiftPeripheralResponder(gattClient: android.bluetooth.BluetoothGatt): SwiftBluetoothBinding.Peripheral.Responder {

        val gattClient: android.bluetooth.BluetoothGatt

        init {

            this.gattClient = gattClient
        }

        override fun close() {

            gattClient.close()
        }

        override fun disconnect() {

            gattClient.disconnect()
        }

        override fun connect(): Boolean {

            return gattClient.connect()
        }

        override fun getServices(): List<SwiftBluetoothBinding.GATTService> {

            return gattClient.services.map { SwiftService(it) }
        }

        override fun readDescriptor(descriptor: SwiftBluetoothBinding.GATTDescriptor): Boolean {

            val swiftDescriptor = descriptor as SwiftDescriptor

            return gattClient.readDescriptor(swiftDescriptor.descriptor)
        }

        override fun writeDescriptor(descriptor: SwiftBluetoothBinding.GATTDescriptor): Boolean {

            val swiftDescriptor = descriptor as SwiftDescriptor

            return gattClient.writeDescriptor(swiftDescriptor.descriptor)
        }

        override fun beginReliableWrite(): Boolean {

            return gattClient.beginReliableWrite()
        }

        override fun executeReliableWrite(): Boolean {

            return gattClient.executeReliableWrite()
        }

        override fun abortReliableWrite() {

            gattClient.abortReliableWrite()
        }

        override fun setCharacteristicNotification(characteristic: SwiftBluetoothBinding.GATTCharacteristic,
                                                   enable: Boolean): Boolean {

            val swiftCharacteristic = characteristic as SwiftCharacteristic

            return gattClient.setCharacteristicNotification(swiftCharacteristic.characteristic, enable)
        }

        override fun readRemoteRssi(): Boolean {

            return gattClient.readRemoteRssi()
        }

        override fun requestMtu(mtu: Int): Boolean {

            return gattClient.requestMtu(mtu)
        }

        override fun requestConnectionPriority(connectionPriority: Int): Boolean {

            return gattClient.requestConnectionPriority(connectionPriority)
        }
    }
}
*/