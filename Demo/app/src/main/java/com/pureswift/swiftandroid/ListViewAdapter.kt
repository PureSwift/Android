package com.pureswift.swiftandroid

import android.R
import android.content.Context
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import androidx.recyclerview.widget.RecyclerView

class ListViewAdapter<T: Any>(context: Context, val swiftObject: SwiftObject, val objects: ArrayList<T>) :
    ArrayAdapter<T>(context, 0, objects) {

        external override fun getView(position: Int, convertView: View?, parent: ViewGroup): View
}
