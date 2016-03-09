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
  case UnknownError
  
  var error: NSError {
    let domain = "com.clover.sdk.error"
    switch self {
    case .Error(let error): return error
    case .UnacceptableStatusCode(let statusCode, let serverMessage): return NSError(domain: domain, code: -42, userInfo: ["statusCode": statusCode, "serverMessage": serverMessage])
    case .UnknownError: return NSError(domain: domain, code: -1, userInfo: [:])
    }
  }
  
}
