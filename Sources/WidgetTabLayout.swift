//
//  WidgetTabLayout.swift
//  Android
//
//  Created by Marco Estrella on 10/18/18.
//

import Foundation
import java_swift
import java_lang
import JNI

public extension Android.Widget {
    
    public typealias TabLayout = AndroidTabLayout
}

open class AndroidTabLayout: AndroidHorizontalScrollView {
    
    // MARK: - Initialization
    
    public required init( javaObject: jobject? ) {
        super.init(javaObject: javaObject)
    }
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString = #file,
                              _ line: Int = #line ) {
        
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public convenience init(context: Android.Content.Context){
        
        self.init(javaObject: nil)
        bindNewJavaObject(context: context)
    }
    
    public override func bindNewJavaObject(context: Android.Content.Context){
        
        let hasOldJavaObject = javaObject != nil
        
        /// Release old swift value.
        if hasOldJavaObject {
            
            try! finalize()
        }
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 1 )
        __args[0] = JNIType.toJava(value: context, locals: &__locals)
        
        let __object = JNIMethod.NewObject(
            className: JNICacheTabLayout.className,
            classCache: &JNICacheTabLayout.jniClass,
            methodSig: "(Landroid/content/Context;)V",
            methodCache: &JNICacheTabLayout.MethodID.newMethod,
            args: &__args,
            locals: &__locals )
        
        self.javaObject = __object
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension AndroidTabLayout {
    
}

internal extension AndroidTabLayout {
    
    /// JNI Cache
    struct JNICacheTabLayout {
        
        /// JNI Java class signature
        static let classSignature = SupportDesign.Widget.className(["TabLayout"])
        
        /// JNI Java class name
        static let className = classSignature.rawValue
        
        /// JNI Java class
        static var jniClass: jclass?
        
        /// JNI Method ID cache
        struct MethodID {
            static var newMethod: jmethodID?
            static var addOnTabSelectedListener: jmethodID?
            static var addTab1: jmethodID?
            static var addTab2: jmethodID?
            static var addTab3: jmethodID?
            static var addTab4: jmethodID?
            static var addView1: jmethodID?
            static var addView2: jmethodID?
            static var addView3: jmethodID?
            static var addView4: jmethodID?
            static var clearOnTabSelectedListeners: jmethodID?
            static var generateLayoutParams: jmethodID?
            static var getSelectedTabPosition: jmethodID?
            static var getTabAt: jmethodID?
            static var getTabCount: jmethodID?
            static var getTabGravity: jmethodID?
            static var getTabMod: jmethodID?
            static var getTabTextColors: jmethodID?
            static var newTab: jmethodID?
            static var removeAllTabs: jmethodID?
            static var removeOnTabSelectedListener: jmethodID?
            static var removeTab: jmethodID?
            static var removeTabAt: jmethodID?
            static var setScrollPosition: jmethodID?
            static var setSelectedTabIndicatorColor: jmethodID?
            static var setSelectedTabIndicatorHeight: jmethodID?
            static var setTabGravity: jmethodID?
            static var setTabMode: jmethodID?
            static var setTabTextColors1: jmethodID?
            static var setTabTextColors2: jmethodID?
            static var setupWithViewPager1: jmethodID?
            static var setupWithViewPager2: jmethodID?
            static var shouldDelayChildPressedState: jmethodID?
        }
    }
}


// MARK: OnTabSelectedListener

public extension AndroidTabLayout {
    
    /// Callback interface invoked when a tab's selection state changes.
    public class OnTabSelectedListener {
        
    }
}

// MARK: TabLayoutOnPageChangeListener

public extension AndroidTabLayout {
    
    /// A ViewPager.OnPageChangeListener class which contains the necessary calls back to the provided TabLayout so that the tab position is kept in sync.
    public class TabLayoutOnPageChangeListener {
        
    }
}

// MARK: ViewPagerOnTabSelectedListener

public extension AndroidTabLayout {
    
    /// A TabLayout.OnTabSelectedListener class which contains the necessary calls back to the provided ViewPager so that the tab position is kept in sync.
    public class ViewPagerOnTabSelectedListener {
        
    }
}

