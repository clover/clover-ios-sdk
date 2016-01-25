 
import ObjectMapper

extension CLVModels {
public class Entitlements {

 
public class MerchantGatewayEntitlement: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// Entitlement name (e.g. MASTERCARD, VISA, etc.)
    public var name: String?
    public var serviceEntitlementNumber: String?
    public var serviceType: String?
    /// AlphaID for entitlements. Supplied by First Data.
    public var alphaID: String?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(serviceEntitlementNumber, forKey: "serviceEntitlementNumber")
  aCoder.encodeObject(serviceType, forKey: "serviceType")
  aCoder.encodeObject(alphaID, forKey: "alphaID")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        serviceEntitlementNumber = aDecoder.decodeObjectForKey("serviceEntitlementNumber") as? String
        serviceType = aDecoder.decodeObjectForKey("serviceType") as? String
        alphaID = aDecoder.decodeObjectForKey("alphaID") as? String
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        serviceEntitlementNumber <- map["serviceEntitlementNumber"]
        serviceType <- map["serviceType"]
        alphaID <- map["alphaID"]
  }
}

}
}
