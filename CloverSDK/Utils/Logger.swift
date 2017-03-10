//
//  Logging.swift
//  CloverSDK
//
//  Created by Yusuf on 3/8/16.
//  Copyright © 2016 Clover Network, Inc. All rights reserved.
//

import SwiftyJSON

// MARK: - Logger

func logIfDebug(_ title: String, obj: AnyObject?) {
  guard CLVSession.debugMode else { return }
  guard let obj = obj else { return }
  
  switch obj {
  case let dict as [String:String]: if !dict.isEmpty { log("\(title): \(dict)") }
  case let data as Data: log("\(title): \(JSON(data: data))")
  default: log("\(title): \(obj)")
  }
}

func logIfDebug(_ obj: AnyObject?) {
  guard CLVSession.debugMode else { return }
  guard let obj = obj  else { return }
  log("\(obj)")
}

private func log(_ str: String) {
  // todo: add more output alternatives by defining a class var on CLVSession
  print(str)
}

extension CLVRequest {
  func getTimeFiltersDebugPrint() -> String? {
    guard let timeFilters = self.timeFilters else { return nil }
    return "from: \(timeFilters.startTime?.description ?? ""), to: \(timeFilters.endTime?.description ?? "")"
  }
  
  func logRequest(responseData data: AnyObject? = nil, statusCode: Int? = nil) {
    for option in CLVSession.debugPrintOptions {
      switch option {
      case .url: logIfDebug("url", obj: getUrlString() as AnyObject?)
      case .time_FILTERS: logIfDebug("time filters", obj: getTimeFiltersDebugPrint() as AnyObject?)
      case .headers: logIfDebug("headers", obj: getHeaders() as AnyObject?)
      case .payload: logIfDebug("payload", obj: payload as AnyObject?)
      case .status_CODE: logIfDebug("status code", obj: statusCode as AnyObject?)
      case .response_DATA: logIfDebug("response data", obj: data)
      }
    }
  }
}

public enum CLVDebugPrintOption {
  case url, time_FILTERS, headers, payload, status_CODE, response_DATA
}
