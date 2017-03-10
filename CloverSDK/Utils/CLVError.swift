//
//  CLVError.swift
//  CloverSDK
//
//  Created by Yusuf on 3/8/16.
//  Copyright © 2016 Clover Network, Inc. All rights reserved.
//

import Foundation

public enum CLVError: Error {
  case Error(Error)
  case unacceptableStatusCode(statusCode: Int, serverMessage: String)
  case tooManyRequestsException
  case unauthorizedException
  case unknownError
  
  public var error: Error {
    switch self {
    case .Error(let error): return error
    case .unacceptableStatusCode(let statusCode, let serverMessage): return CLVError.generateNSError(code: -42, userInfo: ["statusCode": statusCode, "serverMessage": serverMessage])
    case .tooManyRequestsException: return CLVError.generateNSError(code: -429, userInfo: ["statusCode": 429])
    case .unauthorizedException: return CLVError.generateNSError(code: -401, userInfo: ["statusCode": 401])
    case .unknownError: return CLVError.generateNSError()
    }
  }
  
  internal static func generateNSError(code: Int = -1, userInfo: [AnyHashable: Any] = [:]) -> NSError {
    let domain = "com.clover.sdk.error"
    return NSError(domain: domain, code: code, userInfo: userInfo)
  }
  
}
