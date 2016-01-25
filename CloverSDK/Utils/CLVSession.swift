//
//  CLVSession.swift
//  CloverDashboard
//
//  Created by Yusuf on 12/17/15.
//  Copyright © 2015 Clover Network, Inc. All rights reserved.
//

public class CLVSession {
  
  public var token: String
  public var merchantId: String
  public var employeeId: String
  public var clientId: String
  public var domain: CLVServerEnvironment
  
  public var merchant: CLVModels.Merchant.Merchant?
  public var employee: CLVModels.Employees.Employee?
  
  public var debugging: Bool = true
  
  public init(merchantToken token: String, merchantId: String, employeeId: String, clientId: String, domain: CLVServerEnvironment, fetchMerchant: Bool = false, fetchEmployee: Bool = false) {
    self.token = token
    self.merchantId = merchantId
    self.employeeId = employeeId
    self.clientId = clientId
    self.domain = domain
    
    // todo: fill in merchant object?
  }
  
  // todo: init? with token verification
}