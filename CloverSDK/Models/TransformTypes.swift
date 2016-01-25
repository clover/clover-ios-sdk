
import SwiftyJSON
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

public class CLVArrayTransform<T: Mappable>: TransformType {
  public typealias Object = [T]
  public typealias JSON = AnyObject
  
  public init() {}
  
  public func transformFromJSON(value: AnyObject?) -> [T]? {
    guard let obj = value as? NSDictionary, let arr = obj.valueForKey("elements") as? NSArray else { return nil }
    return arr.map({ item in Mapper<T>().map(item)! })
  }
  
  public func transformToJSON(value: [T]?) -> AnyObject? {
    return nil
  }
}
