
class CLVAPIUtils {
  enum TimeFilterType: String {
    case CreatedTime = "createdTime"
    case ClientCreatedTime = "clientCreatedTime"
    case Timestamp = "timestamp"
  }

  class func getApiDateFilters(beginningTime: NSDate, endTime: NSDate, timeFilterType: TimeFilterType) -> String {
    return "filter=\(timeFilterType.rawValue)%3E\(Int64(beginningTime.timeIntervalSince1970 * 1000))&filter=\(timeFilterType.rawValue)%3C\(Int64(endTime.timeIntervalSince1970 * 1000))"
  }

  class func getFiltersUrlString(filters: [String:String]) -> String {
    return filters.map({(k,v) in return "filter=\(k)=\(v)"}).joinWithSeparator("&")
  }

  class func getUrlParameterString(parameters: [String]) -> String {
    return "?" + parameters.joinWithSeparator("&")
  }
}
