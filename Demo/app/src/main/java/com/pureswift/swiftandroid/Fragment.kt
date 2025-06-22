package com.pureswift.swiftandroid

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.LinearLayout

class Fragment(val swiftObject: SwiftObject): android.app.Fragment() {

    @Deprecated("Deprecated in Java")
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val context = this.context
        checkNotNull(context)
        val linearLayout = LinearLayout(context)
        return linearLayout
    }

    external override fun onViewCreated(view: View, savedInstanceState: Bundle?)
}