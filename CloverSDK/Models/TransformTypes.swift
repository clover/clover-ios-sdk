//
//  TransformTypes.swift
//  CloverSDK
//
//  Created by Yusuf on 12/24/15.
//  Copyright © 2015 Clover Network, Inc. All rights reserved.
//

import SwiftyJSON
import ObjectMapper

public class CLVDateTransform: TransformType {
  public typealias Object = NSDate
  public typealias JSON = Double
  
  public init() {}
  
  public func transformFromJSON(value: AnyObject?) -> NSDate? {
    guard let timeInt = value as? Double else { return nil }
    return NSDate(timeIntervalSince1970: NSTimeInterval(timeInt / 1000))
  }
  
  public func transformToJSON(value: NSDate?) -> Double? {
    guard let date = value else { return nil }
    return date.timeIntervalSince1970 * 1000
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
    guard let value = value else { return nil }
    return Mapper<T>().toJSONArray(value)
  }
}
