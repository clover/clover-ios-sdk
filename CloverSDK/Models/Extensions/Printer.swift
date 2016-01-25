 
import ObjectMapper

extension CLVModels {
public class Printer {

 
public class Printer: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// MAC address of a network printer
    public var mac: String?
    public var model: String?
    public var name: String?
    /// IP address of a network printer
    public var ipAddress: String?
    /// NETWORK is a printer that's directly connected to the network.  MY_LOCAL represents the printer that's connected to the device that's making the request.
    public var type_: CLVModels.Printer.PrinterType?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(mac, forKey: "mac")
  aCoder.encodeObject(model, forKey: "model")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(ipAddress, forKey: "ipAddress")
  aCoder.encodeObject(type_?.rawValue, forKey: "type_")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        mac = aDecoder.decodeObjectForKey("mac") as? String
        model = aDecoder.decodeObjectForKey("model") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        ipAddress = aDecoder.decodeObjectForKey("ipAddress") as? String
        type_ = (aDecoder.decodeObjectForKey("type_") as? String) != nil ?
      CLVModels.Printer.PrinterType(rawValue: (aDecoder.decodeObjectForKey("type_") as! String)) : nil
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        mac <- map["mac"]
        model <- map["model"]
        name <- map["name"]
        ipAddress <- map["ipAddress"]
        type_ <- map["type_"]
  }
}


 
public enum PrinterType: String {
  case NETWORK
  case MY_LOCAL
}

}
}
