 
import ObjectMapper

extension CLVModels {
public class Merchant {

 
public class Gateway: NSObject, NSCoding, Mappable {
    public var paymentProcessorName: String?
    public var authorizationFrontEnd: String?
    public var acquiringBackEnd: String?
    public var paymentGatewayApi: String?
    public var accountName: String?
    public var mid: String?
    public var tid: String?
    public var storeId: String?
    public var supportsTipping: Bool?
    public var frontendMid: String?
    public var backendMid: String?
    public var supportsTipAdjust: Bool?
    public var supportsNakedCredit: Bool?
    public var keyPrefix: String?
    public var keyInfo: [String:String]?
    public var closingTime: String?
    public var newBatchCloseEnabled: Bool?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(paymentProcessorName, forKey: "paymentProcessorName")
  aCoder.encodeObject(authorizationFrontEnd, forKey: "authorizationFrontEnd")
  aCoder.encodeObject(acquiringBackEnd, forKey: "acquiringBackEnd")
  aCoder.encodeObject(paymentGatewayApi, forKey: "paymentGatewayApi")
  aCoder.encodeObject(accountName, forKey: "accountName")
  aCoder.encodeObject(mid, forKey: "mid")
  aCoder.encodeObject(tid, forKey: "tid")
  aCoder.encodeObject(storeId, forKey: "storeId")
  aCoder.encodeObject(supportsTipping, forKey: "supportsTipping")
  aCoder.encodeObject(frontendMid, forKey: "frontendMid")
  aCoder.encodeObject(backendMid, forKey: "backendMid")
  aCoder.encodeObject(supportsTipAdjust, forKey: "supportsTipAdjust")
  aCoder.encodeObject(supportsNakedCredit, forKey: "supportsNakedCredit")
  aCoder.encodeObject(keyPrefix, forKey: "keyPrefix")
  aCoder.encodeObject(keyInfo, forKey: "keyInfo")
  aCoder.encodeObject(closingTime, forKey: "closingTime")
  aCoder.encodeObject(newBatchCloseEnabled, forKey: "newBatchCloseEnabled")
}

required public init(coder aDecoder: NSCoder) {
      paymentProcessorName = aDecoder.decodeObjectForKey("paymentProcessorName") as? String
        authorizationFrontEnd = aDecoder.decodeObjectForKey("authorizationFrontEnd") as? String
        acquiringBackEnd = aDecoder.decodeObjectForKey("acquiringBackEnd") as? String
        paymentGatewayApi = aDecoder.decodeObjectForKey("paymentGatewayApi") as? String
        accountName = aDecoder.decodeObjectForKey("accountName") as? String
        mid = aDecoder.decodeObjectForKey("mid") as? String
        tid = aDecoder.decodeObjectForKey("tid") as? String
        storeId = aDecoder.decodeObjectForKey("storeId") as? String
        supportsTipping = aDecoder.decodeObjectForKey("supportsTipping") as? Bool
        frontendMid = aDecoder.decodeObjectForKey("frontendMid") as? String
        backendMid = aDecoder.decodeObjectForKey("backendMid") as? String
        supportsTipAdjust = aDecoder.decodeObjectForKey("supportsTipAdjust") as? Bool
        supportsNakedCredit = aDecoder.decodeObjectForKey("supportsNakedCredit") as? Bool
        keyPrefix = aDecoder.decodeObjectForKey("keyPrefix") as? String
        keyInfo = aDecoder.decodeObjectForKey("keyInfo") as? [String:String]
        closingTime = aDecoder.decodeObjectForKey("closingTime") as? String
        newBatchCloseEnabled = aDecoder.decodeObjectForKey("newBatchCloseEnabled") as? Bool
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      paymentProcessorName <- map["paymentProcessorName"]
        authorizationFrontEnd <- map["authorizationFrontEnd"]
        acquiringBackEnd <- map["acquiringBackEnd"]
        paymentGatewayApi <- map["paymentGatewayApi"]
        accountName <- map["accountName"]
        mid <- map["mid"]
        tid <- map["tid"]
        storeId <- map["storeId"]
        supportsTipping <- map["supportsTipping"]
        frontendMid <- map["frontendMid"]
        backendMid <- map["backendMid"]
        supportsTipAdjust <- map["supportsTipAdjust"]
        supportsNakedCredit <- map["supportsNakedCredit"]
        keyPrefix <- map["keyPrefix"]
        keyInfo <- map["keyInfo"]
        closingTime <- map["closingTime"]
        newBatchCloseEnabled <- map["newBatchCloseEnabled"]
  }
}


 
public class Logo: NSObject, NSCoding, Mappable {
    /// The type of merchant logo
    public var logoType: CLVModels.Merchant.LogoType?
    /// The filename of the logo
    public var logoFilename: String?
    /// URL of the logo file. Generated from filename.
    public var url: String?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(logoType?.rawValue, forKey: "logoType")
  aCoder.encodeObject(logoFilename, forKey: "logoFilename")
  aCoder.encodeObject(url, forKey: "url")
}

required public init(coder aDecoder: NSCoder) {
      logoType = (aDecoder.decodeObjectForKey("logoType") as? String) != nil ?
      CLVModels.Merchant.LogoType(rawValue: (aDecoder.decodeObjectForKey("logoType") as! String)) : nil
        logoFilename = aDecoder.decodeObjectForKey("logoFilename") as? String
        url = aDecoder.decodeObjectForKey("url") as? String
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      logoType <- map["logoType"]
        logoFilename <- map["logoFilename"]
        url <- map["url"]
  }
}


 
public enum LogoType: String {
  case BUSINESS
  case RECEIPT
}


 
public class Merchant: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// Name of the merchant
    public var name: String?
    /// The account that owns this merchant
    public var owner: CLVModels.Employees.Employee?
    /// The address of the merchant.
    public var address: CLVModels.Base.Address?
    public var merchantPlan: CLVModels.Merchant.MerchantPlan?
    public var defaultCurrency: String?
    public var phoneNumber: String?
    public var website: String?
    public var logos: [CLVModels.Merchant.Logo]?
    public var createdTime: NSDate?
    public var properties: CLVModels.Merchant.MerchantProperties?
    public var gateway: CLVModels.Merchant.Gateway?
    public var tipSuggestions: [CLVModels.Merchant.TipSuggestion]?
    /// This merchant's employees
    public var employees: [CLVModels.Employees.Employee]?
    /// This merchant's inventory items
    public var items: [CLVModels.Inventory.Item]?
    /// This merchant's inventory tags
    public var tags: [CLVModels.Inventory.Tag]?
    /// This merchant's supported tenders
    public var tenders: [CLVModels.Base.Tender]?
    /// This merchant's employees' shifts
    public var shifts: [CLVModels.Employees.Shift]?
    /// This merchant's orders
    public var orders: [CLVModels.Order.Order]?
    /// This merchant's order payments
    public var payments: [CLVModels.Payments.Payment]?
    public var taxRates: [CLVModels.Inventory.TaxRate]?
    public var printers: [CLVModels.Printer.Printer]?
    public var modifierGroups: [CLVModels.Inventory.ModifierGroup]?
    public var orderTypes: [CLVModels.Order.OrderType]?
    /// The merchant's reseller
    public var reseller: CLVModels.Base.Reference?
    /// This merchant's opening hours
    public var opening_hours: [CLVModels.Hours.HoursSet]?
    /// The business type of the merchant
    public var businessTypeCode: CLVModels.Base.BusinessTypeCode?
    /// Returns true when the merchant is billable.
    public var isBillable: Bool?
    /// A list of devices a merchant owns
    public var devices: [CLVModels.Device.Device]?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(owner, forKey: "owner")
  aCoder.encodeObject(address, forKey: "address")
  aCoder.encodeObject(merchantPlan, forKey: "merchantPlan")
  aCoder.encodeObject(defaultCurrency, forKey: "defaultCurrency")
  aCoder.encodeObject(phoneNumber, forKey: "phoneNumber")
  aCoder.encodeObject(website, forKey: "website")
  aCoder.encodeObject(logos, forKey: "logos")
  aCoder.encodeObject(createdTime, forKey: "createdTime")
  aCoder.encodeObject(properties, forKey: "properties")
  aCoder.encodeObject(gateway, forKey: "gateway")
  aCoder.encodeObject(tipSuggestions, forKey: "tipSuggestions")
  aCoder.encodeObject(employees, forKey: "employees")
  aCoder.encodeObject(items, forKey: "items")
  aCoder.encodeObject(tags, forKey: "tags")
  aCoder.encodeObject(tenders, forKey: "tenders")
  aCoder.encodeObject(shifts, forKey: "shifts")
  aCoder.encodeObject(orders, forKey: "orders")
  aCoder.encodeObject(payments, forKey: "payments")
  aCoder.encodeObject(taxRates, forKey: "taxRates")
  aCoder.encodeObject(printers, forKey: "printers")
  aCoder.encodeObject(modifierGroups, forKey: "modifierGroups")
  aCoder.encodeObject(orderTypes, forKey: "orderTypes")
  aCoder.encodeObject(reseller, forKey: "reseller")
  aCoder.encodeObject(opening_hours, forKey: "opening_hours")
  aCoder.encodeObject(businessTypeCode?.rawValue, forKey: "businessTypeCode")
  aCoder.encodeObject(isBillable, forKey: "isBillable")
  aCoder.encodeObject(devices, forKey: "devices")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        owner = aDecoder.decodeObjectForKey("owner") as? CLVModels.Employees.Employee
        address = aDecoder.decodeObjectForKey("address") as? CLVModels.Base.Address
        merchantPlan = aDecoder.decodeObjectForKey("merchantPlan") as? CLVModels.Merchant.MerchantPlan
        defaultCurrency = aDecoder.decodeObjectForKey("defaultCurrency") as? String
        phoneNumber = aDecoder.decodeObjectForKey("phoneNumber") as? String
        website = aDecoder.decodeObjectForKey("website") as? String
        logos = aDecoder.decodeObjectForKey("logos") as? [CLVModels.Merchant.Logo]
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        properties = aDecoder.decodeObjectForKey("properties") as? CLVModels.Merchant.MerchantProperties
        gateway = aDecoder.decodeObjectForKey("gateway") as? CLVModels.Merchant.Gateway
        tipSuggestions = aDecoder.decodeObjectForKey("tipSuggestions") as? [CLVModels.Merchant.TipSuggestion]
        employees = aDecoder.decodeObjectForKey("employees") as? [CLVModels.Employees.Employee]
        items = aDecoder.decodeObjectForKey("items") as? [CLVModels.Inventory.Item]
        tags = aDecoder.decodeObjectForKey("tags") as? [CLVModels.Inventory.Tag]
        tenders = aDecoder.decodeObjectForKey("tenders") as? [CLVModels.Base.Tender]
        shifts = aDecoder.decodeObjectForKey("shifts") as? [CLVModels.Employees.Shift]
        orders = aDecoder.decodeObjectForKey("orders") as? [CLVModels.Order.Order]
        payments = aDecoder.decodeObjectForKey("payments") as? [CLVModels.Payments.Payment]
        taxRates = aDecoder.decodeObjectForKey("taxRates") as? [CLVModels.Inventory.TaxRate]
        printers = aDecoder.decodeObjectForKey("printers") as? [CLVModels.Printer.Printer]
        modifierGroups = aDecoder.decodeObjectForKey("modifierGroups") as? [CLVModels.Inventory.ModifierGroup]
        orderTypes = aDecoder.decodeObjectForKey("orderTypes") as? [CLVModels.Order.OrderType]
        reseller = aDecoder.decodeObjectForKey("reseller") as? CLVModels.Base.Reference
        opening_hours = aDecoder.decodeObjectForKey("opening_hours") as? [CLVModels.Hours.HoursSet]
        businessTypeCode = (aDecoder.decodeObjectForKey("businessTypeCode") as? String) != nil ?
      CLVModels.Base.BusinessTypeCode(rawValue: (aDecoder.decodeObjectForKey("businessTypeCode") as! String)) : nil
        isBillable = aDecoder.decodeObjectForKey("isBillable") as? Bool
        devices = aDecoder.decodeObjectForKey("devices") as? [CLVModels.Device.Device]
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        owner <- map["owner"]
        address <- map["address"]
        merchantPlan <- map["merchantPlan"]
        defaultCurrency <- map["defaultCurrency"]
        phoneNumber <- map["phoneNumber"]
        website <- map["website"]
        logos <- (map["logos"], CLVArrayTransform<CLVModels.Merchant.Logo>())
        createdTime <- (map["createdTime"], CLVDateTransform())
        properties <- map["properties"]
        gateway <- map["gateway"]
        tipSuggestions <- (map["tipSuggestions"], CLVArrayTransform<CLVModels.Merchant.TipSuggestion>())
        employees <- (map["employees"], CLVArrayTransform<CLVModels.Employees.Employee>())
        items <- (map["items"], CLVArrayTransform<CLVModels.Inventory.Item>())
        tags <- (map["tags"], CLVArrayTransform<CLVModels.Inventory.Tag>())
        tenders <- (map["tenders"], CLVArrayTransform<CLVModels.Base.Tender>())
        shifts <- (map["shifts"], CLVArrayTransform<CLVModels.Employees.Shift>())
        orders <- (map["orders"], CLVArrayTransform<CLVModels.Order.Order>())
        payments <- (map["payments"], CLVArrayTransform<CLVModels.Payments.Payment>())
        taxRates <- (map["taxRates"], CLVArrayTransform<CLVModels.Inventory.TaxRate>())
        printers <- (map["printers"], CLVArrayTransform<CLVModels.Printer.Printer>())
        modifierGroups <- (map["modifierGroups"], CLVArrayTransform<CLVModels.Inventory.ModifierGroup>())
        orderTypes <- (map["orderTypes"], CLVArrayTransform<CLVModels.Order.OrderType>())
        reseller <- map["reseller"]
        opening_hours <- (map["opening_hours"], CLVArrayTransform<CLVModels.Hours.HoursSet>())
        businessTypeCode <- map["businessTypeCode"]
        isBillable <- map["isBillable"]
        devices <- (map["devices"], CLVArrayTransform<CLVModels.Device.Device>())
  }
}


 
public class MerchantPlan: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// The name of the merchant plan
    public var name: String?
    /// Description of the plan
    public var description_: String?
    public var price: Int?
    public var modules: [CLVModels.Merchant.Module]?
    public var appBundle: CLVModels.Apps.AppBundle?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(description_, forKey: "description_")
  aCoder.encodeObject(price, forKey: "price")
  aCoder.encodeObject(modules, forKey: "modules")
  aCoder.encodeObject(appBundle, forKey: "appBundle")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        description_ = aDecoder.decodeObjectForKey("description_") as? String
        price = aDecoder.decodeObjectForKey("price") as? Int
        modules = aDecoder.decodeObjectForKey("modules") as? [CLVModels.Merchant.Module]
        appBundle = aDecoder.decodeObjectForKey("appBundle") as? CLVModels.Apps.AppBundle
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        description_ <- map["description_"]
        price <- map["price"]
        modules <- (map["modules"], CLVArrayTransform<CLVModels.Merchant.Module>())
        appBundle <- map["appBundle"]
  }
}


 
public class MerchantProperties: NSObject, NSCoding, Mappable {
    public var defaultCurrency: String?
    public var tipsEnabled: Bool?
    public var receiptProperties: String?
    public var summaryHour: Int?
    public var signatureThreshold: Int?
    public var hasDefaultEmployee: Bool?
    public var tipRateDefault: Int?
    public var onPaperTipSignatures: Bool?
    public var autoLogout: Bool?
    public var orderTitle: CLVModels.Merchant.OrderTitle?
    public var orderTitleMax: Int?
    public var resetOnReportingTime: Bool?
    public var notesOnOrders: Bool?
    public var deleteOrders: Bool?
    public var removeTaxEnabled: Bool?
    public var groupLineItems: Bool?
    public var alternateInventoryNames: Bool?
    public var autoPrint: Bool?
    public var hardwareProfile: String?
    public var infoleaseSuppressBilling: Bool?
    public var infoleaseSuppressPlanBilling: Bool?
    public var shippingAddress: String?
    public var marketingEnabled: Bool?
    public var marketingPreferenceText: String?
    public var bankMarker: Int?
    public var supportPhone: String?
    public var supportEmail: String?
    public var manualCloseout: Bool?
    public var showCloseoutOrders: Bool?
    public var sendCloseoutEmail: Bool?
    public var stayInCategory: Bool?
    /// The locale of the merchant.
    public var locale: String?
    public var timezone: String?
    /// Whether this merchant is in a VAT country
    public var vat: Bool?
    /// The VAT tax name that is shown on receipts
    public var vatTaxName: String?
    /// Temporary while we are switching US billing systems
    public var appBillingSystem: String?
    /// The ABA Account Number.  Supplied by First Data.
    public var abaAccountNumber: String?
    /// The Masked DDA Account Number.  Supplied by First Data.
    public var ddaAccountNumber: String?
    public var trackStock: Bool?
    public var updateStock: Bool?
    public var allowClockOutWithOpenOrders: Bool?
    public var logInClockInPrompt: Bool?
    public var accountType: String?
    /// The business type of the merchant
    public var businessTypeCode: CLVModels.Base.BusinessTypeCode?
    public var pinLength: Int?
    /// Whether cash back is enabled for this merchant
    public var cashBackEnabled: Bool?
    /// List of cash back possible cash back amounts
    public var cashBackOptions: String?
    /// The maximum amount of cash back that the customer can select.
    public var maxCashBack: Int?
    /// Merchant hierarchy (Business, Bank, Agent, Corp, Chain). Supplied by First Data.
    public var hierarchy: String?
    /// Whether or not merchant has consented to infolease billing
    public var hasConsented: Bool?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(defaultCurrency, forKey: "defaultCurrency")
  aCoder.encodeObject(tipsEnabled, forKey: "tipsEnabled")
  aCoder.encodeObject(receiptProperties, forKey: "receiptProperties")
  aCoder.encodeObject(summaryHour, forKey: "summaryHour")
  aCoder.encodeObject(signatureThreshold, forKey: "signatureThreshold")
  aCoder.encodeObject(hasDefaultEmployee, forKey: "hasDefaultEmployee")
  aCoder.encodeObject(tipRateDefault, forKey: "tipRateDefault")
  aCoder.encodeObject(onPaperTipSignatures, forKey: "onPaperTipSignatures")
  aCoder.encodeObject(autoLogout, forKey: "autoLogout")
  aCoder.encodeObject(orderTitle?.rawValue, forKey: "orderTitle")
  aCoder.encodeObject(orderTitleMax, forKey: "orderTitleMax")
  aCoder.encodeObject(resetOnReportingTime, forKey: "resetOnReportingTime")
  aCoder.encodeObject(notesOnOrders, forKey: "notesOnOrders")
  aCoder.encodeObject(deleteOrders, forKey: "deleteOrders")
  aCoder.encodeObject(removeTaxEnabled, forKey: "removeTaxEnabled")
  aCoder.encodeObject(groupLineItems, forKey: "groupLineItems")
  aCoder.encodeObject(alternateInventoryNames, forKey: "alternateInventoryNames")
  aCoder.encodeObject(autoPrint, forKey: "autoPrint")
  aCoder.encodeObject(hardwareProfile, forKey: "hardwareProfile")
  aCoder.encodeObject(infoleaseSuppressBilling, forKey: "infoleaseSuppressBilling")
  aCoder.encodeObject(infoleaseSuppressPlanBilling, forKey: "infoleaseSuppressPlanBilling")
  aCoder.encodeObject(shippingAddress, forKey: "shippingAddress")
  aCoder.encodeObject(marketingEnabled, forKey: "marketingEnabled")
  aCoder.encodeObject(marketingPreferenceText, forKey: "marketingPreferenceText")
  aCoder.encodeObject(bankMarker, forKey: "bankMarker")
  aCoder.encodeObject(supportPhone, forKey: "supportPhone")
  aCoder.encodeObject(supportEmail, forKey: "supportEmail")
  aCoder.encodeObject(manualCloseout, forKey: "manualCloseout")
  aCoder.encodeObject(showCloseoutOrders, forKey: "showCloseoutOrders")
  aCoder.encodeObject(sendCloseoutEmail, forKey: "sendCloseoutEmail")
  aCoder.encodeObject(stayInCategory, forKey: "stayInCategory")
  aCoder.encodeObject(locale, forKey: "locale")
  aCoder.encodeObject(timezone, forKey: "timezone")
  aCoder.encodeObject(vat, forKey: "vat")
  aCoder.encodeObject(vatTaxName, forKey: "vatTaxName")
  aCoder.encodeObject(appBillingSystem, forKey: "appBillingSystem")
  aCoder.encodeObject(abaAccountNumber, forKey: "abaAccountNumber")
  aCoder.encodeObject(ddaAccountNumber, forKey: "ddaAccountNumber")
  aCoder.encodeObject(trackStock, forKey: "trackStock")
  aCoder.encodeObject(updateStock, forKey: "updateStock")
  aCoder.encodeObject(allowClockOutWithOpenOrders, forKey: "allowClockOutWithOpenOrders")
  aCoder.encodeObject(logInClockInPrompt, forKey: "logInClockInPrompt")
  aCoder.encodeObject(accountType, forKey: "accountType")
  aCoder.encodeObject(businessTypeCode?.rawValue, forKey: "businessTypeCode")
  aCoder.encodeObject(pinLength, forKey: "pinLength")
  aCoder.encodeObject(cashBackEnabled, forKey: "cashBackEnabled")
  aCoder.encodeObject(cashBackOptions, forKey: "cashBackOptions")
  aCoder.encodeObject(maxCashBack, forKey: "maxCashBack")
  aCoder.encodeObject(hierarchy, forKey: "hierarchy")
  aCoder.encodeObject(hasConsented, forKey: "hasConsented")
}

required public init(coder aDecoder: NSCoder) {
      defaultCurrency = aDecoder.decodeObjectForKey("defaultCurrency") as? String
        tipsEnabled = aDecoder.decodeObjectForKey("tipsEnabled") as? Bool
        receiptProperties = aDecoder.decodeObjectForKey("receiptProperties") as? String
        summaryHour = aDecoder.decodeObjectForKey("summaryHour") as? Int
        signatureThreshold = aDecoder.decodeObjectForKey("signatureThreshold") as? Int
        hasDefaultEmployee = aDecoder.decodeObjectForKey("hasDefaultEmployee") as? Bool
        tipRateDefault = aDecoder.decodeObjectForKey("tipRateDefault") as? Int
        onPaperTipSignatures = aDecoder.decodeObjectForKey("onPaperTipSignatures") as? Bool
        autoLogout = aDecoder.decodeObjectForKey("autoLogout") as? Bool
        orderTitle = (aDecoder.decodeObjectForKey("orderTitle") as? String) != nil ?
      CLVModels.Merchant.OrderTitle(rawValue: (aDecoder.decodeObjectForKey("orderTitle") as! String)) : nil
        orderTitleMax = aDecoder.decodeObjectForKey("orderTitleMax") as? Int
        resetOnReportingTime = aDecoder.decodeObjectForKey("resetOnReportingTime") as? Bool
        notesOnOrders = aDecoder.decodeObjectForKey("notesOnOrders") as? Bool
        deleteOrders = aDecoder.decodeObjectForKey("deleteOrders") as? Bool
        removeTaxEnabled = aDecoder.decodeObjectForKey("removeTaxEnabled") as? Bool
        groupLineItems = aDecoder.decodeObjectForKey("groupLineItems") as? Bool
        alternateInventoryNames = aDecoder.decodeObjectForKey("alternateInventoryNames") as? Bool
        autoPrint = aDecoder.decodeObjectForKey("autoPrint") as? Bool
        hardwareProfile = aDecoder.decodeObjectForKey("hardwareProfile") as? String
        infoleaseSuppressBilling = aDecoder.decodeObjectForKey("infoleaseSuppressBilling") as? Bool
        infoleaseSuppressPlanBilling = aDecoder.decodeObjectForKey("infoleaseSuppressPlanBilling") as? Bool
        shippingAddress = aDecoder.decodeObjectForKey("shippingAddress") as? String
        marketingEnabled = aDecoder.decodeObjectForKey("marketingEnabled") as? Bool
        marketingPreferenceText = aDecoder.decodeObjectForKey("marketingPreferenceText") as? String
        bankMarker = aDecoder.decodeObjectForKey("bankMarker") as? Int
        supportPhone = aDecoder.decodeObjectForKey("supportPhone") as? String
        supportEmail = aDecoder.decodeObjectForKey("supportEmail") as? String
        manualCloseout = aDecoder.decodeObjectForKey("manualCloseout") as? Bool
        showCloseoutOrders = aDecoder.decodeObjectForKey("showCloseoutOrders") as? Bool
        sendCloseoutEmail = aDecoder.decodeObjectForKey("sendCloseoutEmail") as? Bool
        stayInCategory = aDecoder.decodeObjectForKey("stayInCategory") as? Bool
        locale = aDecoder.decodeObjectForKey("locale") as? String
        timezone = aDecoder.decodeObjectForKey("timezone") as? String
        vat = aDecoder.decodeObjectForKey("vat") as? Bool
        vatTaxName = aDecoder.decodeObjectForKey("vatTaxName") as? String
        appBillingSystem = aDecoder.decodeObjectForKey("appBillingSystem") as? String
        abaAccountNumber = aDecoder.decodeObjectForKey("abaAccountNumber") as? String
        ddaAccountNumber = aDecoder.decodeObjectForKey("ddaAccountNumber") as? String
        trackStock = aDecoder.decodeObjectForKey("trackStock") as? Bool
        updateStock = aDecoder.decodeObjectForKey("updateStock") as? Bool
        allowClockOutWithOpenOrders = aDecoder.decodeObjectForKey("allowClockOutWithOpenOrders") as? Bool
        logInClockInPrompt = aDecoder.decodeObjectForKey("logInClockInPrompt") as? Bool
        accountType = aDecoder.decodeObjectForKey("accountType") as? String
        businessTypeCode = (aDecoder.decodeObjectForKey("businessTypeCode") as? String) != nil ?
      CLVModels.Base.BusinessTypeCode(rawValue: (aDecoder.decodeObjectForKey("businessTypeCode") as! String)) : nil
        pinLength = aDecoder.decodeObjectForKey("pinLength") as? Int
        cashBackEnabled = aDecoder.decodeObjectForKey("cashBackEnabled") as? Bool
        cashBackOptions = aDecoder.decodeObjectForKey("cashBackOptions") as? String
        maxCashBack = aDecoder.decodeObjectForKey("maxCashBack") as? Int
        hierarchy = aDecoder.decodeObjectForKey("hierarchy") as? String
        hasConsented = aDecoder.decodeObjectForKey("hasConsented") as? Bool
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      defaultCurrency <- map["defaultCurrency"]
        tipsEnabled <- map["tipsEnabled"]
        receiptProperties <- map["receiptProperties"]
        summaryHour <- map["summaryHour"]
        signatureThreshold <- map["signatureThreshold"]
        hasDefaultEmployee <- map["hasDefaultEmployee"]
        tipRateDefault <- map["tipRateDefault"]
        onPaperTipSignatures <- map["onPaperTipSignatures"]
        autoLogout <- map["autoLogout"]
        orderTitle <- map["orderTitle"]
        orderTitleMax <- map["orderTitleMax"]
        resetOnReportingTime <- map["resetOnReportingTime"]
        notesOnOrders <- map["notesOnOrders"]
        deleteOrders <- map["deleteOrders"]
        removeTaxEnabled <- map["removeTaxEnabled"]
        groupLineItems <- map["groupLineItems"]
        alternateInventoryNames <- map["alternateInventoryNames"]
        autoPrint <- map["autoPrint"]
        hardwareProfile <- map["hardwareProfile"]
        infoleaseSuppressBilling <- map["infoleaseSuppressBilling"]
        infoleaseSuppressPlanBilling <- map["infoleaseSuppressPlanBilling"]
        shippingAddress <- map["shippingAddress"]
        marketingEnabled <- map["marketingEnabled"]
        marketingPreferenceText <- map["marketingPreferenceText"]
        bankMarker <- map["bankMarker"]
        supportPhone <- map["supportPhone"]
        supportEmail <- map["supportEmail"]
        manualCloseout <- map["manualCloseout"]
        showCloseoutOrders <- map["showCloseoutOrders"]
        sendCloseoutEmail <- map["sendCloseoutEmail"]
        stayInCategory <- map["stayInCategory"]
        locale <- map["locale"]
        timezone <- map["timezone"]
        vat <- map["vat"]
        vatTaxName <- map["vatTaxName"]
        appBillingSystem <- map["appBillingSystem"]
        abaAccountNumber <- map["abaAccountNumber"]
        ddaAccountNumber <- map["ddaAccountNumber"]
        trackStock <- map["trackStock"]
        updateStock <- map["updateStock"]
        allowClockOutWithOpenOrders <- map["allowClockOutWithOpenOrders"]
        logInClockInPrompt <- map["logInClockInPrompt"]
        accountType <- map["accountType"]
        businessTypeCode <- map["businessTypeCode"]
        pinLength <- map["pinLength"]
        cashBackEnabled <- map["cashBackEnabled"]
        cashBackOptions <- map["cashBackOptions"]
        maxCashBack <- map["maxCashBack"]
        hierarchy <- map["hierarchy"]
        hasConsented <- map["hasConsented"]
  }
}


 
public class Module: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    public var name: String?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
  }
}


 
public enum OrderTitle: String {
  case NONE
  case MANUAL
  case AUTOMATIC
}


 
public enum SyncLevel: String {
  case LOW
  case MEDIUM
  case HIGH
  case NONE
}


 
public class SyncSettings: NSObject, NSCoding, Mappable {
    /// Sync authoirty
    public var authority: String?
    /// The minumum sync level rquired for this authority
    public var level: CLVModels.Merchant.SyncLevel?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(authority, forKey: "authority")
  aCoder.encodeObject(level?.rawValue, forKey: "level")
}

required public init(coder aDecoder: NSCoder) {
      authority = aDecoder.decodeObjectForKey("authority") as? String
        level = (aDecoder.decodeObjectForKey("level") as? String) != nil ?
      CLVModels.Merchant.SyncLevel(rawValue: (aDecoder.decodeObjectForKey("level") as! String)) : nil
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      authority <- map["authority"]
        level <- map["level"]
  }
}


 
public class TipSuggestion: NSObject, NSCoding, Mappable {
    public var id: String?
    /// Name of the tip
    public var name: String?
    /// Suggested tip percentage
    public var percentage: Int?
    public var isEnabled: Bool?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(percentage, forKey: "percentage")
  aCoder.encodeObject(isEnabled, forKey: "isEnabled")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        percentage = aDecoder.decodeObjectForKey("percentage") as? Int
        isEnabled = aDecoder.decodeObjectForKey("isEnabled") as? Bool
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        percentage <- map["percentage"]
        isEnabled <- map["isEnabled"]
  }
}

}
}
