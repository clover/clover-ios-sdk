 
import ObjectMapper

extension CLVModels {
public class Billing {

 
public class AppMeteredEvent: NSObject, NSCoding, Mappable {
    public var id: String?
    public var appMetered: CLVModels.Apps.AppMetered?
    public var count: Int?
    public var createdTime: NSDate?
    public var modifiedTime: NSDate?
    public var merchantApp: CLVModels.Apps.App?
    public var charge: CLVModels.Billing.Charge?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(appMetered, forKey: "appMetered")
  aCoder.encodeObject(count, forKey: "count")
  aCoder.encodeObject(createdTime, forKey: "createdTime")
  aCoder.encodeObject(modifiedTime, forKey: "modifiedTime")
  aCoder.encodeObject(merchantApp, forKey: "merchantApp")
  aCoder.encodeObject(charge, forKey: "charge")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        appMetered = aDecoder.decodeObjectForKey("appMetered") as? CLVModels.Apps.AppMetered
        count = aDecoder.decodeObjectForKey("count") as? Int
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        modifiedTime = aDecoder.decodeObjectForKey("modifiedTime") as? NSDate
        merchantApp = aDecoder.decodeObjectForKey("merchantApp") as? CLVModels.Apps.App
        charge = aDecoder.decodeObjectForKey("charge") as? CLVModels.Billing.Charge
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        appMetered <- map["appMetered"]
        count <- map["count"]
        createdTime <- (map["createdTime"], CLVDateTransform())
        modifiedTime <- (map["modifiedTime"], CLVDateTransform())
        merchantApp <- map["merchantApp"]
        charge <- map["charge"]
  }
}


 
public class Charge: NSObject, NSCoding, Mappable {
    public var id: String?
    public var currency: String?
    public var amount: Int?
    public var tax: Int?
    public var developerPortion: Int?
    public var status: CLVModels.Billing.ChargeStatus?
    public var statusOwner: String?
    public var type_: CLVModels.Billing.ChargeType?
    public var systemType: CLVModels.Billing.ChargeSystemType?
    public var startDate: NSDate?
    public var endDate: NSDate?
    public var exportMonth: Int?
    public var createdTime: NSDate?
    public var modifiedTime: NSDate?
    /// Object which includes the charge object and some details regarding the app charge
    public var merchantAppCharge: CLVModels.Billing.MerchantAppCharge?
    /// Object which includes the charge object and some details regarding the plan charge
    public var merchantPlanCharge: CLVModels.Billing.MerchantPlanCharge?
    /// Infolease charge attempts
    public var infoleaseChargeAttempts: [CLVModels.Billing.InfoleaseChargeAttempt]?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(currency, forKey: "currency")
  aCoder.encodeObject(amount, forKey: "amount")
  aCoder.encodeObject(tax, forKey: "tax")
  aCoder.encodeObject(developerPortion, forKey: "developerPortion")
  aCoder.encodeObject(status?.rawValue, forKey: "status")
  aCoder.encodeObject(statusOwner, forKey: "statusOwner")
  aCoder.encodeObject(type_?.rawValue, forKey: "type_")
  aCoder.encodeObject(systemType?.rawValue, forKey: "systemType")
  aCoder.encodeObject(startDate, forKey: "startDate")
  aCoder.encodeObject(endDate, forKey: "endDate")
  aCoder.encodeObject(exportMonth, forKey: "exportMonth")
  aCoder.encodeObject(createdTime, forKey: "createdTime")
  aCoder.encodeObject(modifiedTime, forKey: "modifiedTime")
  aCoder.encodeObject(merchantAppCharge, forKey: "merchantAppCharge")
  aCoder.encodeObject(merchantPlanCharge, forKey: "merchantPlanCharge")
  aCoder.encodeObject(infoleaseChargeAttempts, forKey: "infoleaseChargeAttempts")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        currency = aDecoder.decodeObjectForKey("currency") as? String
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        tax = aDecoder.decodeObjectForKey("tax") as? Int
        developerPortion = aDecoder.decodeObjectForKey("developerPortion") as? Int
        status = (aDecoder.decodeObjectForKey("status") as? String) != nil ?
      CLVModels.Billing.ChargeStatus(rawValue: (aDecoder.decodeObjectForKey("status") as! String)) : nil
        statusOwner = aDecoder.decodeObjectForKey("statusOwner") as? String
        type_ = (aDecoder.decodeObjectForKey("type_") as? String) != nil ?
      CLVModels.Billing.ChargeType(rawValue: (aDecoder.decodeObjectForKey("type_") as! String)) : nil
        systemType = (aDecoder.decodeObjectForKey("systemType") as? String) != nil ?
      CLVModels.Billing.ChargeSystemType(rawValue: (aDecoder.decodeObjectForKey("systemType") as! String)) : nil
        startDate = aDecoder.decodeObjectForKey("startDate") as? NSDate
        endDate = aDecoder.decodeObjectForKey("endDate") as? NSDate
        exportMonth = aDecoder.decodeObjectForKey("exportMonth") as? Int
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        modifiedTime = aDecoder.decodeObjectForKey("modifiedTime") as? NSDate
        merchantAppCharge = aDecoder.decodeObjectForKey("merchantAppCharge") as? CLVModels.Billing.MerchantAppCharge
        merchantPlanCharge = aDecoder.decodeObjectForKey("merchantPlanCharge") as? CLVModels.Billing.MerchantPlanCharge
        infoleaseChargeAttempts = aDecoder.decodeObjectForKey("infoleaseChargeAttempts") as? [CLVModels.Billing.InfoleaseChargeAttempt]
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        currency <- map["currency"]
        amount <- map["amount"]
        tax <- map["tax"]
        developerPortion <- map["developerPortion"]
        status <- map["status"]
        statusOwner <- map["statusOwner"]
        type_ <- map["type_"]
        systemType <- map["systemType"]
        startDate <- (map["startDate"], CLVDateTransform())
        endDate <- (map["endDate"], CLVDateTransform())
        exportMonth <- map["exportMonth"]
        createdTime <- (map["createdTime"], CLVDateTransform())
        modifiedTime <- (map["modifiedTime"], CLVDateTransform())
        merchantAppCharge <- map["merchantAppCharge"]
        merchantPlanCharge <- map["merchantPlanCharge"]
        infoleaseChargeAttempts <- (map["infoleaseChargeAttempts"], CLVArrayTransform<CLVModels.Billing.InfoleaseChargeAttempt>())
  }
}


 
public enum ChargeStatus: String {
  case PENDING
  case IN_PROGRESS
  case BILLED
  case CANCELED
  case REFUND_PENDING
  case REFUND_PENDING_IF_BILLED
  case REFUND_IN_PROGRESS
  case REFUNDED
  case REFUND_DOWNGRADE_PENDING
  case REFUND_DOWNGRADE_IN_PROGRESS
  case REFUND_DOWNGRADE_CANCELED
  case REFUNDED_DOWNGRADE
  case DISBURSE_PENDING
  case DISBURSED
}


 
public enum ChargeSystemType: String {
  case BRAINTREE
  case INFOLEASE
}


 
public enum ChargeType: String {
  case SUBSCRIPTION
  case PRORATED_SUBSCRIPTION
  case PARTIAL_MONTH
  case METERED
}


 
public class DeviceCountInfo: NSObject, NSCoding, Mappable {
    public var totalDevices: Int?
    public var numStations: Int?
    public var numMobiles: Int?
    public var numMinis: Int?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(totalDevices, forKey: "totalDevices")
  aCoder.encodeObject(numStations, forKey: "numStations")
  aCoder.encodeObject(numMobiles, forKey: "numMobiles")
  aCoder.encodeObject(numMinis, forKey: "numMinis")
}

required public init(coder aDecoder: NSCoder) {
      totalDevices = aDecoder.decodeObjectForKey("totalDevices") as? Int
        numStations = aDecoder.decodeObjectForKey("numStations") as? Int
        numMobiles = aDecoder.decodeObjectForKey("numMobiles") as? Int
        numMinis = aDecoder.decodeObjectForKey("numMinis") as? Int
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      totalDevices <- map["totalDevices"]
        numStations <- map["numStations"]
        numMobiles <- map["numMobiles"]
        numMinis <- map["numMinis"]
  }
}


 
public class DevicePriceInfo: NSObject, NSCoding, Mappable {
    public var price: Int?
    public var deviceCountInfo: CLVModels.Billing.DeviceCountInfo?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(price, forKey: "price")
  aCoder.encodeObject(deviceCountInfo, forKey: "deviceCountInfo")
}

required public init(coder aDecoder: NSCoder) {
      price = aDecoder.decodeObjectForKey("price") as? Int
        deviceCountInfo = aDecoder.decodeObjectForKey("deviceCountInfo") as? CLVModels.Billing.DeviceCountInfo
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      price <- map["price"]
        deviceCountInfo <- map["deviceCountInfo"]
  }
}


 
public class InfoleaseChargeAttempt: NSObject, NSCoding, Mappable {
    public var id: String?
    public var status: CLVModels.Billing.InfoleaseChargeAttemptStatus?
    public var paymentType: String?
    public var infoleaseKey: String?
    public var contractNumber: String?
    public var glCode: String?
    public var tax: Int?
    public var postDate: String?
    public var createdTime: NSDate?
    public var modifiedTime: NSDate?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(status?.rawValue, forKey: "status")
  aCoder.encodeObject(paymentType, forKey: "paymentType")
  aCoder.encodeObject(infoleaseKey, forKey: "infoleaseKey")
  aCoder.encodeObject(contractNumber, forKey: "contractNumber")
  aCoder.encodeObject(glCode, forKey: "glCode")
  aCoder.encodeObject(tax, forKey: "tax")
  aCoder.encodeObject(postDate, forKey: "postDate")
  aCoder.encodeObject(createdTime, forKey: "createdTime")
  aCoder.encodeObject(modifiedTime, forKey: "modifiedTime")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        status = (aDecoder.decodeObjectForKey("status") as? String) != nil ?
      CLVModels.Billing.InfoleaseChargeAttemptStatus(rawValue: (aDecoder.decodeObjectForKey("status") as! String)) : nil
        paymentType = aDecoder.decodeObjectForKey("paymentType") as? String
        infoleaseKey = aDecoder.decodeObjectForKey("infoleaseKey") as? String
        contractNumber = aDecoder.decodeObjectForKey("contractNumber") as? String
        glCode = aDecoder.decodeObjectForKey("glCode") as? String
        tax = aDecoder.decodeObjectForKey("tax") as? Int
        postDate = aDecoder.decodeObjectForKey("postDate") as? String
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        modifiedTime = aDecoder.decodeObjectForKey("modifiedTime") as? NSDate
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        status <- map["status"]
        paymentType <- map["paymentType"]
        infoleaseKey <- map["infoleaseKey"]
        contractNumber <- map["contractNumber"]
        glCode <- map["glCode"]
        tax <- map["tax"]
        postDate <- map["postDate"]
        createdTime <- (map["createdTime"], CLVDateTransform())
        modifiedTime <- (map["modifiedTime"], CLVDateTransform())
  }
}


 
public enum InfoleaseChargeAttemptStatus: String {
  case BILLED
  case ACH_REJECT
  case REFUNDED
}


 
public class MerchantAppCharge: NSObject, NSCoding, Mappable {
    public var id: String?
    public var charge: CLVModels.Billing.Charge?
    /// The app that this line item belongs to.
    public var app: CLVModels.Apps.App?
    /// The merchant that this line item belongs to.
    public var merchant: CLVModels.Merchant.Merchant?
    public var createdTime: NSDate?
    public var modifiedTime: NSDate?
    /// A timestamp indicating when the app was installed by the merchant
    public var appInstallTime: NSDate?
    /// This is only filled in if the install that caused this app line item has been uninstalled
    public var appUninstallTime: NSDate?
    public var appMeteredEvents: [CLVModels.Billing.AppMeteredEvent]?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(charge, forKey: "charge")
  aCoder.encodeObject(app, forKey: "app")
  aCoder.encodeObject(merchant, forKey: "merchant")
  aCoder.encodeObject(createdTime, forKey: "createdTime")
  aCoder.encodeObject(modifiedTime, forKey: "modifiedTime")
  aCoder.encodeObject(appInstallTime, forKey: "appInstallTime")
  aCoder.encodeObject(appUninstallTime, forKey: "appUninstallTime")
  aCoder.encodeObject(appMeteredEvents, forKey: "appMeteredEvents")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        charge = aDecoder.decodeObjectForKey("charge") as? CLVModels.Billing.Charge
        app = aDecoder.decodeObjectForKey("app") as? CLVModels.Apps.App
        merchant = aDecoder.decodeObjectForKey("merchant") as? CLVModels.Merchant.Merchant
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        modifiedTime = aDecoder.decodeObjectForKey("modifiedTime") as? NSDate
        appInstallTime = aDecoder.decodeObjectForKey("appInstallTime") as? NSDate
        appUninstallTime = aDecoder.decodeObjectForKey("appUninstallTime") as? NSDate
        appMeteredEvents = aDecoder.decodeObjectForKey("appMeteredEvents") as? [CLVModels.Billing.AppMeteredEvent]
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        charge <- map["charge"]
        app <- map["app"]
        merchant <- map["merchant"]
        createdTime <- (map["createdTime"], CLVDateTransform())
        modifiedTime <- (map["modifiedTime"], CLVDateTransform())
        appInstallTime <- (map["appInstallTime"], CLVDateTransform())
        appUninstallTime <- (map["appUninstallTime"], CLVDateTransform())
        appMeteredEvents <- (map["appMeteredEvents"], CLVArrayTransform<CLVModels.Billing.AppMeteredEvent>())
  }
}


 
public class MerchantPlanCharge: NSObject, NSCoding, Mappable {
    public var id: String?
    public var charge: CLVModels.Billing.Charge?
    public var planChargeType: CLVModels.Billing.PlanChargeType?
    public var numOfDevices: Int?
    /// The merchant that this merchant plan charge belongs to.
    public var merchant: CLVModels.Merchant.Merchant?
    /// The merchant plan that this merchant plan charge was created for.
    public var merchantPlan: CLVModels.Merchant.MerchantPlan?
    public var createdTime: NSDate?
    public var modifiedTime: NSDate?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(charge, forKey: "charge")
  aCoder.encodeObject(planChargeType?.rawValue, forKey: "planChargeType")
  aCoder.encodeObject(numOfDevices, forKey: "numOfDevices")
  aCoder.encodeObject(merchant, forKey: "merchant")
  aCoder.encodeObject(merchantPlan, forKey: "merchantPlan")
  aCoder.encodeObject(createdTime, forKey: "createdTime")
  aCoder.encodeObject(modifiedTime, forKey: "modifiedTime")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        charge = aDecoder.decodeObjectForKey("charge") as? CLVModels.Billing.Charge
        planChargeType = (aDecoder.decodeObjectForKey("planChargeType") as? String) != nil ?
      CLVModels.Billing.PlanChargeType(rawValue: (aDecoder.decodeObjectForKey("planChargeType") as! String)) : nil
        numOfDevices = aDecoder.decodeObjectForKey("numOfDevices") as? Int
        merchant = aDecoder.decodeObjectForKey("merchant") as? CLVModels.Merchant.Merchant
        merchantPlan = aDecoder.decodeObjectForKey("merchantPlan") as? CLVModels.Merchant.MerchantPlan
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        modifiedTime = aDecoder.decodeObjectForKey("modifiedTime") as? NSDate
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        charge <- map["charge"]
        planChargeType <- map["planChargeType"]
        numOfDevices <- map["numOfDevices"]
        merchant <- map["merchant"]
        merchantPlan <- map["merchantPlan"]
        createdTime <- (map["createdTime"], CLVDateTransform())
        modifiedTime <- (map["modifiedTime"], CLVDateTransform())
  }
}


 
public enum PlanChargeType: String {
  case ADVANCE
  case ADJUSTMENT
}


 
public class Statement: NSObject, NSCoding, Mappable {
    public var year: Int?
    public var month: Int?
    public var amount: Int?
    public var tax: Int?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(year, forKey: "year")
  aCoder.encodeObject(month, forKey: "month")
  aCoder.encodeObject(amount, forKey: "amount")
  aCoder.encodeObject(tax, forKey: "tax")
}

required public init(coder aDecoder: NSCoder) {
      year = aDecoder.decodeObjectForKey("year") as? Int
        month = aDecoder.decodeObjectForKey("month") as? Int
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        tax = aDecoder.decodeObjectForKey("tax") as? Int
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      year <- map["year"]
        month <- map["month"]
        amount <- map["amount"]
        tax <- map["tax"]
  }
}

}
}
