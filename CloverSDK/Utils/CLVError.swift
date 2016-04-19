//
//  CLVError.swift
//  CloverSDK
//
//  Created by Yusuf on 3/8/16.
//  Copyright © 2016 Clover Network, Inc. All rights reserved.
//

import Foundation

public enum CLVError: ErrorType {
  case Error(NSError)
  case UnacceptableStatusCode(statusCode: Int, serverMessage: String)
  case TooManyRequestsException
  case UnknownError
  
  public var error: NSError {
    switch self {
    case .Error(let error): return error
    case .UnacceptableStatusCode(let statusCode, let serverMessage): return CLVError.generateNSError(code: -42, userInfo: ["statusCode": statusCode, "serverMessage": serverMessage])
    case .TooManyRequestsException: return CLVError.generateNSError(code: -429, userInfo: ["statusCode": 429])
    case .UnknownError: return CLVError.generateNSError()
    }
  }
  
  internal static func generateNSError(code code: Int = -1, userInfo: [NSObject:AnyObject] = [:]) -> NSError {
    let domain = "com.clover.sdk.error"
    return NSError(domain: domain, code: code, userInfo: userInfo)
  }
  
}
