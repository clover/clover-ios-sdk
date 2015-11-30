
import ObjectMapper
import Alamofire

class CLVHTTPUtils {
  static var domain = "https://www.clover.com"

  static func getAccountMerchants(accountId accountId: String, accountToken: String, success: ([CLVModels.Merchant.Merchant]) -> Void, failure: (NSError) -> Void) {
    let urlString = domain + "/v3/accounts/current/merchants"
    let parameters = ["access_token": "\(accountToken)"] // "filter": "ownerId=\(accountId)"
    CLVAPI.cloverApiRequest(method: .GET, url: urlString, params: parameters, arrayType: CLVModels.Merchant.Merchant.self, success: success, failure: failure)
  }

  class func getDefaultMerchant(accountToken accountToken: String, success: (CLVModels.Account.Account?) -> Void, failure: (NSError) -> Void) {
    let urlString = domain + "/v3/accounts/current"
    let parameters = ["expand": "primaryMerchant", "access_token": "\(accountToken)"]
    CLVAPI.cloverApiRequest(method: .GET, url: urlString, params: parameters, objectType: CLVModels.Account.Account.self, success: success, failure: failure)
  }

  class func getPaymentsReport(merchantId merchantId: String, merchantToken: String, startTime: NSDate, endTime: NSDate, success: (CLVModels.Report.ReportPayments?) -> Void, failure: (NSError) -> Void) {
    let timeFilters = CLVAPIUtils.getApiDateFilters(startTime, endTime: endTime, timeFilterType: CLVAPIUtils.TimeFilterType.Timestamp)
    let urlString = domain + "/v3/merchants/\(merchantId)/reports/payments?\(timeFilters)&access_token=\(merchantToken)"
    CLVAPI.cloverApiRequest(method: .GET, url: urlString, objectType: CLVModels.Report.ReportPayments.self, success: success, failure: failure)
  }

  class func getApp(appId appId: String, success: (CLVModels.Apps.App?) -> Void, failure: (NSError) -> Void) {
    let urlString = domain + "/v3/apps/\(appId)?"
    CLVAPI.cloverApiRequest(method: .GET, url: urlString, objectType: CLVModels.Apps.App.self, success: success, failure: failure) // { success($0.first) }
  }

  class func getApps(name name: String, clientCountry: String, hidden: Bool, success: ([CLVModels.Apps.App]) -> Void, failure: (NSError) -> Void) {
    let urlString = domain + "/v3/apps?clientCountry=\(clientCountry)&filter=name=\(name)&filter=hidden=\(hidden)"
    CLVAPI.cloverApiRequest(method: .GET, url: urlString, arrayType: CLVModels.Apps.App.self, success: success, failure: failure)
  }

  class func getApps(clientCountry clientCountry: String, filters: [String:String], success: ([CLVModels.Apps.App]) -> Void, failure: (NSError) -> Void) {
    let filtersString = CLVAPIUtils.getFiltersUrlString(filters)
    let urlString = domain + "/v3/apps?clientCountry=\(clientCountry)&\(filtersString)"
    CLVAPI.cloverApiRequest(method: .GET, url: urlString, arrayType: CLVModels.Apps.App.self, success: success, failure: failure)
  }

  class func getEmployee(employeeId: String, merchantId: String, merchantToken: String, filters: [String:String], success: (CLVModels.Employees.Employee?) -> Void, failure: (NSError) -> Void) {
    let filtersString = CLVAPIUtils.getFiltersUrlString(filters)
    let urlString = domain + "/v3/merchants/\(merchantId)/employees/\(employeeId)?access_token=\(merchantToken)&\(filtersString)"
    CLVAPI.cloverApiRequest(method: .GET, url: urlString, objectType: CLVModels.Employees.Employee.self, success: success, failure: failure)
  }

  class func updateEmployee(employeeId: String, merchantId: String, merchantToken: String, merchant: CLVModels.Employees.Employee, success: (CLVModels.Employees.Employee?) -> Void, failure: (NSError) -> Void) {
    let urlString = domain + "/v3/merchants/\(merchantId)/employees/\(employeeId)?access_token=\(merchantToken)"
    Alamofire.request(.POST, urlString, parameters: Mapper<CLVModels.Employees.Employee>().toJSON(merchant) , encoding: .JSON).validate().response { response in
      // ...
    }
  }

  class func getMerchant(merchantId: String, merchantToken: String, filters: [String:String] = [:], success: (CLVModels.Merchant.Merchant?) -> Void, failure: (NSError) -> Void) {
    let filtersString = CLVAPIUtils.getFiltersUrlString(filters)
    let urlString = domain + "/v3/merchants/\(merchantId)?access_token=\(merchantToken)&\(filtersString)"
    CLVAPI.cloverApiRequest(method: .GET, url: urlString, objectType: CLVModels.Merchant.Merchant.self, success: success, failure: failure)
  }
  
}
