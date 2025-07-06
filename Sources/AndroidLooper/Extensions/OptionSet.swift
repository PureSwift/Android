//
//  OptionSet.swift
//  SwiftAndroid
//
//  Created by Alsey Coleman Miller on 7/6/25.
//

extension OptionSet {
  // Helper method for building up a comma-separated list of options
  //
  // Taking an array of descriptions reduces code size vs
  // a series of calls due to avoiding register copies. Make sure
  // to pass an array literal and not an array built up from a series of
  // append calls, else that will massively bloat code size. This takes
  // StaticStrings because otherwise we get a warning about getting evicted
  // from the shared cache.
  @inline(never)
  internal func _buildDescription(
    _ descriptions: [(Element, StaticString)]
  ) -> String {
    var copy = self
    var result = "["

    for (option, name) in descriptions {
      if _slowPath(copy.contains(option)) {
        result += name.description
        copy.remove(option)
        if !copy.isEmpty { result += ", " }
      }
    }

    if _slowPath(!copy.isEmpty) {
      result += "\(Self.self)(rawValue: \(copy.rawValue))"
    }
    result += "]"
    return result
  }
}
