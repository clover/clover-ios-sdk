//
//  CLVRequest.swift
//  CloverDashboard
//
//  Created by Yusuf on 12/17/15.
//  Copyright © 2015 Clover Network, Inc. All rights reserved.
//

import Alamofire
import SwiftyJSON
import ObjectMapper

open class CLVRequest {
  
  static var retryFailedRequestsWith429: Bool = true
  fileprivate static var retryCount: Int = 5
  static var retryCountAfter429: Int {
    get { return self.retryCount }
    set { self.retryCount = newValue <= 5 ? newValue : 5 }
  }
  
  open static var autoDelayRequests: Bool = true
  open static var requestRateLimit: Int = 15
  open static var requestRateLimitTime: Double = 1 / Double(CLVRequest.requestRateLimit)
  
  open static var headers = [String:String]()
  
  // MARK: - Properties
  
  let httpMethod: HTTPMethod
  let domain: CLVServerEnvironment
  let endpoint: CLVEndpoint
  let accessToken: String?
  let pathParams: [String:String]
  let params: [String:String]
  let filters: [String:String]
  let expands: [String]
  let sorts: [String:SortType]
  let limit: UInt
  let offset: UInt
  let timeFilters: CloverAPITimeFilters?
  let payload: [String:AnyObject]?
  let debugMode: Bool = true
  
  fileprivate init(builder: Builder) {
    self.httpMethod = builder.httpMethod
    self.domain = builder.domain
    self.endpoint = builder.endpoint
    self.accessToken = builder.accessToken
    self.pathParams = builder.pathParams
    self.params = builder.params
    self.filters = builder.filters
    self.expands = builder.expands
    self.sorts = builder.sorts
    self.limit = builder.limit
    self.offset = builder.offset
    self.timeFilters = builder.timeFilters
    self.payload = builder.payload
  }
  
  // MARK: - Enums
  
  public enum SortType: String {
    case ASC = "ASC"
    case DESC = "DESC"
  }  
  
  public enum TimeFilterType: String {
    case CREATED_TIME = "createdTime"
    case CLIENT_CREATED_TIME = "clientCreatedTime"
    case TIMESTAMP = "timestamp"
    case START_END_TIMESTAMP
  }
  
  public struct CloverAPITimeFilters {
    var startTime: Date?
    var endTime: Date?
    var timeFilterType: TimeFilterType
    
    /// Initialize with required fields
    public init(startTime: Date? = nil, endTime: Date? = nil, timeFilterType: TimeFilterType) {
      self.startTime = startTime
      self.endTime = endTime
      self.timeFilterType = timeFilterType
    }
  }
  
  // MARK: - Helper Methods
  
  
  internal class func getFiltersUrlString(_ filters: [String:String]) -> String {
    return filters.map({(k,v) in return "filter=\(k)=\(v)"}).joined(separator: "&")
  }
  
  internal class func getUrlParameterString(_ parameters: [String]) -> String {
    return "?" + parameters.joined(separator: "&")
  }
  
  internal func getUrlString() -> String {
    let urlParams = getUrlParams().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    return "\(domain.rawValue)\(getEndpointString())?\(urlParams)"
  }
  
  fileprivate func getEndpointString() -> String {
    switch endpoint {
    case .v3(let v3): return replacePathParams(v3.rawValue)
    case .custom(let str): return replacePathParams(str)
    }
  }
  
  fileprivate func replacePathParams(_ endpoint: String) -> String {
    var endpointVar = endpoint
    for (param, value) in self.pathParams where endpointVar =~ "\\{\(param)\\}" {
      endpointVar = endpointVar.replacingOccurrences(of: "\\{\(param)\\}", with: "\(value)", options: .regularExpression)
    }
    return endpointVar
  }
  
  fileprivate func getUrlParams() -> String {
    let urlParams = [getParameters(), getFilters(), getTimeFilters(), getExpands(), getSorts(), getLimit(), getOffset()]
    return urlParams.filter({!$0.isEmpty}).joined(separator: "&")
  }
  
  fileprivate func getParameters() -> String {
    return params.map({(k,v) in return "\(k)=\(v)"}).joined(separator: "&")
  }
  
  fileprivate func getFilters() -> String {
    return filters.map({(k,v) in return "filter=\(k)=\(v)"}).joined(separator: "&")
  }
  
  fileprivate func getTimeFilters() -> String {
    guard let timeFilters = timeFilters, let startTime = timeFilters.startTime, let endTime = timeFilters.endTime else { return "" }
    let start = Int64(startTime.timeIntervalSince1970 * 1000)
    let end = Int64(endTime.timeIntervalSince1970 * 1000)
    switch timeFilters.timeFilterType {
    case .START_END_TIMESTAMP: return "startTimestamp=\(start)&endTimestamp=\(end)"
    default: return "filter=\(timeFilters.timeFilterType.rawValue)>\(start)&filter=\(timeFilters.timeFilterType.rawValue)<\(end)"
    }
  }
  
  fileprivate func getExpands() -> String {
    return expands.count > 0 ? "expand=" + expands.joined(separator: ",") : ""
  }
  
  fileprivate func getSorts() -> String {
    return sorts.count > 0 ? "order_by=" + sorts.map({(k,v) in return "\(k)+\(v.rawValue)"}).joined(separator: "&") : ""
  }
  
  fileprivate func getLimit() -> String {
    return limit != 100 ? "limit=\(limit)" : ""
  }
  
  fileprivate func getOffset() -> String {
    return offset != 0 ? "offset=\(offset)" : ""
  }
  
  internal func getHeaders() -> [String:String] {
    var headers = CLVRequest.headers
    if let accessToken = accessToken, !accessToken.isEmpty {
      headers.updateContentsOf(["Authorization": "Bearer \(accessToken)"])
    }
    return headers
  }
  
  // MARK: - Builder
  
  open class Builder {
    fileprivate var httpMethod: HTTPMethod
    fileprivate var domain: CLVServerEnvironment
    fileprivate var endpoint: CLVEndpoint
    fileprivate var accessToken: String?
    fileprivate var pathParams: [String:String] = [:]
    fileprivate var params: [String:String] = [:]
    fileprivate var filters: [String:String] = [:]
    fileprivate var expands: [String] = []
    fileprivate var sorts: [String:SortType] = [:]
    fileprivate var limit: UInt = 100
    fileprivate var offset: UInt = 0
    fileprivate var timeFilters: CloverAPITimeFilters?
    fileprivate var payload: [String:AnyObject]?
    
    /// Initialize with default values for requred fields: httpMethod = .GET, domain = .US, endpoint = "/v3/"
    public init() {
      self.httpMethod = HTTPMethod.get
      self.domain = .US
      self.endpoint = .custom("/v3/")
    }
    
    /// Initialize with required fields
    public init(httpMethod: HTTPMethod, domain: CLVServerEnvironment, endpoint: CLVEndpoint) {
      self.httpMethod = httpMethod
      self.domain = domain
      self.endpoint = endpoint
    }
    
    /// Initialize with a CLVRequest.Builder object
    public init(cloverRequestBuilder: CLVRequest.Builder) {
      self.httpMethod = cloverRequestBuilder.httpMethod
      self.domain = cloverRequestBuilder.domain
      self.endpoint = cloverRequestBuilder.endpoint
      self.accessToken = cloverRequestBuilder.accessToken
      self.pathParams = cloverRequestBuilder.pathParams
      self.params = cloverRequestBuilder.params
      self.filters = cloverRequestBuilder.filters
      self.expands = cloverRequestBuilder.expands
      self.sorts = cloverRequestBuilder.sorts
      self.limit = cloverRequestBuilder.limit
      self.offset = cloverRequestBuilder.offset
      self.timeFilters = cloverRequestBuilder.timeFilters
      self.payload = cloverRequestBuilder.payload
    }
    
    /// Initialize with a CLVRequest object
    public init(cloverRequest: CLVRequest) {
      self.httpMethod = cloverRequest.httpMethod
      self.domain = cloverRequest.domain
      self.endpoint = cloverRequest.endpoint
      self.accessToken = cloverRequest.accessToken
      self.pathParams = cloverRequest.pathParams
      self.params = cloverRequest.params
      self.filters = cloverRequest.filters
      self.expands = cloverRequest.expands
      self.sorts = cloverRequest.sorts
      self.limit = cloverRequest.limit
      self.offset = cloverRequest.offset
      self.timeFilters = cloverRequest.timeFilters
      self.payload = cloverRequest.payload
    }
    
    open func build() -> CLVRequest {
      return CLVRequest(builder: self) // validate()
    }
    
    open func httpMethod(_ httpMethod: HTTPMethod)                     -> Builder { self.httpMethod = httpMethod; return self }
    open func domain(_ domain: CLVServerEnvironment)                   -> Builder { self.domain = domain; return self }
    open func endpoint(_ endpoint: CLVEndpoint)                        -> Builder { self.endpoint = endpoint; return self }
    open func accessToken(_ accessToken: String? = nil)                -> Builder { self.accessToken = accessToken; return self }
    open func pathParams(_ pathParams: [String:String] = [:])          -> Builder { self.pathParams = pathParams; return self }
    open func params(_ params: [String:String] = [:])                  -> Builder { self.params = params; return self }
    open func filters(_ filters: [String:String] = [:])                -> Builder { self.filters = filters; return self }
    open func expands(_ expands: [String] = [])                        -> Builder { self.expands = expands; return self }
    open func sorts(_ sorts: [String:SortType] = [:])                  -> Builder { self.sorts = sorts; return self }
    open func limit(_ limit: UInt = 100)                               -> Builder { self.limit = limit; return self }
    open func offset(_ offset: UInt = 0)                               -> Builder { self.offset = offset; return self }
    open func timeFilters(_ timeFilters: CloverAPITimeFilters? = nil)  -> Builder { self.timeFilters = timeFilters; return self }
    open func payload(_ payload: [String:AnyObject]? = nil)            -> Builder { self.payload = payload; return self }
    
    open func addPathParams(_ pathParams: [String:String])             -> Builder { self.pathParams.updateContentsOf(pathParams); return self }
    open func removePathParams(_ pathParams: [String:String])          -> Builder { self.pathParams.removeContentsOf(pathParams); return self }
    open func removePathParams(_ keys: [String])                       -> Builder { self.pathParams.removeContentsOf(keys); return self }
    
    /// Update params with contents of
    open func addParams(_ params: [String:String])                     -> Builder { self.params.updateContentsOf(params); return self }
    /// Remove params that exist in
    open func removeParams(_ params: [String:String])                  -> Builder { self.params.removeContentsOf(params); return self }
    /// Remove params for keys
    open func removeParams(_ keys: [String])                           -> Builder { self.params.removeContentsOf(keys); return self }
    
    open func addFilters(_ filters: [String:String])                   -> Builder { self.filters.updateContentsOf(filters); return self }
    open func removeFilters(_ filters: [String:String])                -> Builder { self.filters.removeContentsOf(filters); return self }
    open func removeFilters(_ keys: [String])                          -> Builder { self.filters.removeContentsOf(keys); return self }
    
    open func addExpands(_ expands: [String])                          -> Builder { self.expands.append(contentsOf: expands); return self }
    open func removeExpands(_ expands: [String])                       -> Builder { self.expands.removeContentsOf(expands); return self }
    
    open func addSorts(_ sorts: [String:SortType])                     -> Builder { self.sorts.updateContentsOf(sorts); return self }
    open func removeSorts(_ sorts: [String:SortType])                  -> Builder { self.sorts.removeContentsOf(sorts); return self }
    open func removeSorts(_ keys: [String])                            -> Builder { self.sorts.removeContentsOf(keys); return self }
    
    internal func addOptions(_ options: [CLVParamOptions]) -> CLVRequest.Builder {
      for option in options {
        switch option {
        case let .params(params):   self.params(params)
        case let .filters(filters): self.filters(filters)
        case let .expands(expands): self.expands(expands)
        case let .sorts(sorts):     self.sorts(sorts)
        case let .limit(limit):     self.limit(limit)
        case let .offset(offset):   self.offset(offset)
        }
      }
      return self
    }
    
  }
}

public enum CLVParamOptions {
  case params([String:String])
  case filters([String:String])
  case expands([String])
  case sorts([String:CLVRequest.SortType])
  case limit(UInt)
  case offset(UInt)
}

