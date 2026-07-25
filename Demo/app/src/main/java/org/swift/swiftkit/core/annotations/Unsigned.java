// Android-compatible copy of SwiftKitCore's Unsigned annotation.
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
 * Value is of an unsigned numeric type.
 * <p>
 * This annotation is used to annotate java integer primitives when their
 * corresponding Swift type was actually unsigned, e.g. an {@code @Unsigned long}
 * in a method signature corresponds to a Swift {@code UInt64} type, and therefore
 * negative values reported by the signed {@code long} should instead be interpreted positive values,
 * larger than {@code Long.MAX_VALUE} that are just not representable using a signed {@code long}.
 * <p>
 * If this annotation is used on a method, it refers to the return type using an unsigned integer.
 */
@Documented
@Target({TYPE_USE, PARAMETER, FIELD, METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Unsigned {
}
