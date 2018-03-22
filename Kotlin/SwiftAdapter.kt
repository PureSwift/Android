package com.jmarkstar.swiftandroid

import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter

/**
 * Created by coleman on 3/18/18.
 */

open class SwiftAdapter(__swiftObject: Long) : BaseAdapter() {

    val __swiftObject: Long

    init {

        this.__swiftObject = __swiftObject
    }

    external fun __finalize(__swiftObject: Long)

    fun finalize() {
        __finalize(__swiftObject)
    }

    // adapter

    private external fun __getCount(__swiftObject: Long): Int;

    override fun getCount(): Int {

        return __getCount(__swiftObject)
    }

    override fun getItem(position: Int): Any? {

        return null
    }

    override fun getItemId(position: Int): Long {

        return position.toLong()
    }

    private external fun __getView(__swiftObject: Long, position: Int, convertView: View?, parent: ViewGroup): View;

    override fun getView(position: Int, convertView: View?, parent: ViewGroup): View {

        return __getView(__swiftObject, position, convertView, parent)

        /*
        val view: View
        val cell: CustomCell

        // create
        if (convertView == null) {

            view = inflater!!.inflate(R.layout.cell, parent, false)

            cell = CustomCell()
            cell.textView = view.findViewById(R.id.textView) as TextView

            view.tag = cell

        } else {

            view = convertView
            cell = view.tag as CustomCell
        }

        // configure
        listener.configureCell(cell, position)

        return view
        */
    }
}