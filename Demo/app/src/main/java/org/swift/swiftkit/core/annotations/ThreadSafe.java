// Android-compatible copy of SwiftKitCore's ThreadSafe annotation.
// The upstream file uses `jdk.jfr` meta-annotations which are unavailable
// on Android, so it is excluded from the imported source set and replaced
// by this equivalent declaration.

package org.swift.swiftkit.core.annotations;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.*;

/**
 * Used to mark a type as thread-safe, i.e. no additional synchronization is necessary when accessing it
 * from multiple threads.
 *
 * <p> In SwiftJava specifically, this attribute is applied when an extracted Swift type conforms to the Swift
 * {@code Sendable} protocol, which is a compiler enforced mechanism to enforce thread-safety in Swift.
 *
 * @see <a href="https://developer.apple.com/documentation/Swift/Sendable">Swift Sendable API documentation</a>.
 */
@Documented
@Target({TYPE_USE})
@Retention(RetentionPolicy.RUNTIME)
public @interface ThreadSafe {
}
