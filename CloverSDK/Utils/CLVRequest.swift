
import Alamofire
import SwiftyJSON
import ObjectMapper

public class CLVRequest {
  
  // MARK: - Properties
  
  let httpMethod: Alamofire.Method
  let domain: CLVServerEnvironment
  let endpoint: Endpoint
  let accessToken: String?
  let params: [String:String]
  let filters: [String:String]
  let expands: [String]
  let sorts: [String:SortType]
  let limit: UInt
  let offset: UInt
  let timeFilters: CloverAPITimeFilters?
  let payload: [String:AnyObject]?
  let debugMode: Bool = true // todo
  
  private init(builder: Builder) {
    self.httpMethod = builder.httpMethod
    self.domain = builder.domain
    self.endpoint = builder.endpoint
    self.accessToken = builder.accessToken
    self.params = builder.params // urlParams?
    self.filters = builder.filters
    self.expands = builder.expands
    self.sorts = builder.sorts
    self.limit = builder.limit
    self.offset = builder.offset
    self.timeFilters = builder.timeFilters
    self.payload = builder.payload
  }
  
  // MARK: - Main Methods
  
  //  func validate() -> Self { // todo
  //    return self
  //  }
  
  internal enum CLVValidation {
    case SUCCESS(AnyObject)
    case FAILURE(CLVError)
  }
  
  /// This validation function is necessary because Alamofire's .validate() method ignores the server messages if it's a non-200 status code
  internal func validateResponse(response response: Response<AnyObject, NSError>) -> CLVValidation {
    logRequest(responseData: response.data, statusCode: response.response?.statusCode)
    if let error = response.result.error {
      if let statusCode = response.response?.statusCode, data = response.data where error.code == -6003 {
        let serverMessage = JSON(data: data)["message"].stringValue
        return .FAILURE(CLVError.UnacceptableStatusCode(statusCode: statusCode, serverMessage: serverMessage))
      } else {
        return .FAILURE(CLVError.Error(error))
      }
    } else {
      guard let result = response.result.value else { return .FAILURE(CLVError.UnknownError) }
      return .SUCCESS(result)
    }
  }
  
  
  /// Get a single Clover object using a RETRIEVE endpoint
  public func makeRequest<T: Mappable>(objectType objectType: T.Type, success: (T?) -> Void = {print($0)}, failure: (CLVError) -> Void = {print($0)}) {
    Alamofire.request(httpMethod, getUrlString(), parameters: payload, encoding: .JSON, headers: getHeaders()).validate().responseJSON { response in
      switch self.validateResponse(response: response) {
      case .SUCCESS(let value): success(Mapper<T>().map(JSON(value).object))
      case .FAILURE(let error): failure(error)
      }
    }
  }
  
  /// Get an array of Clover objects using a LIST endpoint
  public func makeRequest<T: Mappable>(arrayType arrayType: T.Type, success: ([T]) -> Void = {$0}, failure: (CLVError) -> () = {print($0)}) {
    Alamofire.request(httpMethod, getUrlString(), parameters: payload, encoding: .JSON, headers: getHeaders()).validate().responseJSON { response in
      switch self.validateResponse(response: response) {
      case .SUCCESS(let value): success(JSON(value)["elements"].arrayValue.map({ Mapper<T>().map($0.object)! }))
      case .FAILURE(let error): failure(error)
      }
    }
  }
  
  /// Get AnyObject
  public func makeRequest(success: (AnyObject?) -> Void = {$0}, failure: (CLVError) -> Void = {print($0)}) {
    // todo: if Session.debugging. ? inherit from CLVSession?
    Alamofire.request(httpMethod, getUrlString(), parameters: payload, encoding: .JSON, headers: getHeaders()).validate().responseJSON { response in
      switch self.validateResponse(response: response) {
      case .SUCCESS(let value): success(JSON(value).object)
      case .FAILURE(let error): failure(error)
      }
    }
  }
  
  // MARK: - Enums
  
  public enum SortType: String {
    case ASC = "ASC"
    case DESC = "DESC"
  }
  
  public enum Endpoint {
    case V3(V3Endpoint)
    case CUSTOM(String)
  }
  
  public enum V3Endpoint: String {
    case APPS = "/v3/apps" // todo: how to handle \(appId) ?
    case MERCHANT_PLANS = "/v3/merchant_plans"
    case ACCOUNT = "/v3/accounts/current"
    case ACCOUNT_MERCHANTS = "/v3/accounts/current/merchants"
    case EMPLOYEE = "/v3/merchants/{mId}/employees/current"
  }
  
  public enum TimeFilterType: String {
    case CREATED_TIME = "createdTime"
    case CLIENT_CREATED_TIME = "clientCreatedTime"
    case TIMESTAMP = "timestamp"
  }
  
  public struct CloverAPITimeFilters {
    var startTime: NSDate?
    var endTime: NSDate?
    var timeFilterType: TimeFilterType
    
    /// Initialize with required fields
    init(startTime: NSDate? = nil, endTime: NSDate? = nil, timeFilterType: TimeFilterType) {
      self.startTime = startTime
      self.endTime = endTime
      self.timeFilterType = timeFilterType
    }
  }
  
  // MARK: - Helper Methods
  
  internal class func getApiDateFilters(beginningTime: NSDate, endTime: NSDate, timeFilterType: TimeFilterType) -> String {
    return "filter=\(timeFilterType.rawValue)%3E\(Int64(beginningTime.timeIntervalSince1970 * 1000))&filter=\(timeFilterType.rawValue)%3C\(Int64(endTime.timeIntervalSince1970 * 1000))"
  }
  
  internal class func getFiltersUrlString(filters: [String:String]) -> String {
    return filters.map({(k,v) in return "filter=\(k)=\(v)"}).joinWithSeparator("&")
  }
  
  internal class func getUrlParameterString(parameters: [String]) -> String {
    return "?" + parameters.joinWithSeparator("&")
  }
  
  internal func getUrlString() -> String {
    let urlParams = getUrlParams().stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())!
    var endpointString: String
    switch endpoint {
    case .V3(let v3): endpointString = v3.rawValue
    case .CUSTOM(let str): endpointString = str
    }
    return "\(domain.rawValue)\(endpointString)?\(urlParams)"
  }
  
  private func getUrlParams() -> String {
    let urlParams = [getParameters(), getFilters(), getTimeFilters(), getExpands(), getSorts(), getLimit(), getOffset()]
    return urlParams.filter({!$0.isEmpty}).joinWithSeparator("&")
  }
  
  private func getParameters() -> String {
    return params.map({(k,v) in return "\(k)=\(v)"}).joinWithSeparator("&")
  }
  
  private func getFilters() -> String {
    return filters.map({(k,v) in return "filter=\(k)=\(v)"}).joinWithSeparator("&")
  }
  
  private func getTimeFilters() -> String {
    guard let timeFilters = timeFilters else { return "" }
    let timeFilterType = timeFilters.timeFilterType.rawValue
    var res = [String]()
    if let startTime = timeFilters.startTime { res.append("filter=\(timeFilterType)>\(Int64(startTime.timeIntervalSince1970 * 1000))") }
    if let endTime   = timeFilters.endTime   { res.append("filter=\(timeFilterType)<\(Int64(endTime.timeIntervalSince1970   * 1000))") }
    return res.isEmpty ? "" : res.joinWithSeparator("&")
  }
  
  private func getExpands() -> String {
    return expands.count > 0 ? "expand=" + expands.joinWithSeparator(",") : ""
  }
  
  private func getSorts() -> String {
    return sorts.count > 0 ? "order_by=" + sorts.map({(k,v) in return "\(k)+\(v.rawValue)"}).joinWithSeparator("&") : ""
  }
  
  private func getLimit() -> String {
    return limit != 100 ? "limit=\(limit)" : ""
  }
  
  private func getOffset() -> String {
    return offset != 0 ? "offset=\(offset)" : ""
  }
  
  internal func getHeaders() -> [String:String] {
    return (accessToken == nil || accessToken!.isEmpty) ? [:] : ["Authorization": "Bearer \(accessToken!)"]
  }
  
  // MARK: - Builder
  
  public class Builder {
    private var httpMethod: Alamofire.Method
    private var domain: CLVServerEnvironment
    private var endpoint: Endpoint
    private var accessToken: String?
    private var params: [String:String] = [:]
    private var filters: [String:String] = [:]
    private var expands: [String] = []
    private var sorts: [String:SortType] = [:]
    private var limit: UInt = 100
    private var offset: UInt = 0
    private var timeFilters: CloverAPITimeFilters?
    private var payload: [String:AnyObject]?
    
    /// Initialize with default values for requred fields: httpMethod = .GET, domain = .US, endpoint = "/v3/"
    public init() {
      self.httpMethod = .GET
      self.domain = .US
      self.endpoint = .CUSTOM("/v3/")
    }
    
    /// Initialize with required fields
    public init(httpMethod: Alamofire.Method, domain: CLVServerEnvironment, endpoint: Endpoint) {
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
      self.params = cloverRequest.params
      self.filters = cloverRequest.filters
      self.expands = cloverRequest.expands
      self.sorts = cloverRequest.sorts
      self.limit = cloverRequest.limit
      self.offset = cloverRequest.offset
      self.timeFilters = cloverRequest.timeFilters
      self.payload = cloverRequest.payload
    }
    
    public func build() -> CLVRequest {
      return CLVRequest(builder: self) // validate()
    }
    
    public func httpMethod(httpMethod: Alamofire.Method)               -> Builder { self.httpMethod = httpMethod; return self }
    public func domain(domain: CLVServerEnvironment)                   -> Builder { self.domain = domain; return self }
    public func endpoint(endpoint: Endpoint)                           -> Builder { self.endpoint = endpoint; return self }
    public func accessToken(accessToken: String? = nil)                -> Builder { self.accessToken = accessToken; return self }
    public func params(params: [String:String] = [:])                  -> Builder { self.params = params; return self }
    public func filters(filters: [String:String] = [:])                -> Builder { self.filters = filters; return self }
    public func expands(expands: [String] = [])                        -> Builder { self.expands = expands; return self }
    public func sorts(sorts: [String:SortType] = [:])                  -> Builder { self.sorts = sorts; return self }
    public func limit(limit: UInt = 100)                               -> Builder { self.limit = limit; return self }
    public func offset(offset: UInt = 0)                               -> Builder { self.offset = offset; return self }
    public func timeFilters(timeFilters: CloverAPITimeFilters? = nil)  -> Builder { self.timeFilters = timeFilters; return self }
    public func payload(payload: [String:AnyObject]? = nil)            -> Builder { self.payload = payload; return self }
    
    /// Update params with contents of
    public func addParams(params: [String:String])                     -> Builder { self.params.updateContentsOf(params); return self }
    /// Remove params that exist in
    public func removeParams(params: [String:String])                  -> Builder { self.params.removeContentsOf(params); return self }
    /// Remove params for keys
    public func removeParams(keys: [String])                           -> Builder { self.params.removeContentsOf(keys); return self }
    
    public func addFilters(filters: [String:String])                   -> Builder { self.filters.updateContentsOf(filters); return self }
    public func removeFilters(filters: [String:String])                -> Builder { self.filters.removeContentsOf(filters); return self }
    public func removeFilters(keys: [String])                          -> Builder { self.filters.removeContentsOf(keys); return self }
    
    public func addExpands(expands: [String])                          -> Builder { self.expands.appendContentsOf(expands); return self }
    public func removeExpands(expands: [String])                       -> Builder { self.expands.removeContentsOf(expands); return self }
    
    public func addSorts(sorts: [String:SortType])                     -> Builder { self.sorts.updateContentsOf(sorts); return self }
    public func removeSorts(sorts: [String:SortType])                  -> Builder { self.sorts.removeContentsOf(sorts); return self }
    public func removeSorts(keys: [String])                            -> Builder { self.sorts.removeContentsOf(keys); return self }
  }
}

