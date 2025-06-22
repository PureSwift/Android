package com.pureswift.swiftandroid

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup

class Fragment(val swiftObject: SwiftObject): android.app.Fragment() {

    @Deprecated("Deprecated in Java")
    external override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle
    ): View?
}