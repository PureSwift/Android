package com.pureswift.swiftandroid

import android.util.Log
import android.view.View
import android.view.ViewGroup
import android.widget.LinearLayout
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.RecyclerView.ViewHolder

class RecyclerViewAdapter(val swiftObject: SwiftObject) :
    RecyclerView.Adapter<ViewHolder>() {

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {

    }

    // Create new views (invoked by the layout manager)
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerViewAdapter.ViewHolder {
        Log.d("RecyclerViewAdapter", "SwiftAndroidApp.RecyclerViewAdapter.onCreateViewHolderSwift(_:_:) $viewType")
        val view = LinearLayout(parent.context)
        val viewHolder = ViewHolder(view)
        checkNotNull(viewHolder)
        checkNotNull(viewHolder.itemView)
        return viewHolder
    }

    // Replace the contents of a view (invoked by the layout manager)
    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
        onBindViewHolderSwift(holder as RecyclerViewAdapter.ViewHolder, position)
    }

    external fun onBindViewHolderSwift(holder: RecyclerViewAdapter.ViewHolder, position: Int)

    // Return the size of your dataset (invoked by the layout manager)
    override fun getItemCount(): Int {
        return getItemCountSwift()
    }

    external fun getItemCountSwift(): Int
}