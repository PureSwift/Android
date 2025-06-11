package com.pureswift.swiftandroid

/// Swift object retained by JVM
class SwiftObject(val swiftObject: Long, val type: String) {

    override fun toString(): String {
        return toStringSwift()
    }

    external fun toStringSwift(): String

    fun finalize() {
        finalizeSwift()
    }

    external fun finalizeSwift(): String
}