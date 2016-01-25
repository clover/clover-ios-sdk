 
import ObjectMapper

extension CLVModels {
public class Sync {

 
public class SyncRange: NSObject, NSCoding, Mappable {
    /// the start of the range (inclusive)
    public var modifiedSince: String?
    /// the end of the range (exclusive)
    public var modifiedBefore: String?
    /// the number of elements in the range [response]
    public var count: Int?
    /// the most up-to-date value suitable for a subsequent range request
    public var mostRecent: String?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(modifiedSince, forKey: "modifiedSince")
  aCoder.encodeObject(modifiedBefore, forKey: "modifiedBefore")
  aCoder.encodeObject(count, forKey: "count")
  aCoder.encodeObject(mostRecent, forKey: "mostRecent")
}

required public init(coder aDecoder: NSCoder) {
      modifiedSince = aDecoder.decodeObjectForKey("modifiedSince") as? String
        modifiedBefore = aDecoder.decodeObjectForKey("modifiedBefore") as? String
        count = aDecoder.decodeObjectForKey("count") as? Int
        mostRecent = aDecoder.decodeObjectForKey("mostRecent") as? String
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      modifiedSince <- map["modifiedSince"]
        modifiedBefore <- map["modifiedBefore"]
        count <- map["count"]
        mostRecent <- map["mostRecent"]
  }
}

}
}
