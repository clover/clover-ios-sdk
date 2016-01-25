
import ObjectMapper
import Alamofire
import PromiseKit

extension CLVSession {
  
  // MARK: Class methods
  
  public class func getApps(domain domain: CLVServerEnvironment, params: [String:String] = [:], filters: [String:String] = [:], expands: [String] = [], sorts: [String:CLVRequest.SortType] = [:], limit: UInt = 100, offset: UInt = 0)
    -> Promise<[CLVModels.Apps.App]> {
      return CLVRequest.Builder(httpMethod: .GET, domain: domain, endpoint: .V3(.APPS)).params(params).filters(filters).expands(expands).sorts(sorts).limit(limit).offset(offset).build()
        .makeRequestWithPromise(arrayType: CLVModels.Apps.App.self)
  }
  
  public class func getMerchants(domain domain: CLVServerEnvironment, accountToken: String, params: [String:String] = [:], filters: [String:String] = [:], expands: [String] = [], sorts: [String:CLVRequest.SortType] = [:], limit: UInt = 100, offset: UInt = 0)
    -> Promise<[CLVModels.Merchant.Merchant]> {
      return CLVRequest.Builder(httpMethod: .GET, domain: domain, endpoint: .V3(.ACCOUNT_MERCHANTS)).accessToken(accountToken).params(params).filters(filters).expands(expands).sorts(sorts).limit(limit).offset(offset).build()
        .makeRequestWithPromise(arrayType: CLVModels.Merchant.Merchant.self)
  }
  
  public class func getAccount(domain domain: CLVServerEnvironment, accountToken: String, params: [String:String] = [:], filters: [String:String] = [:], expands: [String] = [], sorts: [String:CLVRequest.SortType] = [:], limit: UInt = 100, offset: UInt = 0)
    -> Promise<CLVModels.Account.Account> {
      return CLVRequest.Builder(httpMethod: .GET, domain: domain, endpoint: .V3(.ACCOUNT)).accessToken(accountToken).params(params).filters(filters).expands(expands).sorts(sorts).limit(limit).offset(offset).build()
        .makeRequestWithPromise(objectType: CLVModels.Account.Account.self)
  }
  
  
  // MARK: - Instance methods
  
  public func getMerchantApps(params: [String:String] = [:], filters: [String:String] = [:], expands: [String] = [], sorts: [String:CLVRequest.SortType] = [:], limit: UInt = 100, offset: UInt = 0)
    -> Promise<[CLVModels.Apps.App]> {
      return CLVRequest.Builder(httpMethod: .GET, domain: self.domain, endpoint: .CUSTOM("/v3/merchants/\(self.merchantId)/apps")).accessToken(self.token).params(params).filters(filters).expands(expands).sorts(sorts).limit(limit).offset(offset).build()
        .makeRequestWithPromise(arrayType: CLVModels.Apps.App.self)
  }
  
  public func getShifts(params: [String:String] = [:], filters: [String:String] = [:], expands: [String] = [], sorts: [String:CLVRequest.SortType] = [:], limit: UInt = 100, offset: UInt = 0)
    -> Promise<[CLVModels.Employees.Shift]> {
      return CLVRequest.Builder(httpMethod: .GET, domain: self.domain, endpoint: .CUSTOM("/v3/merchants/\(self.merchantId)/shifts")).accessToken(self.token).params(params).filters(filters).expands(expands).sorts(sorts).limit(limit).offset(offset).build()
        .makeRequestWithPromise(arrayType: CLVModels.Employees.Shift.self)
  }
  
  public func getMerchant(params: [String:String] = [:], filters: [String:String] = [:], expands: [String] = [], sorts: [String:CLVRequest.SortType] = [:], limit: UInt = 100, offset: UInt = 0)
    -> Promise<CLVModels.Merchant.Merchant> {
      return CLVRequest.Builder(httpMethod: .GET, domain: self.domain, endpoint: .CUSTOM("/v3/merchants/\(self.merchantId)")).accessToken(self.token).params(params).filters(filters).expands(expands).sorts(sorts).limit(limit).offset(offset).build()
        .makeRequestWithPromise(objectType: CLVModels.Merchant.Merchant.self)
  }
  
  public func getEmployee(params: [String:String] = [:], filters: [String:String] = [:], expands: [String] = [], sorts: [String:CLVRequest.SortType] = [:], limit: UInt = 100, offset: UInt = 0)
    -> Promise<CLVModels.Employees.Employee> {
      return CLVRequest.Builder(httpMethod: .GET, domain: self.domain, endpoint: .CUSTOM("/v3/merchants/\(self.merchantId)/employees/current")).accessToken(self.token)
        .params(params).filters(filters).expands(expands).sorts(sorts).limit(limit).offset(offset).build()
        .makeRequestWithPromise(objectType: CLVModels.Employees.Employee.self)
  }
  
  public func getReportsPayments(startTime startTime: NSDate?, endTime: NSDate?, params: [String:String] = [:], filters: [String:String] = [:], expands: [String] = [], sorts: [String:CLVRequest.SortType] = [:], limit: UInt = 100, offset: UInt = 0)
    -> Promise<CLVModels.Report.ReportPayments> {
      return CLVRequest.Builder(httpMethod: .GET, domain: self.domain, endpoint: .CUSTOM("/v3/merchants/\(self.merchantId)/reports/payments"))
        .accessToken(self.token).params(params).filters(filters).expands(expands).sorts(sorts).limit(limit).offset(offset)
        .timeFilters(CLVRequest.CloverAPITimeFilters(startTime: startTime, endTime: endTime, timeFilterType: CLVRequest.TimeFilterType.TIMESTAMP))
        .build()
        .makeRequestWithPromise(objectType: CLVModels.Report.ReportPayments.self)
  }
  
  public func getBatches(startTime startTime: NSDate?, endTime: NSDate?, params: [String:String] = [:], filters: [String:String] = [:], expands: [String] = [], sorts: [String:CLVRequest.SortType] = [:], limit: UInt = 100, offset: UInt = 0)
    -> Promise<[CLVModels.Payments.Batch]> {
      print("getBatches")
      return CLVRequest.Builder(httpMethod: .GET, domain: self.domain, endpoint: .CUSTOM("/v3/merchants/\(self.merchantId)/batches"))
        .accessToken(self.token).params(params).filters(filters).expands(expands).sorts(sorts).limit(limit).offset(offset)
        .timeFilters(CLVRequest.CloverAPITimeFilters(startTime: startTime, endTime: endTime, timeFilterType: CLVRequest.TimeFilterType.CREATED_TIME))
        .build()
        .makeRequestWithPromise(arrayType: CLVModels.Payments.Batch.self)
  }
  
  public func getOrders(startTime startTime: NSDate?, endTime: NSDate?, params: [String:String] = [:], filters: [String:String] = [:], expands: [String] = [], sorts: [String:CLVRequest.SortType] = [:], limit: UInt = 100, offset: UInt = 0)
    -> Promise<[CLVModels.Order.Order]> {
      return CLVRequest.Builder(httpMethod: .GET, domain: self.domain, endpoint: .CUSTOM("/v3/merchants/\(self.merchantId)/orders"))
        .accessToken(self.token).params(params).filters(filters).expands(expands).sorts(sorts).limit(limit).offset(offset)
        .timeFilters(CLVRequest.CloverAPITimeFilters(startTime: startTime, endTime: endTime, timeFilterType: CLVRequest.TimeFilterType.CLIENT_CREATED_TIME))
        .build()
        .makeRequestWithPromise(arrayType: CLVModels.Order.Order.self)
  }
  
  public func getOrder(id orderId: String, expands: [String] = [])
    -> Promise<CLVModels.Order.Order> {
      return CLVRequest.Builder(httpMethod: .GET, domain: self.domain, endpoint: .CUSTOM("/v3/merchants/\(self.merchantId)/orders/\(orderId)"))
        .accessToken(self.token).expands(expands)
        .build()
        .makeRequestWithPromise(objectType: CLVModels.Order.Order.self)
  }
  
  public func getLineItems(orderId: String, params: [String:String] = [:], filters: [String:String] = [:], expands: [String] = [], sorts: [String:CLVRequest.SortType] = [:], limit: UInt = 100, offset: UInt = 0)
    -> Promise<[CLVModels.Order.LineItem]> {
      return CLVRequest.Builder(httpMethod: .GET, domain: self.domain, endpoint: .CUSTOM("/v3/merchants/\(self.merchantId)/orders/\(orderId)/line_items"))
        .accessToken(self.token).params(params).filters(filters).expands(expands).sorts(sorts).limit(limit).offset(offset)
        //        .timeFilters(CLVRequest.CloverAPITimeFilters(startTime: startTime, endTime: endTime, timeFilterType: CLVRequest.TimeFilterType.CLIENT_CREATED_TIME))
        .build()
        .makeRequestWithPromise(arrayType: CLVModels.Order.LineItem.self)
  }
  
  public func getOrders(startTime startTime: NSDate?, endTime: NSDate?, params: [String:String] = [:], filters: [String:String] = [:], expands: [String] = [], sorts: [String:CLVRequest.SortType] = [:], limit: UInt = 100, offset: UInt = 0, success: ([CLVModels.Order.Order]) -> Void, failure: (NSError) -> Void) {
    CLVRequest.Builder(httpMethod: .GET, domain: self.domain, endpoint: .CUSTOM("/v3/merchants/\(self.merchantId)/orders"))
      .accessToken(self.token).params(params).filters(filters).expands(expands).sorts(sorts).limit(limit).offset(offset)
      .timeFilters(CLVRequest.CloverAPITimeFilters(startTime: startTime, endTime: endTime, timeFilterType: CLVRequest.TimeFilterType.CLIENT_CREATED_TIME))
      .build()
      .makeRequest(arrayType: CLVModels.Order.Order.self, success: success, failure: failure)
  }
  
  
}