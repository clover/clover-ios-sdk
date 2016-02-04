 
import ObjectMapper

extension CLVModels {
public class Cash {

 
public class CashEvent: NSObject, NSCoding, Mappable {
    /// The type of event that occured
    public var type_: CLVModels.Cash.Type_?
    /// The amount that was either added, removed of modified by the event
    public var amountChange: Int?
    /// Time at which the event was exectued
    public var timestamp: Int?
    /// Any additional information regarding the event
    public var note: String?
    /// The employee who performed the event
    public var employee: CLVModels.Employees.Employee?
    /// The device that initiated the event
    public var device: CLVModels.Device.Device?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(type_?.rawValue, forKey: "type_")
  aCoder.encodeObject(amountChange, forKey: "amountChange")
  aCoder.encodeObject(timestamp, forKey: "timestamp")
  aCoder.encodeObject(note, forKey: "note")
  aCoder.encodeObject(employee, forKey: "employee")
  aCoder.encodeObject(device, forKey: "device")
}

required public init(coder aDecoder: NSCoder) {
      type_ = (aDecoder.decodeObjectForKey("type_") as? String) != nil ?
      CLVModels.Cash.Type_(rawValue: (aDecoder.decodeObjectForKey("type_") as! String)) : nil
        amountChange = aDecoder.decodeObjectForKey("amountChange") as? Int
        timestamp = aDecoder.decodeObjectForKey("timestamp") as? Int
        note = aDecoder.decodeObjectForKey("note") as? String
        employee = aDecoder.decodeObjectForKey("employee") as? CLVModels.Employees.Employee
        device = aDecoder.decodeObjectForKey("device") as? CLVModels.Device.Device
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      type_ <- map["type_"]
        amountChange <- map["amountChange"]
        timestamp <- map["timestamp"]
        note <- map["note"]
        employee <- map["employee"]
        device <- map["device"]
  }
}


 
public enum Type_: String {
  case LOAD
  case TRANSACTION
  case OPEN
  case ADJUSTMENT
  case COUNT
  case UNLOAD
}

}
}
