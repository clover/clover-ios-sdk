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
  
  internal func getV3GetRequest(v3Endpoint: CLVV3Endpoint, options: [CLVParamOptions] = [], var pathParams: [String:String] = [:]) -> CLVRequest {
    if v3Endpoint.rawValue =~ "\\{mId\\}" { pathParams["mId"] = self.merchantId }
    return CLVRequest.Builder(httpMethod: .GET, domain: self.domain, endpoint: .V3(v3Endpoint))
      .accessToken(self.token).pathParams(pathParams).addOptions(options).build()
  }
  
  public func getV3GetRequest(v3Endpoint: CLVV3Endpoint, var pathParams: [String:String] = [:],
    filters: [String:String] = [:], expands: [String] = [], sorts: [String:SortType] = [:],
    params: [String:String] = [:], limit: UInt = 100, offset: UInt = 0) -> CLVRequest {
      if v3Endpoint.rawValue =~ "\\{mId\\}" { pathParams["mId"] = self.merchantId }
      print(pathParams)
      return CLVRequest.Builder(httpMethod: .GET, domain: self.domain, endpoint: .V3(v3Endpoint))
        .accessToken(self.token).pathParams(pathParams)
        .filters(filters).expands(expands).sorts(sorts).params(params).limit(limit).offset(offset).build()
  }
  
}
