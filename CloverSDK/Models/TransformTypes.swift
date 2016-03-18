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
  public typealias JSON = UInt64
  
  public init() {}
  
  public func transformFromJSON(value: AnyObject?) -> NSDate? {
    if let timeInt = value as? UInt64 {
      return NSDate(timeIntervalSince1970: NSTimeInterval(timeInt / 1000))
    }
    return nil
  }
  
  public func transformToJSON(value: NSDate?) -> UInt64? {
    if let date = value {
      return UInt64(date.timeIntervalSince1970 * 1000)
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
