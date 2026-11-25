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

`AndroidSilica` draws [Silica](https://github.com/PureSwift/Silica)'s drawing API on `android.graphics.Canvas`, with `AndroidCanvasRenderer`. It is a product of its own, and `AndroidKit` doesn't include it.

```swift
import AndroidSilica

let context = GraphicsContext(try AndroidCanvasRenderer(pdf: url, size: Silica.Size(width: 200, height: 200)))
context.fill(Silica.Path(ellipseIn: Silica.Rect(x: 20, y: 20, width: 160, height: 160)), with: .red)
try context.finish() // writes the PDF
```

`AndroidCanvasRenderer` also has `init(bitmap:scale:)` for pixels, and `init(canvas:size:scale:)` to draw into a canvas you already have, such as the one a view's draw pass hands you. AndroidGraphics has its own `Path`, `Rect`, `Point`, `Color`, `Font` and `BlendMode`: in a file that imports both, write Silica's with the module name.

- Requires **API 31+** at runtime for glyph rendering (`Canvas.drawGlyphs`, `TextRunShaper`).
- `finish()` is **mandatory** for PDF contexts — the document is only written to disk when it is called.
- JNI-backed objects must be used from a JVM-attached thread; create, use, and finish a context on the same thread.
- Unknown font names fall back to the system typeface (Android provides no font-matching failure signal).
- Shadows are drawn without blur (a silhouette at the shadow offset).
- Blend modes `PorterDuff` lacks draw as normal (color dodge and burn, soft and hard light, difference, exclusion, hue, saturation, color, luminosity, plus darker), and a transparency layer casts no shadow.
- Radial gradients have one center: two circles with different centers draw around the end circle's.

### See Also

- [AndroidSwiftUI](https://github.com/PureSwift/AndroidSwiftUI) - SwiftUI for Android
- [AndroidBluetooth](https://github.com/PureSwift/AndroidBluetooth) - Swift Bluetooth stack for Android
- [BluetoothLinux](https://github.com/PureSwift/BluetoothLinux) - Pure Swift Linux Bluetooth Stack
- [CoreModel](https://github.com/PureSwift/CoreModel) - Pure Swift ORM
