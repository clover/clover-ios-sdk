 
import ObjectMapper

extension CLVModels {
public class Hours {

 
public class HourRange: NSObject, NSCoding, Mappable {
    public var start: Int?
    public var end: Int?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(start, forKey: "start")
  aCoder.encodeObject(end, forKey: "end")
}

required public init(coder aDecoder: NSCoder) {
      start = aDecoder.decodeObjectForKey("start") as? Int
        end = aDecoder.decodeObjectForKey("end") as? Int
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      start <- map["start"]
        end <- map["end"]
  }
}


 
public class HoursSet: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// Friendly name to describe the hours
    public var name: String?
    public var reference: CLVModels.Hours.Reference?
    public var sunday: [CLVModels.Hours.HourRange]?
    public var monday: [CLVModels.Hours.HourRange]?
    public var tuesday: [CLVModels.Hours.HourRange]?
    public var wednesday: [CLVModels.Hours.HourRange]?
    public var thursday: [CLVModels.Hours.HourRange]?
    public var friday: [CLVModels.Hours.HourRange]?
    public var saturday: [CLVModels.Hours.HourRange]?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(reference, forKey: "reference")
  aCoder.encodeObject(sunday, forKey: "sunday")
  aCoder.encodeObject(monday, forKey: "monday")
  aCoder.encodeObject(tuesday, forKey: "tuesday")
  aCoder.encodeObject(wednesday, forKey: "wednesday")
  aCoder.encodeObject(thursday, forKey: "thursday")
  aCoder.encodeObject(friday, forKey: "friday")
  aCoder.encodeObject(saturday, forKey: "saturday")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        reference = aDecoder.decodeObjectForKey("reference") as? CLVModels.Hours.Reference
        sunday = aDecoder.decodeObjectForKey("sunday") as? [CLVModels.Hours.HourRange]
        monday = aDecoder.decodeObjectForKey("monday") as? [CLVModels.Hours.HourRange]
        tuesday = aDecoder.decodeObjectForKey("tuesday") as? [CLVModels.Hours.HourRange]
        wednesday = aDecoder.decodeObjectForKey("wednesday") as? [CLVModels.Hours.HourRange]
        thursday = aDecoder.decodeObjectForKey("thursday") as? [CLVModels.Hours.HourRange]
        friday = aDecoder.decodeObjectForKey("friday") as? [CLVModels.Hours.HourRange]
        saturday = aDecoder.decodeObjectForKey("saturday") as? [CLVModels.Hours.HourRange]
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        reference <- map["reference"]
        sunday <- (map["sunday"], CLVArrayTransform<CLVModels.Hours.HourRange>())
        monday <- (map["monday"], CLVArrayTransform<CLVModels.Hours.HourRange>())
        tuesday <- (map["tuesday"], CLVArrayTransform<CLVModels.Hours.HourRange>())
        wednesday <- (map["wednesday"], CLVArrayTransform<CLVModels.Hours.HourRange>())
        thursday <- (map["thursday"], CLVArrayTransform<CLVModels.Hours.HourRange>())
        friday <- (map["friday"], CLVArrayTransform<CLVModels.Hours.HourRange>())
        saturday <- (map["saturday"], CLVArrayTransform<CLVModels.Hours.HourRange>())
  }
}


 
public class Reference: NSObject, NSCoding, Mappable {
    /// ID of the reference that uses this set of hours
    public var id: String?
    /// External type that these hours reference
    public var type_: CLVModels.Hours.ReferenceType?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(type_?.rawValue, forKey: "type_")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        type_ = (aDecoder.decodeObjectForKey("type_") as? String) != nil ?
      CLVModels.Hours.ReferenceType(rawValue: (aDecoder.decodeObjectForKey("type_") as! String)) : nil
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        type_ <- map["type_"]
  }
}


 
public enum ReferenceType: String {
  case ORDER_TYPE
  case ITEM_GROUP
}

}
}
