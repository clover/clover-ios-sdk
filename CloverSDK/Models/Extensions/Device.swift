 
import ObjectMapper

extension CLVModels {
public class Device {

 
public enum BuildType: String {
  case ENG
  case USER
}


 
public class Device: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// Name of the device (if entered)
    public var name: String?
    public var model: String?
    public var orderPrefix: String?
    public var terminalPrefix: Int?
    public var serial: String?
    public var buildNumber: Int?
    public var secureId: String?
    public var buildType: CLVModels.Device.BuildType?
    public var cpuId: String?
    /// The IMEI of the device
    public var imei: String?
    /// The IMSI of the SIM in the device (if present)
    public var imsi: String?
    /// The ICCID of the SIM in the device (if present)
    public var simIccid: String?
    public var deviceCertificate: String?
    public var pedCertificate: String?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(model, forKey: "model")
  aCoder.encodeObject(orderPrefix, forKey: "orderPrefix")
  aCoder.encodeObject(terminalPrefix, forKey: "terminalPrefix")
  aCoder.encodeObject(serial, forKey: "serial")
  aCoder.encodeObject(buildNumber, forKey: "buildNumber")
  aCoder.encodeObject(secureId, forKey: "secureId")
  aCoder.encodeObject(buildType?.rawValue, forKey: "buildType")
  aCoder.encodeObject(cpuId, forKey: "cpuId")
  aCoder.encodeObject(imei, forKey: "imei")
  aCoder.encodeObject(imsi, forKey: "imsi")
  aCoder.encodeObject(simIccid, forKey: "simIccid")
  aCoder.encodeObject(deviceCertificate, forKey: "deviceCertificate")
  aCoder.encodeObject(pedCertificate, forKey: "pedCertificate")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        model = aDecoder.decodeObjectForKey("model") as? String
        orderPrefix = aDecoder.decodeObjectForKey("orderPrefix") as? String
        terminalPrefix = aDecoder.decodeObjectForKey("terminalPrefix") as? Int
        serial = aDecoder.decodeObjectForKey("serial") as? String
        buildNumber = aDecoder.decodeObjectForKey("buildNumber") as? Int
        secureId = aDecoder.decodeObjectForKey("secureId") as? String
        buildType = (aDecoder.decodeObjectForKey("buildType") as? String) != nil ?
      CLVModels.Device.BuildType(rawValue: (aDecoder.decodeObjectForKey("buildType") as! String)) : nil
        cpuId = aDecoder.decodeObjectForKey("cpuId") as? String
        imei = aDecoder.decodeObjectForKey("imei") as? String
        imsi = aDecoder.decodeObjectForKey("imsi") as? String
        simIccid = aDecoder.decodeObjectForKey("simIccid") as? String
        deviceCertificate = aDecoder.decodeObjectForKey("deviceCertificate") as? String
        pedCertificate = aDecoder.decodeObjectForKey("pedCertificate") as? String
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        model <- map["model"]
        orderPrefix <- map["orderPrefix"]
        terminalPrefix <- map["terminalPrefix"]
        serial <- map["serial"]
        buildNumber <- map["buildNumber"]
        secureId <- map["secureId"]
        buildType <- map["buildType"]
        cpuId <- map["cpuId"]
        imei <- map["imei"]
        imsi <- map["imsi"]
        simIccid <- map["simIccid"]
        deviceCertificate <- map["deviceCertificate"]
        pedCertificate <- map["pedCertificate"]
  }
}


 
public class DeviceProvision: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    public var deviceRef: CLVModels.Device.Device?
    public var state: CLVModels.Device.DeviceProvisionState?
    public var lastActivationCode: String?
    public var activationCode: String?
    public var emailSent: Bool?
    public var hasShipment: Bool?
    public var serialNumber: String?
    public var merchant: CLVModels.Merchant.Merchant?
    public var deviceType: String?
    public var provisionedTime: NSDate?
    public var activatedTime: NSDate?
    public var reseller: CLVModels.Base.Reference?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(deviceRef, forKey: "deviceRef")
  aCoder.encodeObject(state?.rawValue, forKey: "state")
  aCoder.encodeObject(lastActivationCode, forKey: "lastActivationCode")
  aCoder.encodeObject(activationCode, forKey: "activationCode")
  aCoder.encodeObject(emailSent, forKey: "emailSent")
  aCoder.encodeObject(hasShipment, forKey: "hasShipment")
  aCoder.encodeObject(serialNumber, forKey: "serialNumber")
  aCoder.encodeObject(merchant, forKey: "merchant")
  aCoder.encodeObject(deviceType, forKey: "deviceType")
  aCoder.encodeObject(provisionedTime, forKey: "provisionedTime")
  aCoder.encodeObject(activatedTime, forKey: "activatedTime")
  aCoder.encodeObject(reseller, forKey: "reseller")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        deviceRef = aDecoder.decodeObjectForKey("deviceRef") as? CLVModels.Device.Device
        state = (aDecoder.decodeObjectForKey("state") as? String) != nil ?
      CLVModels.Device.DeviceProvisionState(rawValue: (aDecoder.decodeObjectForKey("state") as! String)) : nil
        lastActivationCode = aDecoder.decodeObjectForKey("lastActivationCode") as? String
        activationCode = aDecoder.decodeObjectForKey("activationCode") as? String
        emailSent = aDecoder.decodeObjectForKey("emailSent") as? Bool
        hasShipment = aDecoder.decodeObjectForKey("hasShipment") as? Bool
        serialNumber = aDecoder.decodeObjectForKey("serialNumber") as? String
        merchant = aDecoder.decodeObjectForKey("merchant") as? CLVModels.Merchant.Merchant
        deviceType = aDecoder.decodeObjectForKey("deviceType") as? String
        provisionedTime = aDecoder.decodeObjectForKey("provisionedTime") as? NSDate
        activatedTime = aDecoder.decodeObjectForKey("activatedTime") as? NSDate
        reseller = aDecoder.decodeObjectForKey("reseller") as? CLVModels.Base.Reference
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        deviceRef <- map["deviceRef"]
        state <- map["state"]
        lastActivationCode <- map["lastActivationCode"]
        activationCode <- map["activationCode"]
        emailSent <- map["emailSent"]
        hasShipment <- map["hasShipment"]
        serialNumber <- map["serialNumber"]
        merchant <- map["merchant"]
        deviceType <- map["deviceType"]
        provisionedTime <- (map["provisionedTime"], CLVDateTransform())
        activatedTime <- (map["activatedTime"], CLVDateTransform())
        reseller <- map["reseller"]
  }
}


 
public enum DeviceProvisionState: String {
  case NOT_ASSOCIATED
  case DISASSOCIATED
  case ASSOCIATED
}

}
}
