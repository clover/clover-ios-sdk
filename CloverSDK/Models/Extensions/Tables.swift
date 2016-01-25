 
import ObjectMapper

extension CLVModels {
public class Tables {

 
public class Table: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// Name of the table
    public var name: String?
    /// Unique ID of the order associated with this table (optional)
    public var orderId: String?
    /// Timestamp when Table was created on the server
    public var createdTime: NSDate?
    /// Timestamp when Table was last modified on the server
    public var modifiedTime: NSDate?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(orderId, forKey: "orderId")
  aCoder.encodeObject(createdTime, forKey: "createdTime")
  aCoder.encodeObject(modifiedTime, forKey: "modifiedTime")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        orderId = aDecoder.decodeObjectForKey("orderId") as? String
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        modifiedTime = aDecoder.decodeObjectForKey("modifiedTime") as? NSDate
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        orderId <- map["orderId"]
        createdTime <- (map["createdTime"], CLVDateTransform())
        modifiedTime <- (map["modifiedTime"], CLVDateTransform())
  }
}

}
}
