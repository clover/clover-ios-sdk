//
//  CLVRequest+PromiseKit.swift
//  CloverDashboard
//
//  Created by Yusuf on 12/7/15.
//  Copyright © 2015 Yusuf. All rights reserved.
//

import Alamofire
import SwiftyJSON
import ObjectMapper
import PromiseKit

extension CLVRequest {
  
  /// Get a single Clover object using a RETRIEVE endpoint
  public func makeRequestWithPromise<T: Mappable>(objectType objectType: T.Type) -> Promise<T> {
    return Promise { fulfill, reject in
      Alamofire.request(httpMethod, getUrlString(), parameters: payload, encoding: .JSON, headers: getHeaders()).validate().responseJSON { response in
        switch self.validateResponse(response: response) {
        case .SUCCESS(let value): fulfill(Mapper<T>().map(JSON(value).object)!)
        case .FAILURE(let error): reject(error)
        }
      }
    }
  }
  
  /// Get an array of Clover objects using a LIST endpoint
  public func makeRequestWithPromise<T: Mappable>(arrayType arrayType: T.Type) -> Promise<[T]> {
    return Promise { fulfill, reject in
      Alamofire.request(httpMethod, getUrlString(), parameters: payload, encoding: .JSON, headers: getHeaders()).validate().responseJSON { response in
        switch self.validateResponse(response: response) {
        case .SUCCESS(let value): fulfill(JSON(value)["elements"].arrayValue.map({ Mapper<T>().map($0.object)! }))
        case .FAILURE(let error): reject(error)
        }
      }
    }
  }
  
  /// Get AnyObject
  public func makeRequestWithPromise() -> Promise<AnyObject> {
    return Promise { fulfill, reject in
      Alamofire.request(httpMethod, getUrlString(), parameters: payload, encoding: .JSON, headers: getHeaders()).validate().responseJSON { response in
        switch self.validateResponse(response: response) {
        case .SUCCESS(let value): fulfill(JSON(value).object)
        case .FAILURE(let error): reject(error)
        }
      }
    }
  }
  
}
