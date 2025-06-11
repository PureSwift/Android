package com.pureswift.swiftandroid

import android.view.View

class ViewOnClickListener(val action: SwiftObject): View.OnClickListener {

    external override fun onClick(view: View)
}