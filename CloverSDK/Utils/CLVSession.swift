//
//  CLVSession.swift
//  CloverSDK
//
//  Created by Yusuf on 12/17/15.
//  Copyright © 2015 Clover Network, Inc. All rights reserved.
//

public class CLVSession {
  
  public var token: String
  public var merchantId: String
  public var employeeId: String?
  public var clientId: String?
  public var domain: CLVServerEnvironment
  
  public static var debugMode: Bool = false
  public static var debugPrintOptions: [CLVDebugPrintOption] = [.URL, .TIME_FILTERS, .HEADERS, .PAYLOAD, .STATUS_CODE, .RESPONSE_DATA]
  
  public init(accessToken token: String, domain: CLVServerEnvironment, merchantId: String, employeeId: String? = nil, clientId: String? = nil) {
    self.token = token
    self.merchantId = merchantId
    self.employeeId = employeeId
    self.clientId = clientId
    self.domain = domain
  }
  
  // todo: failable init? with token verification
  
}
