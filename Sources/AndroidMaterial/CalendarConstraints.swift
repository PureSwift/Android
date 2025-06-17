//
//  CalendarConstraints.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 6/16/25.
//

import JavaKit

/**
 Used to limit the display range of the calendar and set an openAt month.

 Implements `Parcelable` in order to maintain the `CalendarConstraints` across device configuration changes. `Parcelable` breaks when passed between processes.
 */
@JavaClass("com.google.android.material.datepicker.CalendarConstraints")
open class CalendarConstraints: JavaObject {
    
    
}
