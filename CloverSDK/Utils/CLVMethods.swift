
import ObjectMapper
import Alamofire

extension CLVSession {
  
  public class func getApps(params params: [String:String] = [:], filters: [String:String] = [:], expands: [String] = [], sorts: [String:CLVRequest.SortType] = [:], limit: UInt = 100, offset: UInt = 0, success: ([CLVModels.Apps.App]) -> Void, failure: (CLVError) -> Void = {print($0)}) {
    CLVRequest.Builder(httpMethod: .GET, domain: .US, endpoint: .V3(.APPS)).params(params).filters(filters).expands(expands).sorts(sorts).limit(limit).offset(offset).build()
      .makeRequest(arrayType: CLVModels.Apps.App.self, success: success, failure: failure)
  }
  
  public class func getMerchants(accountToken: String, params: [String:String] = [:], filters: [String:String] = [:], expands: [String] = [], sorts: [String:CLVRequest.SortType] = [:], limit: UInt = 100, offset: UInt = 0, success: ([CLVModels.Merchant.Merchant]) -> Void, failure: (CLVError) -> Void = {print($0)}) {
    CLVRequest.Builder(httpMethod: .GET, domain: .US, endpoint: .V3(.ACCOUNT_MERCHANTS)).accessToken(accountToken).params(params).filters(filters).expands(expands).sorts(sorts).limit(limit).offset(offset).build()
      .makeRequest(arrayType: CLVModels.Merchant.Merchant.self, success: success, failure: failure)
  }
  
  public class func getAccount(accountToken: String, params: [String:String] = [:], filters: [String:String] = [:], expands: [String] = [], sorts: [String:CLVRequest.SortType] = [:], limit: UInt = 100, offset: UInt = 0, success: (CLVModels.Account.Account?) -> Void, failure: (CLVError) -> Void = {print($0)}) {
    CLVRequest.Builder(httpMethod: .GET, domain: .US, endpoint: .V3(.ACCOUNT)).accessToken(accountToken).params(params).filters(filters).expands(expands).sorts(sorts).limit(limit).offset(offset).build()
      .makeRequest(objectType: CLVModels.Account.Account.self, success: success, failure: failure)
  }
  
}
