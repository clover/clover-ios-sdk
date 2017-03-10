//
//  TransformTypes.swift
//  CloverSDK
//
//  Created by Yusuf on 12/24/15.
//  Copyright © 2015 Clover Network, Inc. All rights reserved.
//

import SwiftyJSON
import ObjectMapper

open class CLVDateTransform: TransformType {
  public typealias Object = Date
  public typealias JSON = Double
  
  public init() {}
  
  open func transformFromJSON(_ value: Any?) -> Date? {
    guard let timeInt = value as? Double else { return nil }
    return Date(timeIntervalSince1970: TimeInterval(timeInt / 1000))
  }
  
  open func transformToJSON(_ value: Date?) -> Double? {
    guard let date = value else { return nil }
    return date.timeIntervalSince1970 * 1000
  }
}

/*open class CLVArrayTransform<T: Mappable>: TransformType {
  public typealias Object = [T]
  public typealias JSON = AnyObject
  
  public init() {}
  
  /*open func transformFromJSON(_ value: Any?) -> [T]? {
    guard let obj = value as? NSDictionary, let arr = obj.value(forKey: "elements") as? NSArray else { return nil }
    return arr.map({ item in Mapper<T>().map(JSONObject: item)! })
  }
  
  open func transformToJSON(_ value: [T]?) -> Any? {
    if let val = value {
        return Mapper<T>().toJSONArray(val)
    }
    return nil
//    return Mapper<T>().toJSONArray(value as! [_])
  }*/
    
    
    
    public func transformFromJSON(_ value: Any?) -> Object? {
        if let obj = value as? NSDictionary, let arr = obj.value(forKey: "elements") as? NSArray {
               return arr.map({ item in Mapper<T>().map(JSONObject: item)! })
        } else {
            return nil
        }
        
    }
    public func transformToJSON(_ value: [T]?) -> JSON? {
        if let val = value {
            return Mapper<T>().toJSONArray(val)
        }
        return nil
        
    }
}*/
