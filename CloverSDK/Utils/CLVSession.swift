//
//  CLVSession.swift
//  CloverSDK
//
//  Created by Yusuf on 12/17/15.
//  Copyright © 2015 Clover Network, Inc. All rights reserved.
//

open class CLVSession {
  
  open var token: String
  open var merchantId: String
  open var employeeId: String?
  open var clientId: String?
  open var domain: CLVServerEnvironment
  
  open static var debugMode: Bool = false
  open static var debugPrintOptions: [CLVDebugPrintOption] = [.url, .time_FILTERS, .headers, .payload, .status_CODE, .response_DATA]
  
  public init(accessToken token: String, domain: CLVServerEnvironment, merchantId: String, employeeId: String? = nil, clientId: String? = nil) {
    self.token = token
    self.merchantId = merchantId
    self.employeeId = employeeId
    self.clientId = clientId
    self.domain = domain
  }
  
  // todo: failable init? with token verification
  
}
