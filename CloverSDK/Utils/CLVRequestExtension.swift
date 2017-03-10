//
//  CLVRequestExtension.swift
//  CloverSDK
//
//  Created by Yusuf on 3/15/16.
//  Copyright © 2016 Clover Network, Inc. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON
import ObjectMapper

extension CLVRequest {
  
  // MARK: - Make Request methods:
  
  /// Get a single Clover object using a RETRIEVE endpoint
  public func makeRequestObj<T: Mappable>(_ success: @escaping (T?) -> Void, _ failure: @escaping ErrorHandler) {
    makeRequestAndGetResponseValidation() { validation in
      switch validation {
      case .SUCCESS(let value): success(self.mapObject(value))
      case .FAILURE(let error): failure(error)
      case .UNAUTHORIZED_EXCEPTION_401: failure(CLVError.unauthorizedException)
      case .TOO_MANY_REQUESTS_EXCEPTION_429:
        if CLVRequest.retryFailedRequestsWith429 { self.makeRequestObj(0, success, failure) }
        else { failure(CLVError.tooManyRequestsException) }
      }
    }
  }
  
  fileprivate func makeRequestObj<T: Mappable>(_ retryCount: Int, _ success: @escaping (T?) -> Void, _ failure: @escaping ErrorHandler) {
    log429(retryCount)
    do_after(seconds: (2**retryCount) + 0.1) {
      self.makeRequestAndGetResponseValidation() { validation in
        switch validation {
        case .SUCCESS(let value): success(self.mapObject(value)); self.log429Success(retryCount)
        case .FAILURE(let error): failure(error)
        case .UNAUTHORIZED_EXCEPTION_401: failure(CLVError.unauthorizedException)
        case .TOO_MANY_REQUESTS_EXCEPTION_429:
          if retryCount < CLVRequest.retryCountAfter429 { self.makeRequestObj(retryCount + 1, success, failure) }
          else { failure(CLVError.tooManyRequestsException) }
        }
      }
    }
  }
  
  /// Get an array of Clover objects using a LIST endpoint
  public func makeRequestArr<T: Mappable>(_ success: @escaping ([T]) -> Void, _ failure: @escaping ErrorHandler) {
    self.makeRequestAndGetResponseValidation() { validation in
      switch validation {
      case .SUCCESS(let value): success(self.mapArray(value))
      case .FAILURE(let error): failure(error)
      case .UNAUTHORIZED_EXCEPTION_401: failure(CLVError.unauthorizedException)
      case .TOO_MANY_REQUESTS_EXCEPTION_429:
        if CLVRequest.retryFailedRequestsWith429 { self.makeRequestArr(0, success, failure) }
        else { failure(CLVError.tooManyRequestsException) }
      }
    }
  }
  
  fileprivate func makeRequestArr<T: Mappable>(_ retryCount: Int, _ success: @escaping ([T]) -> Void, _ failure: @escaping ErrorHandler) {
    log429(retryCount)
    do_after(seconds: (2**retryCount) + 0.1) {
      self.makeRequestAndGetResponseValidation() { validation in
        switch validation {
        case .SUCCESS(let value): success(self.mapArray(value)); self.log429Success(retryCount)
        case .FAILURE(let error): failure(error)
        case .UNAUTHORIZED_EXCEPTION_401: failure(CLVError.unauthorizedException)
        case .TOO_MANY_REQUESTS_EXCEPTION_429:
          if retryCount < CLVRequest.retryCountAfter429 { self.makeRequestArr(retryCount + 1, success, failure) }
          else { failure(CLVError.tooManyRequestsException) }
        }
      }
    }
  }
  
  /// Get AnyObject
  public func makeRequest(_ success: @escaping (AnyObject?) -> Void, _ failure: @escaping ErrorHandler) {
    self.makeRequestAndGetResponseValidation() { validation in
      switch validation {
      case .SUCCESS(let value): success(self.mapAnyObject(value))
      case .FAILURE(let error): failure(error)
      case .UNAUTHORIZED_EXCEPTION_401: failure(CLVError.unauthorizedException)
      case .TOO_MANY_REQUESTS_EXCEPTION_429:
        if CLVRequest.retryFailedRequestsWith429 { self.makeRequest(0, success, failure) }
        else { failure(CLVError.tooManyRequestsException) }
      }
    }
  }
  
  fileprivate func makeRequest(_ retryCount: Int, _ success: @escaping (AnyObject?) -> Void, _ failure: @escaping ErrorHandler) {
    log429(retryCount)
    do_after(seconds: (2**retryCount) + 0.1) {
      self.makeRequestAndGetResponseValidation() { validation in
        switch validation {
        case .SUCCESS(let value): success(self.mapAnyObject(value))
        case .FAILURE(let error): failure(error)
        case .UNAUTHORIZED_EXCEPTION_401: failure(CLVError.unauthorizedException)
        case .TOO_MANY_REQUESTS_EXCEPTION_429:
          if retryCount < CLVRequest.retryCountAfter429 { self.makeRequest(retryCount + 1, success, failure) }
          else { failure(CLVError.tooManyRequestsException) }
        }
      }
    }
  }
  
  
  // MARK: - CLVRequestQueue
  
  class CLVRequestQueue {
    fileprivate static var queue: [() -> Void] = []
    weak fileprivate static var timer: Timer?
    
    class func addRequestToQueue(_ request: @escaping () -> Void) {
      queue.append(request)
      activateTimer()
    }
    
    @objc fileprivate class func makeFirstRequest() {
      if !queue.isEmpty { queue.removeFirst()() }
      else { deactivateTimer() }
    }
    
    fileprivate class func activateTimer() {
      guard timer == nil else { return }
      timer = Timer.scheduledTimer(timeInterval: CLVRequest.requestRateLimitTime, target: self, selector: #selector(makeFirstRequest), userInfo: nil, repeats: true)
    }
    
    fileprivate class func deactivateTimer() {
      timer?.invalidate()
    }
  }
  
  
  // MARK: - Helpers
  
  // Closures to handle data in success calls:
  func mapObject<T: Mappable>(_ value: AnyObject) -> T? { return Mapper<T>().map(JSONObject: JSON(value).object) }
  func mapArray<T: Mappable>(_ value: AnyObject) -> [T] {
    return JSON(value)["elements"].arrayValue.map({ Mapper<T>().map(JSONObject: $0.object)! })
  }
  func mapAnyObject(_ value: AnyObject) -> AnyObject { return JSON(value).object as AnyObject }
  
  func makeRequestAndGetResponseValidation(_ switchBlock: @escaping (CLVValidation) -> Void) {
    if let requestValidationError = validateCLVRequest() {
      switchBlock(.FAILURE(requestValidationError))
      return
    }
    
    let makeRequestBlock: () -> Void = {
//        Alamofire.request(self.getUrlString(), method: self.httpMethod, parameters: self.payload, encoding: .JSON, headers: self.getHeaders())
//            .validate()
//            .responseJSON(completionHandler: {
//                response in
//                switchBlock(self.validateResponse(response: response))
//            })
        let req = Alamofire.request(self.getUrlString(), method: .get, parameters: self.payload, encoding: JSONEncoding.default, headers: self.getHeaders())
        let validation = req.validate()
        validation.responseJSON { response in
          switchBlock(self.validateResponse(response: response))
        }
    }
    
    if CLVRequest.autoDelayRequests { CLVRequestQueue.addRequestToQueue(makeRequestBlock) }
    else { makeRequestBlock() }
  }
  
  public enum CLVValidation {
    case SUCCESS(AnyObject)
    case FAILURE(CLVError)
    case TOO_MANY_REQUESTS_EXCEPTION_429
    case UNAUTHORIZED_EXCEPTION_401
  }
  
    
  /// This validation function is necessary because Alamofire's .validate() method ignores the server messages if it's a non-200 status code
  /// To be used post-request
  internal func validateResponse(response: DataResponse<Any>) -> CLVValidation {
//    logRequest(responseData: response.value, statusCode: response.response?.statusCode)
    if let error = response.result.error {
      if let statusCode = response.response?.statusCode, let data = response.data, error._code == -6003 {
        if statusCode == 429 { return .TOO_MANY_REQUESTS_EXCEPTION_429 }
        if statusCode == 401 { return .UNAUTHORIZED_EXCEPTION_401 }
        let serverMessage = JSON(data: data)["message"].stringValue
        return .FAILURE(CLVError.unacceptableStatusCode(statusCode: statusCode, serverMessage: serverMessage))
      } else {
        return .FAILURE(CLVError.Error(response.error!))
      }
    } else {
      guard let result = response.result.value else { return .FAILURE(CLVError.unknownError) }
      return .SUCCESS(response.result.value as AnyObject)
    }
  }
  
  /// Validates the CLVRequest object to be called before making a request to make sure it has necessary values filled in
  internal func validateCLVRequest() -> CLVError? {
    // todo: potentially add more validations
    return (getUrlString() =~ "\\{(\\w*)\\}")
      ? CLVError.Error(CLVError.generateNSError(code: -1, userInfo: ["MISSING_PATH_PARAMS_ERROR" as NSObject: getUrlString() as AnyObject]))
      : nil
  }
  
  internal func log429(_ retryCount: Int) {
    logIfDebug("429 received, retry count: \(retryCount + 1)" as AnyObject?)
  }
  
  internal func log429Success(_ retryCount: Int) {
    logIfDebug("Success on retry: \(retryCount + 1) after 429" as AnyObject?)
  }
  
}
