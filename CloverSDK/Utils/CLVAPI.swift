
import ObjectMapper
import Alamofire
import SwiftyJSON

class CLVAPI {
  /// Get a single Clover object using a RETRIEVE endpoint
  static func cloverApiRequest<T: Mappable>(method method: Alamofire.Method, url: String,
    params: [String:AnyObject] = [:], headers: [String:String] = [:],
    objectType: T.Type, success: (T?) -> Void, failure: (NSError) -> Void) {
      Alamofire.request(method, url, parameters: params, encoding: ParameterEncoding.URL, headers: headers).validate().responseJSON { response in
        switch response.result {
        case .Success(let data):  success(Mapper<T>().map(JSON(data).object))
        case .Failure(let error): failure(error)
        }
      }
  }

  /// Get an array of Clover objects using a LIST endpoint
  static func cloverApiRequest<T: Mappable>(method method: Alamofire.Method, url: String,
    params: [String:AnyObject] = [:], headers: [String:String] = [:],
    arrayType: T.Type, success: ([T]) -> Void, failure: (NSError) -> Void) {
      Alamofire.request(method, url, parameters: params, encoding: ParameterEncoding.URL, headers: headers).validate().responseJSON { response in
        switch response.result {
        case .Success(let data): success(JSON(data)["elements"].arrayValue.map({ Mapper<T>().map($0.object)! }))
        case .Failure(let error): failure(error)
        }
      }
  }

  /// Send a Clover object to a POST endpoint
  static func cloverApiRequestPOST<T: Mappable>(method method: Alamofire.Method, url: String, object: T,
    objectType: T.Type, success: (T?) -> Void, failure: (NSError) -> Void) {
      Alamofire.request(method, url, parameters: Mapper<T>().toJSON(object), encoding: ParameterEncoding.JSON).validate().responseJSON { response in
        switch response.result {
        case .Success(let data):  success(Mapper<T>().map(JSON(data).object))
        case .Failure(let error): failure(error)
        }
      }
  }
}
