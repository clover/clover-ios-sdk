 
 import ObjectMapper
 
 extension CLVModels {
  public class Report {
    
    
    public class CardType: NSObject, NSCoding, Mappable {
      public var type_: String?
      public var amount: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(type_, forKey: "type_")
        aCoder.encodeObject(amount, forKey: "amount")
      }
      
      required public init(coder aDecoder: NSCoder) {
        type_ = aDecoder.decodeObjectForKey("type_") as? String
        amount = aDecoder.decodeObjectForKey("amount") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        type_ <- map["type"]
        amount <- map["amount"]
      }
    }
    
    
    
    public class Category: NSObject, NSCoding, Mappable {
      public var id: String?
      public var name: String?
      public var items: [CLVModels.Report.Item]?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(items, forKey: "items")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        items = aDecoder.decodeObjectForKey("items") as? [CLVModels.Report.Item]
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        items <- (map["items"], CLVArrayTransform<CLVModels.Report.Item>())
      }
    }
    
    
    
    public class Discount: NSObject, NSCoding, Mappable {
      public var id: String?
      public var name: String?
      public var numberSold: Double?
      public var amountSold: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(numberSold, forKey: "numberSold")
        aCoder.encodeObject(amountSold, forKey: "amountSold")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        numberSold = aDecoder.decodeObjectForKey("numberSold") as? Double
        amountSold = aDecoder.decodeObjectForKey("amountSold") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        numberSold <- map["numberSold"]
        amountSold <- map["amountSold"]
      }
    }
    
    
    
    public class EmployeeSummary: NSObject, NSCoding, Mappable {
      public var name: String?
      public var employee: CLVModels.Employees.Employee?
      public var numPayments: Int?
      public var paymentsAmount: Int?
      public var numRefunds: Int?
      public var refundsAmount: Int?
      public var numCredits: Int?
      public var creditsAmount: Int?
      public var tipsDue: Int?
      public var serviceCharges: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(employee, forKey: "employee")
        aCoder.encodeObject(numPayments, forKey: "numPayments")
        aCoder.encodeObject(paymentsAmount, forKey: "paymentsAmount")
        aCoder.encodeObject(numRefunds, forKey: "numRefunds")
        aCoder.encodeObject(refundsAmount, forKey: "refundsAmount")
        aCoder.encodeObject(numCredits, forKey: "numCredits")
        aCoder.encodeObject(creditsAmount, forKey: "creditsAmount")
        aCoder.encodeObject(tipsDue, forKey: "tipsDue")
        aCoder.encodeObject(serviceCharges, forKey: "serviceCharges")
      }
      
      required public init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as? String
        employee = aDecoder.decodeObjectForKey("employee") as? CLVModels.Employees.Employee
        numPayments = aDecoder.decodeObjectForKey("numPayments") as? Int
        paymentsAmount = aDecoder.decodeObjectForKey("paymentsAmount") as? Int
        numRefunds = aDecoder.decodeObjectForKey("numRefunds") as? Int
        refundsAmount = aDecoder.decodeObjectForKey("refundsAmount") as? Int
        numCredits = aDecoder.decodeObjectForKey("numCredits") as? Int
        creditsAmount = aDecoder.decodeObjectForKey("creditsAmount") as? Int
        tipsDue = aDecoder.decodeObjectForKey("tipsDue") as? Int
        serviceCharges = aDecoder.decodeObjectForKey("serviceCharges") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        name <- map["name"]
        employee <- map["employee"]
        numPayments <- map["numPayments"]
        paymentsAmount <- map["paymentsAmount"]
        numRefunds <- map["numRefunds"]
        refundsAmount <- map["refundsAmount"]
        numCredits <- map["numCredits"]
        creditsAmount <- map["creditsAmount"]
        tipsDue <- map["tipsDue"]
        serviceCharges <- map["serviceCharges"]
      }
    }
    
    
    
    public class Item: NSObject, NSCoding, Mappable {
      public var id: String?
      public var name: String?
      public var numberSold: Double?
      public var amountSold: Int?
      public var numberRefunds: Double?
      public var amountRefunds: Int?
      public var numberExchanges: Double?
      public var amountExchanged: Int?
      public var discounts: [CLVModels.Report.Discount]?
      public var modifiers: [CLVModels.Report.Modifier]?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(numberSold, forKey: "numberSold")
        aCoder.encodeObject(amountSold, forKey: "amountSold")
        aCoder.encodeObject(numberRefunds, forKey: "numberRefunds")
        aCoder.encodeObject(amountRefunds, forKey: "amountRefunds")
        aCoder.encodeObject(numberExchanges, forKey: "numberExchanges")
        aCoder.encodeObject(amountExchanged, forKey: "amountExchanged")
        aCoder.encodeObject(discounts, forKey: "discounts")
        aCoder.encodeObject(modifiers, forKey: "modifiers")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        numberSold = aDecoder.decodeObjectForKey("numberSold") as? Double
        amountSold = aDecoder.decodeObjectForKey("amountSold") as? Int
        numberRefunds = aDecoder.decodeObjectForKey("numberRefunds") as? Double
        amountRefunds = aDecoder.decodeObjectForKey("amountRefunds") as? Int
        numberExchanges = aDecoder.decodeObjectForKey("numberExchanges") as? Double
        amountExchanged = aDecoder.decodeObjectForKey("amountExchanged") as? Int
        discounts = aDecoder.decodeObjectForKey("discounts") as? [CLVModels.Report.Discount]
        modifiers = aDecoder.decodeObjectForKey("modifiers") as? [CLVModels.Report.Modifier]
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        numberSold <- map["numberSold"]
        amountSold <- map["amountSold"]
        numberRefunds <- map["numberRefunds"]
        amountRefunds <- map["amountRefunds"]
        numberExchanges <- map["numberExchanges"]
        amountExchanged <- map["amountExchanged"]
        discounts <- (map["discounts"], CLVArrayTransform<CLVModels.Report.Discount>())
        modifiers <- (map["modifiers"], CLVArrayTransform<CLVModels.Report.Modifier>())
      }
    }
    
    
    
    public class Modifier: NSObject, NSCoding, Mappable {
      public var id: String?
      public var name: String?
      public var numberSold: Double?
      public var amountSold: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(numberSold, forKey: "numberSold")
        aCoder.encodeObject(amountSold, forKey: "amountSold")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        numberSold = aDecoder.decodeObjectForKey("numberSold") as? Double
        amountSold = aDecoder.decodeObjectForKey("amountSold") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        numberSold <- map["numberSold"]
        amountSold <- map["amountSold"]
      }
    }
    
    
    
    public class Report: NSObject, NSCoding, Mappable {
      /// Reports By Payments
      public var payments: CLVModels.Report.ReportPayments?
      /// Reports By Items
      public var items: CLVModels.Report.ReportItems?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(payments, forKey: "payments")
        aCoder.encodeObject(items, forKey: "items")
      }
      
      required public init(coder aDecoder: NSCoder) {
        payments = aDecoder.decodeObjectForKey("payments") as? CLVModels.Report.ReportPayments
        items = aDecoder.decodeObjectForKey("items") as? CLVModels.Report.ReportItems
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        payments <- map["payments"]
        items <- map["items"]
      }
    }
    
    
    
    public class ReportEmployee: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      /// The employee being reported on
      public var employee: CLVModels.Employees.Employee?
      /// Number and amounts for payments processed
      public var paymentSummary: CLVModels.Report.RevenueSummary?
      /// Number and amounts for refunds processed
      public var refundSummary: CLVModels.Report.RevenueSummary?
      /// Number and amounts for credits processed
      public var creditSummary: CLVModels.Report.RevenueSummary?
      /// The time range for which the report is generated
      public var timeRange: CLVModels.Report.TimeRange?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(employee, forKey: "employee")
        aCoder.encodeObject(paymentSummary, forKey: "paymentSummary")
        aCoder.encodeObject(refundSummary, forKey: "refundSummary")
        aCoder.encodeObject(creditSummary, forKey: "creditSummary")
        aCoder.encodeObject(timeRange, forKey: "timeRange")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        employee = aDecoder.decodeObjectForKey("employee") as? CLVModels.Employees.Employee
        paymentSummary = aDecoder.decodeObjectForKey("paymentSummary") as? CLVModels.Report.RevenueSummary
        refundSummary = aDecoder.decodeObjectForKey("refundSummary") as? CLVModels.Report.RevenueSummary
        creditSummary = aDecoder.decodeObjectForKey("creditSummary") as? CLVModels.Report.RevenueSummary
        timeRange = aDecoder.decodeObjectForKey("timeRange") as? CLVModels.Report.TimeRange
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        employee <- map["employee"]
        paymentSummary <- map["paymentSummary"]
        refundSummary <- map["refundSummary"]
        creditSummary <- map["creditSummary"]
        timeRange <- map["timeRange"]
      }
    }
    
    
    
    public class ReportItems: NSObject, NSCoding, Mappable {
      public var categories: [CLVModels.Report.Category]?
      /// The time range for which the report is generated
      public var timeRange: CLVModels.Report.TimeRange?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(categories, forKey: "categories")
        aCoder.encodeObject(timeRange, forKey: "timeRange")
      }
      
      required public init(coder aDecoder: NSCoder) {
        categories = aDecoder.decodeObjectForKey("categories") as? [CLVModels.Report.Category]
        timeRange = aDecoder.decodeObjectForKey("timeRange") as? CLVModels.Report.TimeRange
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        categories <- (map["categories"], CLVArrayTransform<CLVModels.Report.Category>())
        timeRange <- map["timeRange"]
      }
    }
    
    
    
    public class ReportPayments: NSObject, NSCoding, Mappable {
      /// Number and amounts for payments processed
      public var paymentSummary: CLVModels.Report.RevenueSummary?
      /// Number and amounts for refunds processed
      public var refundSummary: CLVModels.Report.RevenueSummary?
      /// Number and amounts for credits processed
      public var creditSummary: CLVModels.Report.RevenueSummary?
      /// Breakdown by employee
      public var employeeSummary: [CLVModels.Report.EmployeeSummary]?
      /// The time range for which the report is generated
      public var timeRange: CLVModels.Report.TimeRange?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(paymentSummary, forKey: "paymentSummary")
        aCoder.encodeObject(refundSummary, forKey: "refundSummary")
        aCoder.encodeObject(creditSummary, forKey: "creditSummary")
        aCoder.encodeObject(employeeSummary, forKey: "employeeSummary")
        aCoder.encodeObject(timeRange, forKey: "timeRange")
      }
      
      required public init(coder aDecoder: NSCoder) {
        paymentSummary = aDecoder.decodeObjectForKey("paymentSummary") as? CLVModels.Report.RevenueSummary
        refundSummary = aDecoder.decodeObjectForKey("refundSummary") as? CLVModels.Report.RevenueSummary
        creditSummary = aDecoder.decodeObjectForKey("creditSummary") as? CLVModels.Report.RevenueSummary
        employeeSummary = aDecoder.decodeObjectForKey("employeeSummary") as? [CLVModels.Report.EmployeeSummary]
        timeRange = aDecoder.decodeObjectForKey("timeRange") as? CLVModels.Report.TimeRange
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        paymentSummary <- map["paymentSummary"]
        refundSummary <- map["refundSummary"]
        creditSummary <- map["creditSummary"]
        employeeSummary <- (map["employeeSummary"], CLVArrayTransform<CLVModels.Report.EmployeeSummary>())
        timeRange <- map["timeRange"]
      }
    }
    
    
    
    public class ReportTaxes: NSObject, NSCoding, Mappable {
      /// Taxes for payments processed
      public var paymentSummary: [CLVModels.Report.TaxableRateSummary]?
      /// Taxes for refunds processed
      public var refundSummary: [CLVModels.Report.TaxableRateSummary]?
      /// Taxes for credits processed
      public var creditSummary: [CLVModels.Report.TaxableRateSummary]?
      /// The time range for which the report is generated
      public var timeRange: CLVModels.Report.TimeRange?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(paymentSummary, forKey: "paymentSummary")
        aCoder.encodeObject(refundSummary, forKey: "refundSummary")
        aCoder.encodeObject(creditSummary, forKey: "creditSummary")
        aCoder.encodeObject(timeRange, forKey: "timeRange")
      }
      
      required public init(coder aDecoder: NSCoder) {
        paymentSummary = aDecoder.decodeObjectForKey("paymentSummary") as? [CLVModels.Report.TaxableRateSummary]
        refundSummary = aDecoder.decodeObjectForKey("refundSummary") as? [CLVModels.Report.TaxableRateSummary]
        creditSummary = aDecoder.decodeObjectForKey("creditSummary") as? [CLVModels.Report.TaxableRateSummary]
        timeRange = aDecoder.decodeObjectForKey("timeRange") as? CLVModels.Report.TimeRange
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        paymentSummary <- (map["paymentSummary"], CLVArrayTransform<CLVModels.Report.TaxableRateSummary>())
        refundSummary <- (map["refundSummary"], CLVArrayTransform<CLVModels.Report.TaxableRateSummary>())
        creditSummary <- (map["creditSummary"], CLVArrayTransform<CLVModels.Report.TaxableRateSummary>())
        timeRange <- map["timeRange"]
      }
    }
    
    
    
    public class RevenueSummary: NSObject, NSCoding, Mappable {
      public var num: Int?
      public var amount: Int?
      public var tipAmount: Int?
      public var taxAmount: Int?
      public var serviceChargeAmount: Int?
      /// Split by tender type
      public var byTender: [CLVModels.Report.TenderStats]?
      /// Split by credit card type
      public var byCardType: [CLVModels.Report.CardType]?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(num, forKey: "num")
        aCoder.encodeObject(amount, forKey: "amount")
        aCoder.encodeObject(tipAmount, forKey: "tipAmount")
        aCoder.encodeObject(taxAmount, forKey: "taxAmount")
        aCoder.encodeObject(serviceChargeAmount, forKey: "serviceChargeAmount")
        aCoder.encodeObject(byTender, forKey: "byTender")
        aCoder.encodeObject(byCardType, forKey: "byCardType")
      }
      
      required public init(coder aDecoder: NSCoder) {
        num = aDecoder.decodeObjectForKey("num") as? Int
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        tipAmount = aDecoder.decodeObjectForKey("tipAmount") as? Int
        taxAmount = aDecoder.decodeObjectForKey("taxAmount") as? Int
        serviceChargeAmount = aDecoder.decodeObjectForKey("serviceChargeAmount") as? Int
        byTender = aDecoder.decodeObjectForKey("byTender") as? [CLVModels.Report.TenderStats]
        byCardType = aDecoder.decodeObjectForKey("byCardType") as? [CLVModels.Report.CardType]
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        num <- map["num"]
        amount <- map["amount"]
        tipAmount <- map["tipAmount"]
        taxAmount <- map["taxAmount"]
        serviceChargeAmount <- map["serviceChargeAmount"]
        byTender <- (map["byTender"], CLVArrayTransform<CLVModels.Report.TenderStats>())
        byCardType <- (map["byCardType"], CLVArrayTransform<CLVModels.Report.CardType>())
      }
    }
    
    
    
    public class Summary: NSObject, NSCoding, Mappable {
      public var num: Int?
      public var amount: Int?
      public var tipAmount: Int?
      public var taxAmount: Int?
      public var serviceChargeAmount: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(num, forKey: "num")
        aCoder.encodeObject(amount, forKey: "amount")
        aCoder.encodeObject(tipAmount, forKey: "tipAmount")
        aCoder.encodeObject(taxAmount, forKey: "taxAmount")
        aCoder.encodeObject(serviceChargeAmount, forKey: "serviceChargeAmount")
      }
      
      required public init(coder aDecoder: NSCoder) {
        num = aDecoder.decodeObjectForKey("num") as? Int
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        tipAmount = aDecoder.decodeObjectForKey("tipAmount") as? Int
        taxAmount = aDecoder.decodeObjectForKey("taxAmount") as? Int
        serviceChargeAmount = aDecoder.decodeObjectForKey("serviceChargeAmount") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        num <- map["num"]
        amount <- map["amount"]
        tipAmount <- map["tipAmount"]
        taxAmount <- map["taxAmount"]
        serviceChargeAmount <- map["serviceChargeAmount"]
      }
    }
    
    
    
    public class SummaryGroup: NSObject, NSCoding, Mappable {
      public var id: String?
      public var summaryObject: CLVModels.Report.Summary?
      public var paymentsSummary: CLVModels.Report.Summary?
      public var refundsSummary: CLVModels.Report.Summary?
      public var creditsSummary: CLVModels.Report.Summary?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(summaryObject, forKey: "summaryObject")
        aCoder.encodeObject(paymentsSummary, forKey: "paymentsSummary")
        aCoder.encodeObject(refundsSummary, forKey: "refundsSummary")
        aCoder.encodeObject(creditsSummary, forKey: "creditsSummary")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        summaryObject = aDecoder.decodeObjectForKey("summaryObject") as? CLVModels.Report.Summary
        paymentsSummary = aDecoder.decodeObjectForKey("paymentsSummary") as? CLVModels.Report.Summary
        refundsSummary = aDecoder.decodeObjectForKey("refundsSummary") as? CLVModels.Report.Summary
        creditsSummary = aDecoder.decodeObjectForKey("creditsSummary") as? CLVModels.Report.Summary
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        summaryObject <- map["summaryObject"]
        paymentsSummary <- map["paymentsSummary"]
        refundsSummary <- map["refundsSummary"]
        creditsSummary <- map["creditsSummary"]
      }
    }
    
    
    
    public class SummaryMerchantCharges: NSObject, NSCoding, Mappable {
      public var currency: String?
      public var num: Int?
      public var totalAmount: Int?
      public var totalTax: Int?
      public var totalDeveloperPortion: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(currency, forKey: "currency")
        aCoder.encodeObject(num, forKey: "num")
        aCoder.encodeObject(totalAmount, forKey: "totalAmount")
        aCoder.encodeObject(totalTax, forKey: "totalTax")
        aCoder.encodeObject(totalDeveloperPortion, forKey: "totalDeveloperPortion")
      }
      
      required public init(coder aDecoder: NSCoder) {
        currency = aDecoder.decodeObjectForKey("currency") as? String
        num = aDecoder.decodeObjectForKey("num") as? Int
        totalAmount = aDecoder.decodeObjectForKey("totalAmount") as? Int
        totalTax = aDecoder.decodeObjectForKey("totalTax") as? Int
        totalDeveloperPortion = aDecoder.decodeObjectForKey("totalDeveloperPortion") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        currency <- map["currency"]
        num <- map["num"]
        totalAmount <- map["totalAmount"]
        totalTax <- map["totalTax"]
        totalDeveloperPortion <- map["totalDeveloperPortion"]
      }
    }
    
    
    
    public class TaxableRateSummary: NSObject, NSCoding, Mappable {
      public var id: String?
      public var name: String?
      public var taxableAmount: Int?
      public var rate: Int?
      public var isVat: Bool?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(taxableAmount, forKey: "taxableAmount")
        aCoder.encodeObject(rate, forKey: "rate")
        aCoder.encodeObject(isVat, forKey: "isVat")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        taxableAmount = aDecoder.decodeObjectForKey("taxableAmount") as? Int
        rate = aDecoder.decodeObjectForKey("rate") as? Int
        isVat = aDecoder.decodeObjectForKey("isVat") as? Bool
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        taxableAmount <- map["taxableAmount"]
        rate <- map["rate"]
        isVat <- map["isVat"]
      }
    }
    
    
    
    public class TenderStats: NSObject, NSCoding, Mappable {
      public var type_: String?
      public var amount: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(type_, forKey: "type_")
        aCoder.encodeObject(amount, forKey: "amount")
      }
      
      required public init(coder aDecoder: NSCoder) {
        type_ = aDecoder.decodeObjectForKey("type_") as? String
        amount = aDecoder.decodeObjectForKey("amount") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        type_ <- map["type"]
        amount <- map["amount"]
      }
    }
    
    
    
    public class TimeRange: NSObject, NSCoding, Mappable {
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
    
  }
 }
