 
import ObjectMapper

extension CLVModels {
public class Account {

 
public class Account: NSObject, NSCoding, Mappable {
    public var id: String?
    public var name: String?
    public var email: String?
    /// The primary merchant
    public var primaryMerchant: CLVModels.Merchant.Merchant?
    /// The primary developer
    public var primaryDeveloper: CLVModels.Developer.Developer?
    /// The primary reseller
    public var primaryReseller: CLVModels.Base.Reference?
    public var isActive: Bool?
    public var createdTime: NSDate?
    public var claimedTime: NSDate?
    public var lastLogin: Int?
    public var inviteSent: Bool?
    public var status: String?
    public var merchants: [CLVModels.Merchant.Merchant]?
    public var developers: [CLVModels.Developer.Developer]?
    public var resellers: [CLVModels.Base.Reference]?
    public var csrfToken: String?
    public var authFactors: [CLVModels.Account.AuthFactor]?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(email, forKey: "email")
  aCoder.encodeObject(primaryMerchant, forKey: "primaryMerchant")
  aCoder.encodeObject(primaryDeveloper, forKey: "primaryDeveloper")
  aCoder.encodeObject(primaryReseller, forKey: "primaryReseller")
  aCoder.encodeObject(isActive, forKey: "isActive")
  aCoder.encodeObject(createdTime, forKey: "createdTime")
  aCoder.encodeObject(claimedTime, forKey: "claimedTime")
  aCoder.encodeObject(lastLogin, forKey: "lastLogin")
  aCoder.encodeObject(inviteSent, forKey: "inviteSent")
  aCoder.encodeObject(status, forKey: "status")
  aCoder.encodeObject(merchants, forKey: "merchants")
  aCoder.encodeObject(developers, forKey: "developers")
  aCoder.encodeObject(resellers, forKey: "resellers")
  aCoder.encodeObject(csrfToken, forKey: "csrfToken")
  aCoder.encodeObject(authFactors, forKey: "authFactors")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        email = aDecoder.decodeObjectForKey("email") as? String
        primaryMerchant = aDecoder.decodeObjectForKey("primaryMerchant") as? CLVModels.Merchant.Merchant
        primaryDeveloper = aDecoder.decodeObjectForKey("primaryDeveloper") as? CLVModels.Developer.Developer
        primaryReseller = aDecoder.decodeObjectForKey("primaryReseller") as? CLVModels.Base.Reference
        isActive = aDecoder.decodeObjectForKey("isActive") as? Bool
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        claimedTime = aDecoder.decodeObjectForKey("claimedTime") as? NSDate
        lastLogin = aDecoder.decodeObjectForKey("lastLogin") as? Int
        inviteSent = aDecoder.decodeObjectForKey("inviteSent") as? Bool
        status = aDecoder.decodeObjectForKey("status") as? String
        merchants = aDecoder.decodeObjectForKey("merchants") as? [CLVModels.Merchant.Merchant]
        developers = aDecoder.decodeObjectForKey("developers") as? [CLVModels.Developer.Developer]
        resellers = aDecoder.decodeObjectForKey("resellers") as? [CLVModels.Base.Reference]
        csrfToken = aDecoder.decodeObjectForKey("csrfToken") as? String
        authFactors = aDecoder.decodeObjectForKey("authFactors") as? [CLVModels.Account.AuthFactor]
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        primaryMerchant <- map["primaryMerchant"]
        primaryDeveloper <- map["primaryDeveloper"]
        primaryReseller <- map["primaryReseller"]
        isActive <- map["isActive"]
        createdTime <- (map["createdTime"], CLVDateTransform())
        claimedTime <- (map["claimedTime"], CLVDateTransform())
        lastLogin <- map["lastLogin"]
        inviteSent <- map["inviteSent"]
        status <- map["status"]
        merchants <- (map["merchants"], CLVArrayTransform<CLVModels.Merchant.Merchant>())
        developers <- (map["developers"], CLVArrayTransform<CLVModels.Developer.Developer>())
        resellers <- (map["resellers"], CLVArrayTransform<CLVModels.Base.Reference>())
        csrfToken <- map["csrfToken"]
        authFactors <- (map["authFactors"], CLVArrayTransform<CLVModels.Account.AuthFactor>())
  }
}


 
public class AuthFactor: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    public var type_: CLVModels.Account.AuthFactorType?
    public var phoneNumber: String?
    public var backupCodes: String?
    public var totpKey: String?
    public var createdTime: NSDate?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(type_?.rawValue, forKey: "type_")
  aCoder.encodeObject(phoneNumber, forKey: "phoneNumber")
  aCoder.encodeObject(backupCodes, forKey: "backupCodes")
  aCoder.encodeObject(totpKey, forKey: "totpKey")
  aCoder.encodeObject(createdTime, forKey: "createdTime")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        type_ = (aDecoder.decodeObjectForKey("type_") as? String) != nil ?
      CLVModels.Account.AuthFactorType(rawValue: (aDecoder.decodeObjectForKey("type_") as! String)) : nil
        phoneNumber = aDecoder.decodeObjectForKey("phoneNumber") as? String
        backupCodes = aDecoder.decodeObjectForKey("backupCodes") as? String
        totpKey = aDecoder.decodeObjectForKey("totpKey") as? String
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        type_ <- map["type_"]
        phoneNumber <- map["phoneNumber"]
        backupCodes <- map["backupCodes"]
        totpKey <- map["totpKey"]
        createdTime <- (map["createdTime"], CLVDateTransform())
  }
}


 
public enum AuthFactorType: String {
  case SMS
  case TOTP
  case BACKUP_CODES
}

}
}
