//
//  ContentIntent.swift
//  Android
//
//  Created by Killian Greene on 6/21/18.
//

import Foundation
import java_swift
import java_util
import java_lang

public extension Android.Content {
    public typealias Intent = AndroidIntent
}

public final class AndroidIntent: JavaObject {
    
    public convenience init?( casting object: java_swift.JavaObject,
                              _ file: StaticString =  #file,
                              _ line: Int = #line) {
        self.init(javaObject: nil)
        
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    public convenience init(){
        
        var __locals = [jobject]()
        var __args = [jvalue](repeating: jvalue(), count: 0)
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "()V",
            methodCache: &JNICache.MethodID.init_method1,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(o: Android.Content.Intent){
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: o, locals: &__locals)
        ]
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(Landroid/content/Intent;)V",
            methodCache: &JNICache.MethodID.init_method2,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
    
    public convenience init(action: String){
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: action, locals: &__locals)
        ]
        
        let __object = JNIMethod.NewObject(
            className: JNICache.className,
            classCache: &JNICache.jniClass,
            methodSig: "(Ljava/lang/String;)V",
            methodCache: &JNICache.MethodID.init_method3,
            args: &__args,
            locals: &__locals )
        
        self.init( javaObject: __object )
        
        JNI.DeleteLocalRef( __object )
    }
}

public extension Android.Content.Intent {
    
    public static var ACTION_SEND: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACTION_SEND",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACTION_SEND,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    public static var ACTION_SENDTO: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "ACTION_SENDTO",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.ACTION_SENDTO,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    public static var EXTRA_EMAIL: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "EXTRA_EMAIL",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.EXTRA_EMAIL,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    public static var EXTRA_SUBJECT: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "EXTRA_SUBJECT",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.EXTRA_SUBJECT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
    
    public static var EXTRA_TEXT: String {
        
        get {
            
            let __value = JNIField.GetStaticObjectField(
                fieldName: "EXTRA_TEXT",
                fieldType: "Ljava/lang/String;",
                fieldCache: &JNICache.FieldID.EXTRA_TEXT,
                className: JNICache.className,
                classCache: &JNICache.jniClass )
            defer { JNI.DeleteLocalRef(__value) }
            return String(javaObject: __value)
        }
    }
}

public extension Android.Content.Intent {
    
    /**
     * Retrieve extended data from the intent. (Boolean)
     */
    public func getBooleanExtra(name: String, defaultValue: Bool) -> Bool {
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            jvalue(z: jboolean(defaultValue ? JNI_TRUE : JNI_FALSE)),
            JNIType.toJava(value: name, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallBooleanMethod(object: javaObject,
                                                   methodName: "getBooleanExtra",
                                                   methodSig: "(Ljava/lang/String;Z)Z",
                                                   methodCache: &JNICache.MethodID.getBooleanExtra,
                                                   args: &__args,
                                                   locals: &__locals)
        
        return __return != jboolean(JNI_FALSE)
    }
    
    /**
     * Retrieve extended data from the intent. (Byte array)
     */
    public func getByteArrayExtra(name: String) -> [Int8]? {
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: name, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "getByteArrayExtra",
                                                  methodSig: "(Ljava/lang/String;)[B",
                                                  methodCache: &JNICache.MethodID.getByteArrayExtra,
                                                  args: &__args,
                                                  locals: &__locals)
        
        return JNIType.toSwift(type: [Int8].self, from: __return)
    }
    
    /**
     * Retrieve extended data from the intent. (Byte)
     */
    public func getByteExtra(name: String) -> Int8 {
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: name, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallByteMethod(object: javaObject,
                                                methodName: "getByteExtra",
                                                methodSig: "(Ljava/lang/String;)B",
                                                methodCache: &JNICache.MethodID.getByteExtra,
                                                args: &__args,
                                                locals: &__locals)
        
        return Int8(__return)
    }
    
    /**
     * Retrieve extended data from the intent. (Int)
     */
    public func getIntExtra(name: String, defaultValue: Int) -> Int {
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: name, locals: &__locals),
            jvalue(i: jint(defaultValue))
        ]
        
        let __return = JNIMethod.CallIntMethod(object: javaObject,
                                               methodName: "getIntExtra",
                                               methodSig: "(Ljava/lang/String;I)I",
                                               methodCache: &JNICache.MethodID.getIntExtra,
                                               args: &__args,
                                               locals: &__locals)
        
        return Int(__return)
    }
    
    /**
     * Add extended data to the intent. (long[])
     */
    @discardableResult
    public func putExtra(name: String, value: [Int64]) -> Android.Content.Intent {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: name, locals: &__locals),
            JNIType.toJava(value: value, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "putExtra",
                                                  methodSig: "(Ljava/lang/String;[J)Landroid/content/Intent;",
                                                  methodCache: &JNICache.MethodID.putExtra2,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return Android.Content.Intent(javaObject: __return)
    }
    
    /**
     * Add extended data to the intent. (byte)
     */
    @discardableResult
    public func putExtra(name: String, value: Int8) -> Android.Content.Intent {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: name, locals: &__locals),
            jvalue(b: jbyte(value))
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "putExtra",
                                                  methodSig: "(Ljava/lang/String;B)Landroid/content/Intent;",
                                                  methodCache: &JNICache.MethodID.putExtra3,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return Android.Content.Intent(javaObject: __return)
    }
    
    /**
     * Add extended data to the intent. (int)
     */
    @discardableResult
    public func putExtra(name: String, value: Int) -> Android.Content.Intent {
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value:name, locals: &__locals),
            jvalue(i: jint(value))
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "putExtra",
                                                  methodSig: "(Ljava/lang/String;I)Landroid/content/Intent;",
                                                  methodCache: &JNICache.MethodID.putExtra7,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return Android.Content.Intent(javaObject: __return)
    }
    
    /**
     * Add extended data to the intent. (double)
     */
    @discardableResult
    public func putExtra(name: String, value: Double) -> Android.Content.Intent {
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value:name, locals: &__locals),
            jvalue(d: jdouble(value))
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "putExtra",
                                                  methodSig: "(Ljava/lang/String;D)Landroid/content/Intent;",
                                                  methodCache: &JNICache.MethodID.putExtra14,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return Android.Content.Intent(javaObject: __return)
    }
    
    /**
     * Add extended data to the intent. (int[])
     */
    @discardableResult
    public func putExtra(name: String, value: [Int]) -> Android.Content.Intent {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: name, locals: &__locals),
            JNIType.toJava(value: value, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "putExtra",
                                                  methodSig: "(Ljava/lang/String;[I)Landroid/content/Intent;",
                                                  methodCache: &JNICache.MethodID.putExtra15,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return Android.Content.Intent(javaObject: __return)
    }
    
    /**
     * Add extended data to the intent. (String)
     */
    @discardableResult
    public func putExtra(name: String, value: String) -> Android.Content.Intent {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: name, locals: &__locals),
            JNIType.toJava(value: value, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "putExtra",
                                                  methodSig: "(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;",
                                                  methodCache: &JNICache.MethodID.putExtra19,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return Android.Content.Intent(javaObject: __return)
    }
    
    @discardableResult
    public func putExtra(name: String, value: [String]) -> Android.Content.Intent {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: name, locals: &__locals),
            JNIType.toJava(value: value, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "putExtra",
                                                  methodSig: "(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;",
                                                  methodCache: &JNICache.MethodID.putExtra20,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return Android.Content.Intent(javaObject: __return)
    }
    
    @discardableResult
    public func setType(_ type: String) -> Android.Content.Intent {
        
        var __locals = [jobject]()
        
        var __args: [jvalue] = [
            JNIType.toJava(value: type, locals: &__locals)
        ]
        
        let __return = JNIMethod.CallObjectMethod(object: javaObject,
                                                  methodName: "setType",
                                                  methodSig: "(Ljava/lang/String;)Landroid/content/Intent;",
                                                  methodCache: &JNICache.MethodID.setType,
                                                  args: &__args,
                                                  locals: &__locals)
        
        defer { JNI.DeleteLocalRef(__return) }
        
        return Android.Content.Intent(javaObject: __return)
    }
    
    public static func createChooser(intent: AndroidIntent, title: String) throws -> AndroidIntent {
        
        var __locals = [jobject]()
        
        var __args = [jvalue]( repeating: jvalue(), count: 2 )
        
        __args[0] = JNIType.toJava(value: intent, locals: &__locals)
        __args[1] = JNIType.toJava(value: title, locals: &__locals)
        
        let __return = JNIMethod.CallStaticObjectMethod(className: JNICache.className,
                                                        classCache: &JNICache.jniClass,
                                                        methodName: "createChooser",
                                                        methodSig: "(L\(AndroidIntent.JNICache.className);Ljava/lang/CharSequence;)L\(AndroidIntent.JNICache.className);",
            methodCache: &JNICache.MethodID.createChooser,
            args: &__args,
            locals: &__locals )
        
        if let throwable = JNI.ExceptionCheck() {
            
            defer { JNI.DeleteLocalRef( throwable ) }
            throw java_lang.InterruptedException( javaObject: throwable )
        }
        
        return  AndroidIntent(javaObject: __return)
    }
    
}

private extension Android.Content.Intent {
    // JNI Cache
    struct JNICache {
        
        static let classSignature = Android.Content.className(["Intent"])
        
        // JNI Java class name
        static let className = classSignature.rawValue
        
        // JNI Java class
        static var jniClass: jclass?
        
        // JNI Field ID cache
        struct FieldID {
            
            static var ACTION_SENDTO: jfieldID?
            static var ACTION_SEND: jfieldID?
            static var EXTRA_EMAIL: jfieldID?
            static var EXTRA_SUBJECT: jfieldID?
            static var EXTRA_TEXT: jfieldID?
        }
        
        // JNI Method ID cache
        struct MethodID {
            static var init_method1: jmethodID?
            static var init_method2: jmethodID?
            static var init_method3: jmethodID?
            static var getBooleanExtra: jmethodID?
            static var getByteArrayExtra: jmethodID?
            static var getByteExtra: jmethodID?
            static var getIntExtra: jmethodID?
            static var putExtra2: jmethodID?
            static var putExtra3: jmethodID?
            static var putExtra7: jmethodID?
            static var putExtra14: jmethodID?
            static var putExtra15: jmethodID?
            static var putExtra19: jmethodID?
            static var putExtra20: jmethodID?
            static var setType: jmethodID?
            static var createChooser: jmethodID?
        }
    }
}
