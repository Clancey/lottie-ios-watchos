// Created for the watchOS port.

#if os(watchOS)
import CAShim

/// Restores the shorthand spellings of Core Animation's string-backed enums.
///
/// These are `NS_TYPED_ENUM` typedefs over `NSString *`. Swift does import
/// members for them from the shim - the API notes see to that - but it derives
/// the names from the constants rather than from the SDK's own spelling, so
/// `kCAGravityResize` arrives as `.gravityResize` where Lottie says `.resize`.
/// Aliasing here keeps every call site in the library untouched, which matters
/// for a fork that has to be rebased on upstream.
extension CALayerContentsGravity {
  public static let resize = Self.gravityResize
  public static let resizeAspect = Self.gravityResizeAspect
  public static let resizeAspectFill = Self.gravityResizeAspectFill
  public static let center = Self.gravityCenter
  public static let top = Self.gravityTop
  public static let bottom = Self.gravityBottom
  public static let left = Self.gravityLeft
  public static let right = Self.gravityRight
}

extension CAMediaTimingFillMode {
  public static let forwards = Self.fillModeForwards
  public static let backwards = Self.fillModeBackwards
  public static let both = Self.fillModeBoth
  public static let removed = Self.fillModeRemoved
}

extension CAShapeLayerFillRule {
  public static let nonZero = Self.fillRuleNonZero
  public static let evenOdd = Self.fillRuleEvenOdd
}

extension CAShapeLayerLineCap {
  public static let butt = Self.lineCapButt
  public static let round = Self.lineCapRound
  public static let square = Self.lineCapSquare
}

extension CAShapeLayerLineJoin {
  public static let miter = Self.lineJoinMiter
  public static let round = Self.lineJoinRound
  public static let bevel = Self.lineJoinBevel
}

extension CATextLayerAlignmentMode {
  public static let natural = Self.alignmentNatural
  public static let left = Self.alignmentLeft
  public static let right = Self.alignmentRight
  public static let center = Self.alignmentCenter
  public static let justified = Self.alignmentJustified
}
#endif
