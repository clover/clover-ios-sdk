
import ObjectMapper

public class CLVDateTransform: TransformType {
  public typealias Object = NSDate
  public typealias JSON = Double

  public init() {}

  public func transformFromJSON(value: AnyObject?) -> NSDate? {
    if let timeInt = value as? Double {
      return NSDate(timeIntervalSince1970: NSTimeInterval(timeInt / 1000))
    }
    return nil
  }

  public func transformToJSON(value: NSDate?) -> Double? {
    if let date = value {
      return Double(date.timeIntervalSince1970 * 1000)
    }
    return nil
  }
}
