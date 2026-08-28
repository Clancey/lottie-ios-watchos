// Created for the watchOS port.

import CoreGraphics
import Foundation
#if os(watchOS)
import ImageIO
#else
import UIKit
#endif

/// Decodes image bytes to a `CGImage`.
///
/// UIKit is deliberately absent from the watchOS build. Importing it there
/// re-exports the SDK's CoreAnimation declarations - the ones marked
/// `API_UNAVAILABLE(watchos)` - and because Swift compiles this module as a
/// whole, a single file importing UIKit makes those gated declarations win
/// over the shim for *every* file. ImageIO reads the same bytes with no such
/// side effect.
func lottieDecodeCGImage(_ data: Data) -> CGImage? {
  #if os(watchOS)
  guard let source = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }
  return CGImageSourceCreateImageAtIndex(source, 0, nil)
  #else
  return UIImage(data: data)?.cgImage
  #endif
}
