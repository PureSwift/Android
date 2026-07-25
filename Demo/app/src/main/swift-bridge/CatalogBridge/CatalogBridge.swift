// Minimal jextract JNI spike: a closure/Runnable callback exposed to Java.

public func runBlock(block: () -> Void) {
  block()
}

public func addOne(input: Int64) -> Int64 {
  input + 1
}
