 
import ObjectMapper

extension CLVModels {
public class Base {

 
public class Address: NSObject, NSCoding, Mappable {
    public var address1: String?
    public var address2: String?
    public var address3: String?
    public var city: String?
    public var country: String?
    public var phoneNumber: String?
    public var state: String?
    public var zip: String?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(address1, forKey: "address1")
  aCoder.encodeObject(address2, forKey: "address2")
  aCoder.encodeObject(address3, forKey: "address3")
  aCoder.encodeObject(city, forKey: "city")
  aCoder.encodeObject(country, forKey: "country")
  aCoder.encodeObject(phoneNumber, forKey: "phoneNumber")
  aCoder.encodeObject(state, forKey: "state")
  aCoder.encodeObject(zip, forKey: "zip")
}

required public init(coder aDecoder: NSCoder) {
      address1 = aDecoder.decodeObjectForKey("address1") as? String
        address2 = aDecoder.decodeObjectForKey("address2") as? String
        address3 = aDecoder.decodeObjectForKey("address3") as? String
        city = aDecoder.decodeObjectForKey("city") as? String
        country = aDecoder.decodeObjectForKey("country") as? String
        phoneNumber = aDecoder.decodeObjectForKey("phoneNumber") as? String
        state = aDecoder.decodeObjectForKey("state") as? String
        zip = aDecoder.decodeObjectForKey("zip") as? String
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      address1 <- map["address1"]
        address2 <- map["address2"]
        address3 <- map["address3"]
        city <- map["city"]
        country <- map["country"]
        phoneNumber <- map["phoneNumber"]
        state <- map["state"]
        zip <- map["zip"]
  }
}


 
public enum ApprovalStatus: String {
  case NEW
  case PENDING
  case APPROVED_PENDING_SIGNING
  case APPROVED
  case DENIED
  case PUBLISHED
}


 
public enum BusinessTypeCode: String {
  case FULL_SERVICE_RESTAURANT
  case QUICK_SERVICE_RESTAURANT
  case COFFEE_SHOP
  case BAKERY
  case BAR
  case FOOD_TRUCK
  case FROZEN_YOGURT
  case PIZZA
  case DELI
  case OTHER_RESTAURANT
  case BOUTIQUE
  case CONVENIENCE_STORE
  case GROCERY
  case LIQUOR_STORE
  case VAPE_SHOP
  case JEWELRY
  case FLORIST
  case OTHER_RETAIL
  case FITNESS
  case SPA
  case HAIR_SALON
  case HOME_AND_REPAIR
  case PROFESSIONAL_SERVICES
  case CATERING
  case OTHER_SERVICE
}


 
public class CountryInfo: NSObject, NSCoding, Mappable {
    /// ISO 3166-1-alpha-2 code
    public var countryCode: String?
    public var displayName: String?
    public var localDisplayName: String?
    public var defaultCurrency: String?
    public var defaultTimezone: String?
    /// Indicates whether the state/province field is required when creating the address
    public var stateProvinceRequired: Bool?
    /// Indicates whether the ZIP/Postal code field is required when creating the address
    public var zipPostalRequired: Bool?
    /// Indicates whether the county field is required when creating the address
    public var countyRequired: Bool?
    public var defaultLocale: String?
    /// Indicates whether the country is enabled for app market billing
    public var appMarketBillingEnabled: Bool?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(countryCode, forKey: "countryCode")
  aCoder.encodeObject(displayName, forKey: "displayName")
  aCoder.encodeObject(localDisplayName, forKey: "localDisplayName")
  aCoder.encodeObject(defaultCurrency, forKey: "defaultCurrency")
  aCoder.encodeObject(defaultTimezone, forKey: "defaultTimezone")
  aCoder.encodeObject(stateProvinceRequired, forKey: "stateProvinceRequired")
  aCoder.encodeObject(zipPostalRequired, forKey: "zipPostalRequired")
  aCoder.encodeObject(countyRequired, forKey: "countyRequired")
  aCoder.encodeObject(defaultLocale, forKey: "defaultLocale")
  aCoder.encodeObject(appMarketBillingEnabled, forKey: "appMarketBillingEnabled")
}

required public init(coder aDecoder: NSCoder) {
      countryCode = aDecoder.decodeObjectForKey("countryCode") as? String
        displayName = aDecoder.decodeObjectForKey("displayName") as? String
        localDisplayName = aDecoder.decodeObjectForKey("localDisplayName") as? String
        defaultCurrency = aDecoder.decodeObjectForKey("defaultCurrency") as? String
        defaultTimezone = aDecoder.decodeObjectForKey("defaultTimezone") as? String
        stateProvinceRequired = aDecoder.decodeObjectForKey("stateProvinceRequired") as? Bool
        zipPostalRequired = aDecoder.decodeObjectForKey("zipPostalRequired") as? Bool
        countyRequired = aDecoder.decodeObjectForKey("countyRequired") as? Bool
        defaultLocale = aDecoder.decodeObjectForKey("defaultLocale") as? String
        appMarketBillingEnabled = aDecoder.decodeObjectForKey("appMarketBillingEnabled") as? Bool
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      countryCode <- map["countryCode"]
        displayName <- map["displayName"]
        localDisplayName <- map["localDisplayName"]
        defaultCurrency <- map["defaultCurrency"]
        defaultTimezone <- map["defaultTimezone"]
        stateProvinceRequired <- map["stateProvinceRequired"]
        zipPostalRequired <- map["zipPostalRequired"]
        countyRequired <- map["countyRequired"]
        defaultLocale <- map["defaultLocale"]
        appMarketBillingEnabled <- map["appMarketBillingEnabled"]
  }
}


 
public class Reference: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
  }
}


 
public class ServiceCharge: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// The order with which the service charge is associated
    public var orderRef: CLVModels.Order.Order?
    /// Service charge name
    public var name: String?
    /// If this service charge is enabled
    public var enabled: Bool?
    /// Percent to charge; TODO: support non-integer service charges, e.g. 12.5%
    public var percentage: Int?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(orderRef, forKey: "orderRef")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(enabled, forKey: "enabled")
  aCoder.encodeObject(percentage, forKey: "percentage")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        orderRef = aDecoder.decodeObjectForKey("orderRef") as? CLVModels.Order.Order
        name = aDecoder.decodeObjectForKey("name") as? String
        enabled = aDecoder.decodeObjectForKey("enabled") as? Bool
        percentage = aDecoder.decodeObjectForKey("percentage") as? Int
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        orderRef <- map["orderRef"]
        name <- map["name"]
        enabled <- map["enabled"]
        percentage <- map["percentage"]
  }
}


 
public class Tender: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// If this merchant tender is editable
    public var editable: Bool?
    /// Label Key
    public var labelKey: String?
    /// Label Key
    public var label: String?
    /// If this tender opens the cash drawer
    public var opensCashDrawer: Bool?
    /// Allow tipping on payment from tender
    public var supportsTipping: Bool?
    /// If this merchant tender is enabled
    public var enabled: Bool?
    /// If this merchant tender is visible
    public var visible: Bool?
    /// Label Key
    public var instructions: String?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(editable, forKey: "editable")
  aCoder.encodeObject(labelKey, forKey: "labelKey")
  aCoder.encodeObject(label, forKey: "label")
  aCoder.encodeObject(opensCashDrawer, forKey: "opensCashDrawer")
  aCoder.encodeObject(supportsTipping, forKey: "supportsTipping")
  aCoder.encodeObject(enabled, forKey: "enabled")
  aCoder.encodeObject(visible, forKey: "visible")
  aCoder.encodeObject(instructions, forKey: "instructions")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        editable = aDecoder.decodeObjectForKey("editable") as? Bool
        labelKey = aDecoder.decodeObjectForKey("labelKey") as? String
        label = aDecoder.decodeObjectForKey("label") as? String
        opensCashDrawer = aDecoder.decodeObjectForKey("opensCashDrawer") as? Bool
        supportsTipping = aDecoder.decodeObjectForKey("supportsTipping") as? Bool
        enabled = aDecoder.decodeObjectForKey("enabled") as? Bool
        visible = aDecoder.decodeObjectForKey("visible") as? Bool
        instructions = aDecoder.decodeObjectForKey("instructions") as? String
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        editable <- map["editable"]
        labelKey <- map["labelKey"]
        label <- map["label"]
        opensCashDrawer <- map["opensCashDrawer"]
        supportsTipping <- map["supportsTipping"]
        enabled <- map["enabled"]
        visible <- map["visible"]
        instructions <- map["instructions"]
  }
}

}
}
