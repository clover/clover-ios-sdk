//
//  CLVSessionExtension.swift
//  CloverSDK
//
//  Created by Yusuf on 3/13/16.
//  Copyright © 2016 Clover Network, Inc. All rights reserved.
//

import ObjectMapper

public typealias SortType = CLVRequest.SortType
public typealias ErrorHandler = (CLVError) -> Void

extension CLVSession {
  
  // MARK: - Helper methods for request
  
  internal func getV3GetRequest(v3Endpoint: V3Endpoint, options: [CLVParamOptions] = [], var pathParams: [String:String] = [:]) -> CLVRequest {
    if v3Endpoint.rawValue =~ "\\{mId\\}" { pathParams["mId"] = self.merchantId }
    return CLVRequest.Builder(httpMethod: .GET, domain: self.domain, endpoint: .V3(v3Endpoint))
      .accessToken(self.token).pathParams(pathParams).addOptions(options).build()
  }
  
  public func getV3GetRequest(v3Endpoint: V3Endpoint, var pathParams: [String:String] = [:],
    filters: [String:String] = [:], expands: [String] = [], sorts: [String:SortType] = [:],
    params: [String:String] = [:], limit: UInt = 100, offset: UInt = 0) -> CLVRequest {
      if v3Endpoint.rawValue =~ "\\{mId\\}" { pathParams["mId"] = self.merchantId }
      print(pathParams)
      return CLVRequest.Builder(httpMethod: .GET, domain: self.domain, endpoint: .V3(v3Endpoint))
        .accessToken(self.token).pathParams(pathParams)
        .filters(filters).expands(expands).sorts(sorts).params(params).limit(limit).offset(offset).build()
  }
  
  // MARK: - Experimental methods
  
  internal func getArray<T: Mappable>(t: T.Type, endpoint: V3Endpoint, queryParams: [String:String] = [:], options: [CLVParamOptions] = [],
    success: ([T]) -> Void, failure: (CLVError) -> Void) {
      getV3GetRequest(endpoint, options: options, pathParams: queryParams).makeRequestArr(success, failure)
  }
  
  internal func getObject<T: Mappable>(t: T.Type, endpoint: V3Endpoint, queryParams: [String:String] = [:], options: [CLVParamOptions] = [],
    success: (T?) -> Void, failure: (CLVError) -> Void) {
      getV3GetRequest(endpoint, options: options, pathParams: queryParams).makeRequestObj(success, failure)
  }
  
  private func testGetMerchantWGetObject(options: [CLVParamOptions] = [], success: (CLVModels.Merchant.Merchant?) -> Void, failure: (CLVError) -> Void) {
    getObject(CLVModels.Merchant.Merchant.self, endpoint: .MERCHANT, queryParams: ["":""], options: [.Filters(["":""])], success: { m in }, failure: {err in })
  }
  
  private func testGetMerchantWGetObjectCall() {
    testGetMerchantWGetObject([], success: { m in }, failure: { err in })
  }
  
  //
  
  internal func get<T: Mappable>(endpoint: V3Endpoint, arrayType: T.Type, queryParams: [String:String] = [:], options: [CLVParamOptions] = [],
    success: ([T]) -> Void, failure: (CLVError) -> Void) {
      getV3GetRequest(endpoint, options: options, pathParams: queryParams).makeRequestArr(success, failure)
  }
  
  internal func get<T: Mappable>(endpoint: V3Endpoint, objectType: T.Type, queryParams: [String:String] = [:], options: [CLVParamOptions] = [],
    success: (T?) -> Void, failure: (CLVError) -> Void) {
      getV3GetRequest(endpoint, options: options, pathParams: queryParams).makeRequestObj(success, failure)
  }
  
  private func testGetMerchantWGet(options: [CLVParamOptions] = [], success: (CLVModels.Merchant.Merchant?) -> Void, failure: (CLVError) -> Void) {
    get(.MERCHANT, objectType: CLVModels.Merchant.Merchant.self, queryParams: [:], options: options, success: success, failure: failure)
  }
  
  private func testGetMerchantWGetCall() {
    testGetMerchantWGet([], success: { obj in }, failure: {err in })
    testGetMerchantWGet([.Params(["fmc": "dhfd"]), .Filters(["name": "yusuf"]), .Expands(["address"]), .Sorts(["id": .DESC]), .Limit(100), .Offset(0)], success: { merchant in }, failure: { err in })
  }
  
  //
  
  private func testGetMerchantWV3RequestAndOptions(options: [CLVParamOptions] = [], success: (CLVModels.Merchant.Merchant?) -> Void, failure: (CLVError) -> Void) {
    getV3GetRequest(.MERCHANT, options: options).makeRequestObj(success, failure)
  }
  
  private func testGetMerchantWV3RequestAndOptionsCall() {
    testGetMerchantWV3RequestAndOptions([], success: { merc in }, failure: { err in })
  }
  
  //
  
  private func testGetMerchantWParams(filters filters: [String:String] = [:], expands: [String] = [],
    sorts: [String:SortType] = [:], params: [String:String] = [:], limit: UInt = 100, offset: UInt = 0,
    success: (CLVModels.Merchant.Merchant?) -> Void, failure: (CLVError) -> Void) {
      getV3GetRequest(.MERCHANT, params: params, filters: filters, expands: expands, sorts: sorts, limit: limit, offset: offset, pathParams: [:])
        .makeRequestObj(success, failure)
  }
  
  private func testGetMerchantWParamsCall() {
    testGetMerchantWParams(success: { m in }, failure: { err in})
    testGetMerchantWParams(params: ["":""], filters: ["":""], expands: [""], sorts: [:], limit: 100, offset: 0, success: { m in }, failure: { err in})
  }
  
  //
  
  private func testM() {
    getMerchant_(filters: [:], expands: [], sorts: [:], params: [:], limit: 0, offset: 0, success: {m in}, failure: {e in})
    getMerchant_(filters: [:], success: {m in}, failure: {e in})
  }
  
  public func getMerchant_(filters filters: [String:String] = [:], expands: [String] = [],
    sorts: [String:SortType] = [:], params: [String:String] = [:], limit: UInt = 100, offset: UInt = 0,
    success: (CLVModels.Merchant.Merchant?) -> Void, failure: ErrorHandler) {
      getV3GetRequest(.MERCHANT, pathParams: [:], filters: filters, expands: expands, sorts: sorts, params: params, limit: limit, offset: offset)
        .makeRequestObj(success, failure)
  }
  
  
  
  
  //  public class func getApps(params params: [String:String] = [:], filters: [String:String] = [:], expands: [String] = [], sorts: [String:CLVRequest.SortType] = [:], limit: UInt = 100, offset: UInt = 0, success: ([CLVModels.Apps.App]) -> Void, failure: (CLVError) -> Void = {print($0)}) {
  //    CLVRequest.Builder(httpMethod: .GET, domain: .US, endpoint: .V3(.APPS)).params(params).filters(filters).expands(expands).sorts(sorts).limit(limit).offset(offset).build()
  //      .makeRequest(arrayType: CLVModels.Apps.App.self, success: success, failure: failure)
  //  }
  //  
  //  
  //  public class func getAccount(accountToken: String, params: [String:String] = [:], filters: [String:String] = [:], expands: [String] = [], sorts: [String:CLVRequest.SortType] = [:], limit: UInt = 100, offset: UInt = 0, success: (CLVModels.Account.Account?) -> Void, failure: (CLVError) -> Void = {print($0)}) {
  //    CLVRequest.Builder(httpMethod: .GET, domain: .US, endpoint: .V3(.ACCOUNT)).accessToken(accountToken).params(params).filters(filters).expands(expands).sorts(sorts).limit(limit).offset(offset).build()
  //      .makeRequest(objectType: CLVModels.Account.Account.self, success: success, failure: failure)
  //  }
  
  
}
