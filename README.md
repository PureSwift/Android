# AndroidKit

Swift bindings to Android SDK (via Java Native Interface) and NDK.

## Compile

Tested against [Skip Tools](https://skip.tools/docs/gettingstarted/#installation)

There is an included example Android application under `/Demo`. 

```
cd Demo
./setup.sh
./build-swift.sh
```

Then you can compile the app from the Android IDE.

## Drawing with Silica

`AndroidSilica` draws [Silica](https://github.com/PureSwift/Silica)'s drawing API on `android.graphics.Canvas`. It is a product of its own, and `AndroidKit` doesn't include it.

```swift
import AndroidSilica

let context = try AndroidCanvasContext(pdf: url, size: CGSize(width: 200, height: 200))
// ... CoreGraphics style drawing code ...
try context.finish() // writes the PDF
```

`AndroidCanvasContext` also has `init(bitmap:)` for raster output, and `init(canvas:size:)` to draw into a canvas you already have, such as the one a view's draw pass hands you.

- Requires **API 31+** at runtime for glyph rendering (`Canvas.drawGlyphs`, `TextRunShaper`).
- `finish()` is **mandatory** for PDF contexts — the document is only written to disk when it is called.
- JNI-backed objects must be used from a JVM-attached thread; create, use, and finish a context on the same thread.
- The linear (scale/rotation) components of the text matrix are not applied to glyph shapes.
- Unknown font names fall back to the system typeface (Android provides no font-matching failure signal).
- Shadows are drawn without blur (a silhouette at the shadow offset).

### See Also

- [AndroidSwiftUI](https://github.com/PureSwift/AndroidSwiftUI) - SwiftUI for Android
- [AndroidBluetooth](https://github.com/PureSwift/AndroidBluetooth) - Swift Bluetooth stack for Android
- [BluetoothLinux](https://github.com/PureSwift/BluetoothLinux) - Pure Swift Linux Bluetooth Stack
- [CoreModel](https://github.com/PureSwift/CoreModel) - Pure Swift ORM
