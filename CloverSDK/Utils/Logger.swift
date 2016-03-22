//
//  Logging.swift
//  CloverSDK
//
//  Created by Yusuf on 3/8/16.
//  Copyright © 2016 Clover Network, Inc. All rights reserved.
//

import SwiftyJSON

// MARK: - Logger

func logIfDebug(title: String, obj: AnyObject?) {
  guard CLVSession.debugMode else { return }
  guard let obj = obj else { return }
  
  switch obj {
  case let dict as [String:String]: if !dict.isEmpty { log("\(title): \(dict)") }
  case let data as NSData: log("\(title): \(JSON(data: data))")
  default: log("\(title): \(obj)")
  }
}

func logIfDebug(obj: AnyObject?) {
  guard CLVSession.debugMode else { return }
  guard let obj = obj  else { return }
  log("\(obj)")
}

private func log(str: String) {
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
      case .URL: logIfDebug("url", obj: getUrlString())
      case .TIME_FILTERS: logIfDebug("time filters", obj: getTimeFiltersDebugPrint())
      case .HEADERS: logIfDebug("headers", obj: getHeaders())
      case .PAYLOAD: logIfDebug("payload", obj: payload)
      case .STATUS_CODE: logIfDebug("status code", obj: statusCode)
      case .RESPONSE_DATA: logIfDebug("response data", obj: data)
      }
    }
  }
}

public enum CLVDebugPrintOption {
  case URL, TIME_FILTERS, HEADERS, PAYLOAD, STATUS_CODE, RESPONSE_DATA
}
