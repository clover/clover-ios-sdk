 
import ObjectMapper

extension CLVModels {
public class Developer {

 
public class Developer: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// Developer's name.  Could be a company name.  Whatever is to be shown as who made the app in App Marketplace, e.g. NoshList, Pioneer Works Inc., Seven Spaces, etc.  Also used as (optional) Business DBA (Doing Business Name) name when sending to Braintree for app billing background check.
    public var name: String?
    /// Developer's individual first name
    public var firstName: String?
    /// Developer's individual last name
    public var lastName: String?
    /// Developer's email
    public var email: String?
    /// Developer's phone
    public var phone: String?
    /// Developer's date of birth
    public var dob: String?
    /// Developer's SSN; won't be stored in the clear in the DB; will be stored encrypted in sensitiveInfo
    public var ssn: String?
    /// Developer's address
    public var address: String?
    /// Developer's city
    public var city: String?
    /// Developer's county
    public var county: String?
    /// Developer's state
    public var state: String?
    /// Developer's country
    public var country: String?
    /// Developer's postal code
    public var postalCode: String?
    /// Developer's bank account number; won't be stored in the clear in the DB; will be stored encrypted in sensitiveInfo
    public var bankAccountNumber: String?
    /// Developer's bank routing number
    public var bankRoutingNumber: String?
    /// Developer's business legal name
    public var businessLegalName: String?
    /// Developer's Tax ID
    public var tin: String?
    /// Developer's VAT Register Number
    public var vatRegisterNumber: String?
    /// Sensitive data encrypted
    public var sensitiveData: String?
    /// Developer's business address
    public var businessAddress: String?
    /// Developer's business city
    public var businessCity: String?
    /// Developer's business state
    public var businessState: String?
    /// Developer's business country
    public var businessCountry: String?
    /// Developer's business postal code
    public var businessPostalCode: String?
    /// Developer's billing status
    public var billingStatus: CLVModels.Developer.DeveloperBillingStatus?
    /// Developer's billing status message
    public var billingStatusMessage: String?
    public var approvalStatus: CLVModels.Base.ApprovalStatus?
    /// If the user has accepted the developer agreement
    public var acceptedAgreement: Bool?
    /// Name of public relations contact
    public var prName: String?
    /// Email of public relations contact
    public var prEmail: String?
    /// Phone of public relations contact
    public var prPhone: String?
    /// Developer's business website
    public var website: String?
    /// Timestamp indicating the last time the developer was modified.
    public var modifiedTime: NSDate?
    /// The user account that owns this developer account.
    public var owner: CLVModels.Account.Account?
    /// Temporary while we are switching US billing systems
    public var appBillingSystem: String?
    /// The Infolease vendor code.  This is generated when the developer is on-boarded in the Infolease system.
    public var infoleaseVendorCode: String?
    /// The Infolease GL (General Ledger) code.  Only for specific apps.  Will usually be null.
    public var infoleaseGlCode: String?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(firstName, forKey: "firstName")
  aCoder.encodeObject(lastName, forKey: "lastName")
  aCoder.encodeObject(email, forKey: "email")
  aCoder.encodeObject(phone, forKey: "phone")
  aCoder.encodeObject(dob, forKey: "dob")
  aCoder.encodeObject(ssn, forKey: "ssn")
  aCoder.encodeObject(address, forKey: "address")
  aCoder.encodeObject(city, forKey: "city")
  aCoder.encodeObject(county, forKey: "county")
  aCoder.encodeObject(state, forKey: "state")
  aCoder.encodeObject(country, forKey: "country")
  aCoder.encodeObject(postalCode, forKey: "postalCode")
  aCoder.encodeObject(bankAccountNumber, forKey: "bankAccountNumber")
  aCoder.encodeObject(bankRoutingNumber, forKey: "bankRoutingNumber")
  aCoder.encodeObject(businessLegalName, forKey: "businessLegalName")
  aCoder.encodeObject(tin, forKey: "tin")
  aCoder.encodeObject(vatRegisterNumber, forKey: "vatRegisterNumber")
  aCoder.encodeObject(sensitiveData, forKey: "sensitiveData")
  aCoder.encodeObject(businessAddress, forKey: "businessAddress")
  aCoder.encodeObject(businessCity, forKey: "businessCity")
  aCoder.encodeObject(businessState, forKey: "businessState")
  aCoder.encodeObject(businessCountry, forKey: "businessCountry")
  aCoder.encodeObject(businessPostalCode, forKey: "businessPostalCode")
  aCoder.encodeObject(billingStatus?.rawValue, forKey: "billingStatus")
  aCoder.encodeObject(billingStatusMessage, forKey: "billingStatusMessage")
  aCoder.encodeObject(approvalStatus?.rawValue, forKey: "approvalStatus")
  aCoder.encodeObject(acceptedAgreement, forKey: "acceptedAgreement")
  aCoder.encodeObject(prName, forKey: "prName")
  aCoder.encodeObject(prEmail, forKey: "prEmail")
  aCoder.encodeObject(prPhone, forKey: "prPhone")
  aCoder.encodeObject(website, forKey: "website")
  aCoder.encodeObject(modifiedTime, forKey: "modifiedTime")
  aCoder.encodeObject(owner, forKey: "owner")
  aCoder.encodeObject(appBillingSystem, forKey: "appBillingSystem")
  aCoder.encodeObject(infoleaseVendorCode, forKey: "infoleaseVendorCode")
  aCoder.encodeObject(infoleaseGlCode, forKey: "infoleaseGlCode")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        firstName = aDecoder.decodeObjectForKey("firstName") as? String
        lastName = aDecoder.decodeObjectForKey("lastName") as? String
        email = aDecoder.decodeObjectForKey("email") as? String
        phone = aDecoder.decodeObjectForKey("phone") as? String
        dob = aDecoder.decodeObjectForKey("dob") as? String
        ssn = aDecoder.decodeObjectForKey("ssn") as? String
        address = aDecoder.decodeObjectForKey("address") as? String
        city = aDecoder.decodeObjectForKey("city") as? String
        county = aDecoder.decodeObjectForKey("county") as? String
        state = aDecoder.decodeObjectForKey("state") as? String
        country = aDecoder.decodeObjectForKey("country") as? String
        postalCode = aDecoder.decodeObjectForKey("postalCode") as? String
        bankAccountNumber = aDecoder.decodeObjectForKey("bankAccountNumber") as? String
        bankRoutingNumber = aDecoder.decodeObjectForKey("bankRoutingNumber") as? String
        businessLegalName = aDecoder.decodeObjectForKey("businessLegalName") as? String
        tin = aDecoder.decodeObjectForKey("tin") as? String
        vatRegisterNumber = aDecoder.decodeObjectForKey("vatRegisterNumber") as? String
        sensitiveData = aDecoder.decodeObjectForKey("sensitiveData") as? String
        businessAddress = aDecoder.decodeObjectForKey("businessAddress") as? String
        businessCity = aDecoder.decodeObjectForKey("businessCity") as? String
        businessState = aDecoder.decodeObjectForKey("businessState") as? String
        businessCountry = aDecoder.decodeObjectForKey("businessCountry") as? String
        businessPostalCode = aDecoder.decodeObjectForKey("businessPostalCode") as? String
        billingStatus = (aDecoder.decodeObjectForKey("billingStatus") as? String) != nil ?
      CLVModels.Developer.DeveloperBillingStatus(rawValue: (aDecoder.decodeObjectForKey("billingStatus") as! String)) : nil
        billingStatusMessage = aDecoder.decodeObjectForKey("billingStatusMessage") as? String
        approvalStatus = (aDecoder.decodeObjectForKey("approvalStatus") as? String) != nil ?
      CLVModels.Base.ApprovalStatus(rawValue: (aDecoder.decodeObjectForKey("approvalStatus") as! String)) : nil
        acceptedAgreement = aDecoder.decodeObjectForKey("acceptedAgreement") as? Bool
        prName = aDecoder.decodeObjectForKey("prName") as? String
        prEmail = aDecoder.decodeObjectForKey("prEmail") as? String
        prPhone = aDecoder.decodeObjectForKey("prPhone") as? String
        website = aDecoder.decodeObjectForKey("website") as? String
        modifiedTime = aDecoder.decodeObjectForKey("modifiedTime") as? NSDate
        owner = aDecoder.decodeObjectForKey("owner") as? CLVModels.Account.Account
        appBillingSystem = aDecoder.decodeObjectForKey("appBillingSystem") as? String
        infoleaseVendorCode = aDecoder.decodeObjectForKey("infoleaseVendorCode") as? String
        infoleaseGlCode = aDecoder.decodeObjectForKey("infoleaseGlCode") as? String
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        email <- map["email"]
        phone <- map["phone"]
        dob <- map["dob"]
        ssn <- map["ssn"]
        address <- map["address"]
        city <- map["city"]
        county <- map["county"]
        state <- map["state"]
        country <- map["country"]
        postalCode <- map["postalCode"]
        bankAccountNumber <- map["bankAccountNumber"]
        bankRoutingNumber <- map["bankRoutingNumber"]
        businessLegalName <- map["businessLegalName"]
        tin <- map["tin"]
        vatRegisterNumber <- map["vatRegisterNumber"]
        sensitiveData <- map["sensitiveData"]
        businessAddress <- map["businessAddress"]
        businessCity <- map["businessCity"]
        businessState <- map["businessState"]
        businessCountry <- map["businessCountry"]
        businessPostalCode <- map["businessPostalCode"]
        billingStatus <- map["billingStatus"]
        billingStatusMessage <- map["billingStatusMessage"]
        approvalStatus <- map["approvalStatus"]
        acceptedAgreement <- map["acceptedAgreement"]
        prName <- map["prName"]
        prEmail <- map["prEmail"]
        prPhone <- map["prPhone"]
        website <- map["website"]
        modifiedTime <- (map["modifiedTime"], CLVDateTransform())
        owner <- map["owner"]
        appBillingSystem <- map["appBillingSystem"]
        infoleaseVendorCode <- map["infoleaseVendorCode"]
        infoleaseGlCode <- map["infoleaseGlCode"]
  }
}


 
public enum DeveloperBillingStatus: String {
  case PENDING
  case APPROVED
  case DECLINED
  case ERROR
}


 
public class MerchantGroup: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// Group name.
    public var name: String?
    /// The developer that created this merchant group.
    public var developer_: CLVModels.Developer.Developer?
    /// Timestamp indicating when the group was created.
    public var createdTime: NSDate?
    /// The merchants directly added to the group (static merchants).
    public var merchants: [CLVModels.Merchant.Merchant]?
    /// The filter query parameters used to join merchants to this group.
    public var merchantFilter: String?
    /// The merchants in the group joined by the filter.
    public var filterMerchants: [CLVModels.Merchant.Merchant]?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(developer_, forKey: "developer_")
  aCoder.encodeObject(createdTime, forKey: "createdTime")
  aCoder.encodeObject(merchants, forKey: "merchants")
  aCoder.encodeObject(merchantFilter, forKey: "merchantFilter")
  aCoder.encodeObject(filterMerchants, forKey: "filterMerchants")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        developer_ = aDecoder.decodeObjectForKey("developer_") as? CLVModels.Developer.Developer
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        merchants = aDecoder.decodeObjectForKey("merchants") as? [CLVModels.Merchant.Merchant]
        merchantFilter = aDecoder.decodeObjectForKey("merchantFilter") as? String
        filterMerchants = aDecoder.decodeObjectForKey("filterMerchants") as? [CLVModels.Merchant.Merchant]
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        developer_ <- map["developer_"]
        createdTime <- (map["createdTime"], CLVDateTransform())
        merchants <- (map["merchants"], CLVArrayTransform<CLVModels.Merchant.Merchant>())
        merchantFilter <- map["merchantFilter"]
        filterMerchants <- (map["filterMerchants"], CLVArrayTransform<CLVModels.Merchant.Merchant>())
  }
}

}
}
