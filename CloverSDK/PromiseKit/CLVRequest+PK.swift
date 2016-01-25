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

public enum CLVError: ErrorType {
  case Error(NSError)
}

extension CLVRequest {
  
  /// Get a single Clover object using a RETRIEVE endpoint
  public func makeRequestWithPromise<T: Mappable>(objectType objectType: T.Type) -> Promise<T> {
    print(__FUNCTION__)
    return Promise { fulfill, reject in
      logIfDebug("url", obj: getUrlString())
      logIfDebug("headers", obj: getHeaders())
      logIfDebug("payload", obj: payload)
      Alamofire.request(httpMethod, getUrlString(), parameters: payload, encoding: .JSON, headers: getHeaders())/*.validate()*/.responseJSON { response in
        switch response.result {
        case .Success(let data):
          guard let obj = Mapper<T>().map(JSON(data).object) else { reject(NSError(domain: "", code: 0, userInfo: nil)); return }
          fulfill(obj)
        case .Failure(let error): print(__FUNCTION__); logIfDebug("error", obj: error); reject(CLVError.Error(error))
        }
      }
    }
  }
  
  /// Get an array of Clover objects using a LIST endpoint
  public func makeRequestWithPromise<T: Mappable>(arrayType arrayType: T.Type) -> Promise<[T]> {
    print(__FUNCTION__)
    logIfDebug(__FUNCTION__)
    return Promise { fulfill, reject in
      //      logIfDebug("url", obj: getUrlString())
      //      logIfDebug("headers", obj: getHeaders())
      //      logIfDebug("payload", obj: payload)
      Alamofire.request(httpMethod, getUrlString(), parameters: payload, encoding: .JSON, headers: getHeaders())/*.validate()*/.responseJSON { response in
        switch response.result {
        case .Success(let data):
          fulfill(JSON(data)["elements"].arrayValue.map({ Mapper<T>().map($0.object)! })) // todo: no force-unwrapping!!!
        case .Failure(let error): print(__FUNCTION__); logIfDebug("error", obj: error); reject(CLVError.Error(error))
        }
      }
    }
  }
  
  /// Get AnyObject
  public func makeRequestWithPromise() -> Promise<AnyObject> {
    print(__FUNCTION__)
    return Promise { fulfill, reject in
      logIfDebug("url", obj: getUrlString())
      logIfDebug("headers", obj: getHeaders())
      logIfDebug("payload", obj: payload)
      Alamofire.request(httpMethod, getUrlString(), parameters: payload, encoding: .JSON, headers: getHeaders())/*.validate()*/.responseJSON { response in
        switch response.result {
        case .Success(let data):  fulfill(JSON(data).object)
        case .Failure(let error): print(__FUNCTION__); logIfDebug("error", obj: error); reject(CLVError.Error(error))
        }
      }
    }
  }
  
}
