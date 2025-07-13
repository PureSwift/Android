package com.pureswift.swiftandroid

import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.SharedFlow

class UnitEmitter() {

    private val _flow = MutableSharedFlow<Unit>(extraBufferCapacity = 64)
    val flow: SharedFlow<Unit> get() = _flow

    fun emit() {
        //println("Emit")
        _flow.tryEmit(Unit)
    }
}