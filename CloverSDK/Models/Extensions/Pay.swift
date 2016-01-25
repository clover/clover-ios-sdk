 
import ObjectMapper

extension CLVModels {
public class Pay {

 
public class AuthPayment: NSObject, NSCoding, Mappable {
    public var uuid: String?
    public var orderUuid: String?
    public var amount: Int?
    public var tipAmount: Int?
    public var taxAmount: Int?
    public var cashbackAmount: Int?
    public var employeeId: String?
    public var deviceId: Int?
    public var result: String?
    public var merchantTenderLabelKey: String?
    public var voidReason: String?
    public var offline: Bool?
    public var createdTime: NSDate?
    public var clientCreatedTime: NSDate?
    public var modifiedTime: NSDate?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(uuid, forKey: "uuid")
  aCoder.encodeObject(orderUuid, forKey: "orderUuid")
  aCoder.encodeObject(amount, forKey: "amount")
  aCoder.encodeObject(tipAmount, forKey: "tipAmount")
  aCoder.encodeObject(taxAmount, forKey: "taxAmount")
  aCoder.encodeObject(cashbackAmount, forKey: "cashbackAmount")
  aCoder.encodeObject(employeeId, forKey: "employeeId")
  aCoder.encodeObject(deviceId, forKey: "deviceId")
  aCoder.encodeObject(result, forKey: "result")
  aCoder.encodeObject(merchantTenderLabelKey, forKey: "merchantTenderLabelKey")
  aCoder.encodeObject(voidReason, forKey: "voidReason")
  aCoder.encodeObject(offline, forKey: "offline")
  aCoder.encodeObject(createdTime, forKey: "createdTime")
  aCoder.encodeObject(clientCreatedTime, forKey: "clientCreatedTime")
  aCoder.encodeObject(modifiedTime, forKey: "modifiedTime")
}

required public init(coder aDecoder: NSCoder) {
      uuid = aDecoder.decodeObjectForKey("uuid") as? String
        orderUuid = aDecoder.decodeObjectForKey("orderUuid") as? String
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        tipAmount = aDecoder.decodeObjectForKey("tipAmount") as? Int
        taxAmount = aDecoder.decodeObjectForKey("taxAmount") as? Int
        cashbackAmount = aDecoder.decodeObjectForKey("cashbackAmount") as? Int
        employeeId = aDecoder.decodeObjectForKey("employeeId") as? String
        deviceId = aDecoder.decodeObjectForKey("deviceId") as? Int
        result = aDecoder.decodeObjectForKey("result") as? String
        merchantTenderLabelKey = aDecoder.decodeObjectForKey("merchantTenderLabelKey") as? String
        voidReason = aDecoder.decodeObjectForKey("voidReason") as? String
        offline = aDecoder.decodeObjectForKey("offline") as? Bool
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        clientCreatedTime = aDecoder.decodeObjectForKey("clientCreatedTime") as? NSDate
        modifiedTime = aDecoder.decodeObjectForKey("modifiedTime") as? NSDate
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      uuid <- map["uuid"]
        orderUuid <- map["orderUuid"]
        amount <- map["amount"]
        tipAmount <- map["tipAmount"]
        taxAmount <- map["taxAmount"]
        cashbackAmount <- map["cashbackAmount"]
        employeeId <- map["employeeId"]
        deviceId <- map["deviceId"]
        result <- map["result"]
        merchantTenderLabelKey <- map["merchantTenderLabelKey"]
        voidReason <- map["voidReason"]
        offline <- map["offline"]
        createdTime <- (map["createdTime"], CLVDateTransform())
        clientCreatedTime <- (map["clientCreatedTime"], CLVDateTransform())
        modifiedTime <- (map["modifiedTime"], CLVDateTransform())
  }
}


 
public class AuthQueueVoid: NSObject, NSCoding, Mappable {
    public var paymentId: String?
    public var iccContainer: String?
    public var reason: String?
    public var accountUuid: String?
    public var context: CLVModels.Pay.Context?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(paymentId, forKey: "paymentId")
  aCoder.encodeObject(iccContainer, forKey: "iccContainer")
  aCoder.encodeObject(reason, forKey: "reason")
  aCoder.encodeObject(accountUuid, forKey: "accountUuid")
  aCoder.encodeObject(context, forKey: "context")
}

required public init(coder aDecoder: NSCoder) {
      paymentId = aDecoder.decodeObjectForKey("paymentId") as? String
        iccContainer = aDecoder.decodeObjectForKey("iccContainer") as? String
        reason = aDecoder.decodeObjectForKey("reason") as? String
        accountUuid = aDecoder.decodeObjectForKey("accountUuid") as? String
        context = aDecoder.decodeObjectForKey("context") as? CLVModels.Pay.Context
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      paymentId <- map["paymentId"]
        iccContainer <- map["iccContainer"]
        reason <- map["reason"]
        accountUuid <- map["accountUuid"]
        context <- map["context"]
  }
}


 
public class AuthServerRequest: NSObject, NSCoding, Mappable {
    public var gatewayTx: CLVModels.Pay.GatewayTx?
    public var gatewayTxDebug: CLVModels.Pay.GatewayTxDebug?
    public var authPayment: CLVModels.Pay.AuthPayment?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(gatewayTx, forKey: "gatewayTx")
  aCoder.encodeObject(gatewayTxDebug, forKey: "gatewayTxDebug")
  aCoder.encodeObject(authPayment, forKey: "authPayment")
}

required public init(coder aDecoder: NSCoder) {
      gatewayTx = aDecoder.decodeObjectForKey("gatewayTx") as? CLVModels.Pay.GatewayTx
        gatewayTxDebug = aDecoder.decodeObjectForKey("gatewayTxDebug") as? CLVModels.Pay.GatewayTxDebug
        authPayment = aDecoder.decodeObjectForKey("authPayment") as? CLVModels.Pay.AuthPayment
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      gatewayTx <- map["gatewayTx"]
        gatewayTxDebug <- map["gatewayTxDebug"]
        authPayment <- map["authPayment"]
  }
}


 
public class AuthSyncResponse: NSObject, NSCoding, Mappable {
    public var cosGatewayTxId: Int?
    public var cosGatewayTxDebugId: Int?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(cosGatewayTxId, forKey: "cosGatewayTxId")
  aCoder.encodeObject(cosGatewayTxDebugId, forKey: "cosGatewayTxDebugId")
}

required public init(coder aDecoder: NSCoder) {
      cosGatewayTxId = aDecoder.decodeObjectForKey("cosGatewayTxId") as? Int
        cosGatewayTxDebugId = aDecoder.decodeObjectForKey("cosGatewayTxDebugId") as? Int
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      cosGatewayTxId <- map["cosGatewayTxId"]
        cosGatewayTxDebugId <- map["cosGatewayTxDebugId"]
  }
}


 
public class AuthSyncVoidRequest: NSObject, NSCoding, Mappable {
    public var merchantId: Int?
    public var paymentId: String?
    public var authPayment: CLVModels.Pay.AuthPayment?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(merchantId, forKey: "merchantId")
  aCoder.encodeObject(paymentId, forKey: "paymentId")
  aCoder.encodeObject(authPayment, forKey: "authPayment")
}

required public init(coder aDecoder: NSCoder) {
      merchantId = aDecoder.decodeObjectForKey("merchantId") as? Int
        paymentId = aDecoder.decodeObjectForKey("paymentId") as? String
        authPayment = aDecoder.decodeObjectForKey("authPayment") as? CLVModels.Pay.AuthPayment
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      merchantId <- map["merchantId"]
        paymentId <- map["paymentId"]
        authPayment <- map["authPayment"]
  }
}


 
public enum CardFunction: String {
  case CREDIT
  case DEBIT
  case PREPAID
  case PINLESS_DEBIT
  case EBT
}


 
public class Context: NSObject, NSCoding, Mappable {
    public var requestUuid: String?
    public var actingAccountId: Int?
    public var merchantId: Int?
    public var deviceId: Int?
    public var testing: Bool?
    public var clientRequestTime: NSDate?
    public var timestamp: NSDate?
    public var accountId: Int?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(requestUuid, forKey: "requestUuid")
  aCoder.encodeObject(actingAccountId, forKey: "actingAccountId")
  aCoder.encodeObject(merchantId, forKey: "merchantId")
  aCoder.encodeObject(deviceId, forKey: "deviceId")
  aCoder.encodeObject(testing, forKey: "testing")
  aCoder.encodeObject(clientRequestTime, forKey: "clientRequestTime")
  aCoder.encodeObject(timestamp, forKey: "timestamp")
  aCoder.encodeObject(accountId, forKey: "accountId")
}

required public init(coder aDecoder: NSCoder) {
      requestUuid = aDecoder.decodeObjectForKey("requestUuid") as? String
        actingAccountId = aDecoder.decodeObjectForKey("actingAccountId") as? Int
        merchantId = aDecoder.decodeObjectForKey("merchantId") as? Int
        deviceId = aDecoder.decodeObjectForKey("deviceId") as? Int
        testing = aDecoder.decodeObjectForKey("testing") as? Bool
        clientRequestTime = aDecoder.decodeObjectForKey("clientRequestTime") as? NSDate
        timestamp = aDecoder.decodeObjectForKey("timestamp") as? NSDate
        accountId = aDecoder.decodeObjectForKey("accountId") as? Int
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      requestUuid <- map["requestUuid"]
        actingAccountId <- map["actingAccountId"]
        merchantId <- map["merchantId"]
        deviceId <- map["deviceId"]
        testing <- map["testing"]
        clientRequestTime <- (map["clientRequestTime"], CLVDateTransform())
        timestamp <- (map["timestamp"], CLVDateTransform())
        accountId <- map["accountId"]
  }
}


 
public enum ErrorCode: String {
  case TERMINAL_BUSY
  case TERMINAL_UNAVAILABLE
  case TERMINAL_GENERAL
}


 
public class GatewayTx: NSObject, NSCoding, Mappable {
    public var cosGatewayTxId: Int?
    public var uuid: String?
    public var merchantGatewayId: Int?
    public var clientId: String?
    public var amount: Int?
    public var adjustAmount: Int?
    public var currency: String?
    public var state: String?
    public var retries: Int?
    public var type_: String?
    public var entryType: String?
    public var responseCode: String?
    public var responseMessage: String?
    public var first6: String?
    public var last4: String?
    public var cardType: String?
    public var refnum: String?
    public var token: String?
    public var authcode: String?
    public var employeeId: String?
    public var extra: String?
    public var captured: Bool?
    public var swiperSerial: String?
    public var ksnPrefix: String?
    public var createdTime: NSDate?
    public var modifiedTime: NSDate?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(cosGatewayTxId, forKey: "cosGatewayTxId")
  aCoder.encodeObject(uuid, forKey: "uuid")
  aCoder.encodeObject(merchantGatewayId, forKey: "merchantGatewayId")
  aCoder.encodeObject(clientId, forKey: "clientId")
  aCoder.encodeObject(amount, forKey: "amount")
  aCoder.encodeObject(adjustAmount, forKey: "adjustAmount")
  aCoder.encodeObject(currency, forKey: "currency")
  aCoder.encodeObject(state, forKey: "state")
  aCoder.encodeObject(retries, forKey: "retries")
  aCoder.encodeObject(type_, forKey: "type_")
  aCoder.encodeObject(entryType, forKey: "entryType")
  aCoder.encodeObject(responseCode, forKey: "responseCode")
  aCoder.encodeObject(responseMessage, forKey: "responseMessage")
  aCoder.encodeObject(first6, forKey: "first6")
  aCoder.encodeObject(last4, forKey: "last4")
  aCoder.encodeObject(cardType, forKey: "cardType")
  aCoder.encodeObject(refnum, forKey: "refnum")
  aCoder.encodeObject(token, forKey: "token")
  aCoder.encodeObject(authcode, forKey: "authcode")
  aCoder.encodeObject(employeeId, forKey: "employeeId")
  aCoder.encodeObject(extra, forKey: "extra")
  aCoder.encodeObject(captured, forKey: "captured")
  aCoder.encodeObject(swiperSerial, forKey: "swiperSerial")
  aCoder.encodeObject(ksnPrefix, forKey: "ksnPrefix")
  aCoder.encodeObject(createdTime, forKey: "createdTime")
  aCoder.encodeObject(modifiedTime, forKey: "modifiedTime")
}

required public init(coder aDecoder: NSCoder) {
      cosGatewayTxId = aDecoder.decodeObjectForKey("cosGatewayTxId") as? Int
        uuid = aDecoder.decodeObjectForKey("uuid") as? String
        merchantGatewayId = aDecoder.decodeObjectForKey("merchantGatewayId") as? Int
        clientId = aDecoder.decodeObjectForKey("clientId") as? String
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        adjustAmount = aDecoder.decodeObjectForKey("adjustAmount") as? Int
        currency = aDecoder.decodeObjectForKey("currency") as? String
        state = aDecoder.decodeObjectForKey("state") as? String
        retries = aDecoder.decodeObjectForKey("retries") as? Int
        type_ = aDecoder.decodeObjectForKey("type_") as? String
        entryType = aDecoder.decodeObjectForKey("entryType") as? String
        responseCode = aDecoder.decodeObjectForKey("responseCode") as? String
        responseMessage = aDecoder.decodeObjectForKey("responseMessage") as? String
        first6 = aDecoder.decodeObjectForKey("first6") as? String
        last4 = aDecoder.decodeObjectForKey("last4") as? String
        cardType = aDecoder.decodeObjectForKey("cardType") as? String
        refnum = aDecoder.decodeObjectForKey("refnum") as? String
        token = aDecoder.decodeObjectForKey("token") as? String
        authcode = aDecoder.decodeObjectForKey("authcode") as? String
        employeeId = aDecoder.decodeObjectForKey("employeeId") as? String
        extra = aDecoder.decodeObjectForKey("extra") as? String
        captured = aDecoder.decodeObjectForKey("captured") as? Bool
        swiperSerial = aDecoder.decodeObjectForKey("swiperSerial") as? String
        ksnPrefix = aDecoder.decodeObjectForKey("ksnPrefix") as? String
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        modifiedTime = aDecoder.decodeObjectForKey("modifiedTime") as? NSDate
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      cosGatewayTxId <- map["cosGatewayTxId"]
        uuid <- map["uuid"]
        merchantGatewayId <- map["merchantGatewayId"]
        clientId <- map["clientId"]
        amount <- map["amount"]
        adjustAmount <- map["adjustAmount"]
        currency <- map["currency"]
        state <- map["state"]
        retries <- map["retries"]
        type_ <- map["type_"]
        entryType <- map["entryType"]
        responseCode <- map["responseCode"]
        responseMessage <- map["responseMessage"]
        first6 <- map["first6"]
        last4 <- map["last4"]
        cardType <- map["cardType"]
        refnum <- map["refnum"]
        token <- map["token"]
        authcode <- map["authcode"]
        employeeId <- map["employeeId"]
        extra <- map["extra"]
        captured <- map["captured"]
        swiperSerial <- map["swiperSerial"]
        ksnPrefix <- map["ksnPrefix"]
        createdTime <- (map["createdTime"], CLVDateTransform())
        modifiedTime <- (map["modifiedTime"], CLVDateTransform())
  }
}


 
public class GatewayTxDebug: NSObject, NSCoding, Mappable {
    public var cosGatewayTxDebugId: Int?
    public var requestTime: NSDate?
    public var responseTime: NSDate?
    public var request: String?
    public var response: String?
    public var source: String?
    public var dest: String?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(cosGatewayTxDebugId, forKey: "cosGatewayTxDebugId")
  aCoder.encodeObject(requestTime, forKey: "requestTime")
  aCoder.encodeObject(responseTime, forKey: "responseTime")
  aCoder.encodeObject(request, forKey: "request")
  aCoder.encodeObject(response, forKey: "response")
  aCoder.encodeObject(source, forKey: "source")
  aCoder.encodeObject(dest, forKey: "dest")
}

required public init(coder aDecoder: NSCoder) {
      cosGatewayTxDebugId = aDecoder.decodeObjectForKey("cosGatewayTxDebugId") as? Int
        requestTime = aDecoder.decodeObjectForKey("requestTime") as? NSDate
        responseTime = aDecoder.decodeObjectForKey("responseTime") as? NSDate
        request = aDecoder.decodeObjectForKey("request") as? String
        response = aDecoder.decodeObjectForKey("response") as? String
        source = aDecoder.decodeObjectForKey("source") as? String
        dest = aDecoder.decodeObjectForKey("dest") as? String
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      cosGatewayTxDebugId <- map["cosGatewayTxDebugId"]
        requestTime <- (map["requestTime"], CLVDateTransform())
        responseTime <- (map["responseTime"], CLVDateTransform())
        request <- map["request"]
        response <- map["response"]
        source <- map["source"]
        dest <- map["dest"]
  }
}


 
public enum GwTxResult: String {
  case APPROVED_ONLINE
  case DECLINED_ONLINE
  case UNABLE_TO_GO_ONLINE
  case REFERRAL_ONLINE
  case REFERRAL_OFFLINE
}


 
public class PaymentProcessor: NSObject, NSCoding, Mappable {
    public var id: String?
    public var name: String?
    public var paymentGatewayApi: String?
    public var production: Bool?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(paymentGatewayApi, forKey: "paymentGatewayApi")
  aCoder.encodeObject(production, forKey: "production")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        paymentGatewayApi = aDecoder.decodeObjectForKey("paymentGatewayApi") as? String
        production = aDecoder.decodeObjectForKey("production") as? Bool
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        paymentGatewayApi <- map["paymentGatewayApi"]
        production <- map["production"]
  }
}


 
public class PaymentRequest: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// Unique identifier of the order with which this payment is associated
    public var orderId: String?
    /// Request timestamp
    public var timestamp: NSDate?
    /// The tender type associated with this payment, e.g. credit card, cash, etc.
    public var tender: CLVModels.Base.Tender?
    /// Total amount paid
    public var amount: Int?
    /// Amount paid in tips
    public var tipAmount: Int?
    /// Amount paid in tax (TBD: sales tax only?)
    public var taxAmount: Int?
    public var cashBackAmount: Int?
    /// Cash tendered
    public var cashTendered: Int?
    /// Employee ID
    public var employeeId: String?
    /// Employee name
    public var employeeName: String?
    /// Used for voice authorization for credit cards
    public var authorizationCode: String?
    /// External payment ID when using custom tender
    public var externalPaymentId: String?
    public var serviceChargeAmount: CLVModels.Payments.ServiceChargeAmount?
    public var taxableAmountRates: [CLVModels.Payments.TaxableAmountRate]?
    /// Payments that were made for this line item
    public var lineItems: [CLVModels.Payments.LineItemPayment]?
    public var card: CLVModels.Pay.PaymentRequestCardDetails?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(orderId, forKey: "orderId")
  aCoder.encodeObject(timestamp, forKey: "timestamp")
  aCoder.encodeObject(tender, forKey: "tender")
  aCoder.encodeObject(amount, forKey: "amount")
  aCoder.encodeObject(tipAmount, forKey: "tipAmount")
  aCoder.encodeObject(taxAmount, forKey: "taxAmount")
  aCoder.encodeObject(cashBackAmount, forKey: "cashBackAmount")
  aCoder.encodeObject(cashTendered, forKey: "cashTendered")
  aCoder.encodeObject(employeeId, forKey: "employeeId")
  aCoder.encodeObject(employeeName, forKey: "employeeName")
  aCoder.encodeObject(authorizationCode, forKey: "authorizationCode")
  aCoder.encodeObject(externalPaymentId, forKey: "externalPaymentId")
  aCoder.encodeObject(serviceChargeAmount, forKey: "serviceChargeAmount")
  aCoder.encodeObject(taxableAmountRates, forKey: "taxableAmountRates")
  aCoder.encodeObject(lineItems, forKey: "lineItems")
  aCoder.encodeObject(card, forKey: "card")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        orderId = aDecoder.decodeObjectForKey("orderId") as? String
        timestamp = aDecoder.decodeObjectForKey("timestamp") as? NSDate
        tender = aDecoder.decodeObjectForKey("tender") as? CLVModels.Base.Tender
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        tipAmount = aDecoder.decodeObjectForKey("tipAmount") as? Int
        taxAmount = aDecoder.decodeObjectForKey("taxAmount") as? Int
        cashBackAmount = aDecoder.decodeObjectForKey("cashBackAmount") as? Int
        cashTendered = aDecoder.decodeObjectForKey("cashTendered") as? Int
        employeeId = aDecoder.decodeObjectForKey("employeeId") as? String
        employeeName = aDecoder.decodeObjectForKey("employeeName") as? String
        authorizationCode = aDecoder.decodeObjectForKey("authorizationCode") as? String
        externalPaymentId = aDecoder.decodeObjectForKey("externalPaymentId") as? String
        serviceChargeAmount = aDecoder.decodeObjectForKey("serviceChargeAmount") as? CLVModels.Payments.ServiceChargeAmount
        taxableAmountRates = aDecoder.decodeObjectForKey("taxableAmountRates") as? [CLVModels.Payments.TaxableAmountRate]
        lineItems = aDecoder.decodeObjectForKey("lineItems") as? [CLVModels.Payments.LineItemPayment]
        card = aDecoder.decodeObjectForKey("card") as? CLVModels.Pay.PaymentRequestCardDetails
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        orderId <- map["orderId"]
        timestamp <- (map["timestamp"], CLVDateTransform())
        tender <- map["tender"]
        amount <- map["amount"]
        tipAmount <- map["tipAmount"]
        taxAmount <- map["taxAmount"]
        cashBackAmount <- map["cashBackAmount"]
        cashTendered <- map["cashTendered"]
        employeeId <- map["employeeId"]
        employeeName <- map["employeeName"]
        authorizationCode <- map["authorizationCode"]
        externalPaymentId <- map["externalPaymentId"]
        serviceChargeAmount <- map["serviceChargeAmount"]
        taxableAmountRates <- (map["taxableAmountRates"], CLVArrayTransform<CLVModels.Payments.TaxableAmountRate>())
        lineItems <- (map["lineItems"], CLVArrayTransform<CLVModels.Payments.LineItemPayment>())
        card <- map["card"]
  }
}


 
public class PaymentRequestCardDetails: NSObject, NSCoding, Mappable {
    public var track1: String?
    public var track2: String?
    public var track3: String?
    public var encrypted: Bool?
    public var maskedTrack1: String?
    public var maskedTrack2: String?
    public var maskedTrack3: String?
    public var uniqueToken: String?
    public var pan: String?
    public var firstName: String?
    public var lastName: String?
    public var countryCode: String?
    public var exp: String?
    public var streetAddress: String?
    public var zip: String?
    public var cvv: String?
    public var last4: String?
    public var first4: String?
    public var dukptSerial: String?
    public var swipeStatus: String?
    public var fingerprint: String?
    public var deviceSerial: String?
    public var manualEntered: Bool?
    public var async: Bool?
    public var isFallback: Bool?
    public var isAuth: Bool?
    public var isPrepaid: Bool?
    public var cardFunction: CLVModels.Pay.CardFunction?
    public var qrCode: Bool?
    public var cardType: CLVModels.Payments.CardType?
    public var entryType: CLVModels.Payments.CardEntryType?
    public var transactionNo: String?
    public var cardholderName: String?
    public var transactionData: CLVModels.Pay.TransactionData?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(track1, forKey: "track1")
  aCoder.encodeObject(track2, forKey: "track2")
  aCoder.encodeObject(track3, forKey: "track3")
  aCoder.encodeObject(encrypted, forKey: "encrypted")
  aCoder.encodeObject(maskedTrack1, forKey: "maskedTrack1")
  aCoder.encodeObject(maskedTrack2, forKey: "maskedTrack2")
  aCoder.encodeObject(maskedTrack3, forKey: "maskedTrack3")
  aCoder.encodeObject(uniqueToken, forKey: "uniqueToken")
  aCoder.encodeObject(pan, forKey: "pan")
  aCoder.encodeObject(firstName, forKey: "firstName")
  aCoder.encodeObject(lastName, forKey: "lastName")
  aCoder.encodeObject(countryCode, forKey: "countryCode")
  aCoder.encodeObject(exp, forKey: "exp")
  aCoder.encodeObject(streetAddress, forKey: "streetAddress")
  aCoder.encodeObject(zip, forKey: "zip")
  aCoder.encodeObject(cvv, forKey: "cvv")
  aCoder.encodeObject(last4, forKey: "last4")
  aCoder.encodeObject(first4, forKey: "first4")
  aCoder.encodeObject(dukptSerial, forKey: "dukptSerial")
  aCoder.encodeObject(swipeStatus, forKey: "swipeStatus")
  aCoder.encodeObject(fingerprint, forKey: "fingerprint")
  aCoder.encodeObject(deviceSerial, forKey: "deviceSerial")
  aCoder.encodeObject(manualEntered, forKey: "manualEntered")
  aCoder.encodeObject(async, forKey: "async")
  aCoder.encodeObject(isFallback, forKey: "isFallback")
  aCoder.encodeObject(isAuth, forKey: "isAuth")
  aCoder.encodeObject(isPrepaid, forKey: "isPrepaid")
  aCoder.encodeObject(cardFunction?.rawValue, forKey: "cardFunction")
  aCoder.encodeObject(qrCode, forKey: "qrCode")
  aCoder.encodeObject(cardType?.rawValue, forKey: "cardType")
  aCoder.encodeObject(entryType?.rawValue, forKey: "entryType")
  aCoder.encodeObject(transactionNo, forKey: "transactionNo")
  aCoder.encodeObject(cardholderName, forKey: "cardholderName")
  aCoder.encodeObject(transactionData, forKey: "transactionData")
}

required public init(coder aDecoder: NSCoder) {
      track1 = aDecoder.decodeObjectForKey("track1") as? String
        track2 = aDecoder.decodeObjectForKey("track2") as? String
        track3 = aDecoder.decodeObjectForKey("track3") as? String
        encrypted = aDecoder.decodeObjectForKey("encrypted") as? Bool
        maskedTrack1 = aDecoder.decodeObjectForKey("maskedTrack1") as? String
        maskedTrack2 = aDecoder.decodeObjectForKey("maskedTrack2") as? String
        maskedTrack3 = aDecoder.decodeObjectForKey("maskedTrack3") as? String
        uniqueToken = aDecoder.decodeObjectForKey("uniqueToken") as? String
        pan = aDecoder.decodeObjectForKey("pan") as? String
        firstName = aDecoder.decodeObjectForKey("firstName") as? String
        lastName = aDecoder.decodeObjectForKey("lastName") as? String
        countryCode = aDecoder.decodeObjectForKey("countryCode") as? String
        exp = aDecoder.decodeObjectForKey("exp") as? String
        streetAddress = aDecoder.decodeObjectForKey("streetAddress") as? String
        zip = aDecoder.decodeObjectForKey("zip") as? String
        cvv = aDecoder.decodeObjectForKey("cvv") as? String
        last4 = aDecoder.decodeObjectForKey("last4") as? String
        first4 = aDecoder.decodeObjectForKey("first4") as? String
        dukptSerial = aDecoder.decodeObjectForKey("dukptSerial") as? String
        swipeStatus = aDecoder.decodeObjectForKey("swipeStatus") as? String
        fingerprint = aDecoder.decodeObjectForKey("fingerprint") as? String
        deviceSerial = aDecoder.decodeObjectForKey("deviceSerial") as? String
        manualEntered = aDecoder.decodeObjectForKey("manualEntered") as? Bool
        async = aDecoder.decodeObjectForKey("async") as? Bool
        isFallback = aDecoder.decodeObjectForKey("isFallback") as? Bool
        isAuth = aDecoder.decodeObjectForKey("isAuth") as? Bool
        isPrepaid = aDecoder.decodeObjectForKey("isPrepaid") as? Bool
        cardFunction = (aDecoder.decodeObjectForKey("cardFunction") as? String) != nil ?
      CLVModels.Pay.CardFunction(rawValue: (aDecoder.decodeObjectForKey("cardFunction") as! String)) : nil
        qrCode = aDecoder.decodeObjectForKey("qrCode") as? Bool
        cardType = (aDecoder.decodeObjectForKey("cardType") as? String) != nil ?
      CLVModels.Payments.CardType(rawValue: (aDecoder.decodeObjectForKey("cardType") as! String)) : nil
        entryType = (aDecoder.decodeObjectForKey("entryType") as? String) != nil ?
      CLVModels.Payments.CardEntryType(rawValue: (aDecoder.decodeObjectForKey("entryType") as! String)) : nil
        transactionNo = aDecoder.decodeObjectForKey("transactionNo") as? String
        cardholderName = aDecoder.decodeObjectForKey("cardholderName") as? String
        transactionData = aDecoder.decodeObjectForKey("transactionData") as? CLVModels.Pay.TransactionData
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      track1 <- map["track1"]
        track2 <- map["track2"]
        track3 <- map["track3"]
        encrypted <- map["encrypted"]
        maskedTrack1 <- map["maskedTrack1"]
        maskedTrack2 <- map["maskedTrack2"]
        maskedTrack3 <- map["maskedTrack3"]
        uniqueToken <- map["uniqueToken"]
        pan <- map["pan"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        countryCode <- map["countryCode"]
        exp <- map["exp"]
        streetAddress <- map["streetAddress"]
        zip <- map["zip"]
        cvv <- map["cvv"]
        last4 <- map["last4"]
        first4 <- map["first4"]
        dukptSerial <- map["dukptSerial"]
        swipeStatus <- map["swipeStatus"]
        fingerprint <- map["fingerprint"]
        deviceSerial <- map["deviceSerial"]
        manualEntered <- map["manualEntered"]
        async <- map["async"]
        isFallback <- map["isFallback"]
        isAuth <- map["isAuth"]
        isPrepaid <- map["isPrepaid"]
        cardFunction <- map["cardFunction"]
        qrCode <- map["qrCode"]
        cardType <- map["cardType"]
        entryType <- map["entryType"]
        transactionNo <- map["transactionNo"]
        cardholderName <- map["cardholderName"]
        transactionData <- map["transactionData"]
  }
}


 
public class ProcessorKey: NSObject, NSCoding, Mappable {
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


 
public enum ServiceCode1: String {
  case INTERNATIONAL_INTERCHANGE_OK
  case INTERNATIONAL_INTERCHANGE_USE_IC_CHIP_WHERE_FEASIBLE
  case NATIONAL_INTERCHANGE_ONLY_EXCEPT_UNDER_BILATERAL_AGREEMENT
  case NATIONAL_INTERCHANGE_ONLY_EXCEPT_UNDER_BILATERAL_AGREEMENT_USE_IC_CHIP_WHERE_FEASIBLE
  case NO_INTERCHANGE_EXCEPT_UNDER_BILATERAL_AGREEMENT
  case TEST
  case UNDEFINED
}


 
public enum ServiceCode2: String {
  case NORMAL
  case CONTACT_ISSUER_VIA_ONLINE_MEANS
  case CONTACT_ISSUER_VIA_ONLINE_MEANS_EXCEPT_UNDER_BILATERAL_AGREEMENT
  case UNDEFINED
}


 
public enum ServiceCode3: String {
  case NO_RESTRICTIONS_PIN_REQUIRED
  case NO_RESTRICTIONS
  case GOODS_AND_SERVICES_ONLY_NO_CASH
  case ATM_ONLY_PIN_REQUIRED
  case CASH_ONLY
  case GOODS_AND_SERVICES_ONLY_NO_CASH_PIN_REQUIRED
  case NO_RESTRICTIONS_USE_PIN_WHERE_FEASIBLE
  case GOODS_AND_SERVICES_ONLY_NO_CASH_USE_PIN_WHERE_FEASIBLE
  case UNDEFINED
}


 
public class TransactionData: NSObject, NSCoding, Mappable {
    public var txResult: CLVModels.Pay.TxResult?
    public var txError: CLVModels.Pay.ErrorCode?
    public var amount: Double?
    public var tipAmount: Double?
    public var cashBackAmount: Double?
    public var errorCode: String?
    public var errorText: String?
    public var transactionDate: String?
    public var transactionTime: String?
    public var msrContainer: String?
    public var msrMaskedTrack1: String?
    public var msrMaskedTrack2: String?
    public var maskedManualPan: String?
    public var sredContainer: String?
    public var sred: String?
    public var ksn: String?
    public var transArmorContainer: String?
    public var transArmorKey: String?
    public var transArmorKeyId: String?
    public var transArmorEncryptedTrack1: String?
    public var transArmorEncryptedTrack2: String?
    public var transArmorEncryptedEmvTag57: String?
    public var transArmorEncryptedEmvTag5A: String?
    public var transArmorEncryptedManualKeyedData: String?
    public var iccContainer: String?
    public var iccApplicationInterchangeProfile: String?
    public var iccMaskedEmv57: String?
    public var iccMaskedEmv5A: String?
    public var iccApplicationPanSequenceNumber: String?
    public var iccApplicationExpirationDate: String?
    public var iccApplicationEffectiveDate: String?
    public var iccAmountAuthorized: String?
    public var iccAmountOther: String?
    public var iccTransactionCurrencyCode: String?
    public var iccTransactionCurrencyExponent: String?
    public var iccApplicationUsageControl: String?
    public var iccIssuerActionCodeDefault: String?
    public var iccIssuerActionCodeDenial: String?
    public var iccIssuerActionCodeOnline: String?
    public var iccApplicationLabel: String?
    public var iccApplicationCryptogram: String?
    public var iccApplicationIdentifierCard: String?
    public var iccApplicationIdentifierTerminal: String?
    public var iccApplicationTransactionCounter: String?
    public var iccApplicationVersionNumber: String?
    public var iccCryptogramInformationData: String?
    public var iccCvmResults: String?
    public var iccInterfaceDeviceSerialNumber: String?
    public var iccIssuerApplicationData: String?
    public var iccPosEntryModeCode: String?
    public var iccTerminalCapabilities: String?
    public var iccTerminalCountryCode: String?
    public var iccTerminalType: String?
    public var iccTvr: String?
    public var iccTransactionDate: String?
    public var iccTsi: String?
    public var iccTransactionType: String?
    public var iccUnpredictableNumber: String?
    public var iccTransactionTime: String?
    public var iccAdditionalTerminalCapabilities: String?
    public var iccTransactionCategoryCode: String?
    public var iccIssuerApplicationPreferredName: String?
    public var iccCardholderName: String?
    public var iccIssuerCodeTableIndex: String?
    public var iccIssuerScripts: String?
    public var iccIssuerScriptResults: String?
    public var debugTrack2EquivalentData: String?
    public var debugApplicationPan: String?
    public var debugAmountAuthorizedBinary: String?
    public var debugAmountOtherBinary: String?
    public var debugTransactionStatusInformation: String?
    public var debugPlainTrack1: String?
    public var debugPlainTrack2: String?
    public var schemePunATC: String?
    public var schemeThirdPartyData: String?
    public var schemeMerchantCustomData: String?
    public var schemeTerminalEntryCapability: String?
    public var pinBlockContainer: String?
    public var pinBlock: String?
    public var pinBlockKsn: String?
    public var gwContainer: String?
    public var gwIssuerAuthenticationData: String?
    public var gwIssuerScriptTemplate1: String?
    public var gwIssuerScriptTemplate2: String?
    public var gwIssuerAuthorizationResponseCode: String?
    public var gwMessageControlField: String?
    public var gwTxResult: CLVModels.Pay.GwTxResult?
    public var cvmResult: CLVModels.Payments.CvmResult?
    public var serviceCode1: CLVModels.Pay.ServiceCode1?
    public var serviceCode2: CLVModels.Pay.ServiceCode2?
    public var serviceCode3: CLVModels.Pay.ServiceCode3?
    public var offlineApprovalAuthCode: String?
    public var availableOfflineSpendingAmount: Double?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(txResult?.rawValue, forKey: "txResult")
  aCoder.encodeObject(txError?.rawValue, forKey: "txError")
  aCoder.encodeObject(amount, forKey: "amount")
  aCoder.encodeObject(tipAmount, forKey: "tipAmount")
  aCoder.encodeObject(cashBackAmount, forKey: "cashBackAmount")
  aCoder.encodeObject(errorCode, forKey: "errorCode")
  aCoder.encodeObject(errorText, forKey: "errorText")
  aCoder.encodeObject(transactionDate, forKey: "transactionDate")
  aCoder.encodeObject(transactionTime, forKey: "transactionTime")
  aCoder.encodeObject(msrContainer, forKey: "msrContainer")
  aCoder.encodeObject(msrMaskedTrack1, forKey: "msrMaskedTrack1")
  aCoder.encodeObject(msrMaskedTrack2, forKey: "msrMaskedTrack2")
  aCoder.encodeObject(maskedManualPan, forKey: "maskedManualPan")
  aCoder.encodeObject(sredContainer, forKey: "sredContainer")
  aCoder.encodeObject(sred, forKey: "sred")
  aCoder.encodeObject(ksn, forKey: "ksn")
  aCoder.encodeObject(transArmorContainer, forKey: "transArmorContainer")
  aCoder.encodeObject(transArmorKey, forKey: "transArmorKey")
  aCoder.encodeObject(transArmorKeyId, forKey: "transArmorKeyId")
  aCoder.encodeObject(transArmorEncryptedTrack1, forKey: "transArmorEncryptedTrack1")
  aCoder.encodeObject(transArmorEncryptedTrack2, forKey: "transArmorEncryptedTrack2")
  aCoder.encodeObject(transArmorEncryptedEmvTag57, forKey: "transArmorEncryptedEmvTag57")
  aCoder.encodeObject(transArmorEncryptedEmvTag5A, forKey: "transArmorEncryptedEmvTag5A")
  aCoder.encodeObject(transArmorEncryptedManualKeyedData, forKey: "transArmorEncryptedManualKeyedData")
  aCoder.encodeObject(iccContainer, forKey: "iccContainer")
  aCoder.encodeObject(iccApplicationInterchangeProfile, forKey: "iccApplicationInterchangeProfile")
  aCoder.encodeObject(iccMaskedEmv57, forKey: "iccMaskedEmv57")
  aCoder.encodeObject(iccMaskedEmv5A, forKey: "iccMaskedEmv5A")
  aCoder.encodeObject(iccApplicationPanSequenceNumber, forKey: "iccApplicationPanSequenceNumber")
  aCoder.encodeObject(iccApplicationExpirationDate, forKey: "iccApplicationExpirationDate")
  aCoder.encodeObject(iccApplicationEffectiveDate, forKey: "iccApplicationEffectiveDate")
  aCoder.encodeObject(iccAmountAuthorized, forKey: "iccAmountAuthorized")
  aCoder.encodeObject(iccAmountOther, forKey: "iccAmountOther")
  aCoder.encodeObject(iccTransactionCurrencyCode, forKey: "iccTransactionCurrencyCode")
  aCoder.encodeObject(iccTransactionCurrencyExponent, forKey: "iccTransactionCurrencyExponent")
  aCoder.encodeObject(iccApplicationUsageControl, forKey: "iccApplicationUsageControl")
  aCoder.encodeObject(iccIssuerActionCodeDefault, forKey: "iccIssuerActionCodeDefault")
  aCoder.encodeObject(iccIssuerActionCodeDenial, forKey: "iccIssuerActionCodeDenial")
  aCoder.encodeObject(iccIssuerActionCodeOnline, forKey: "iccIssuerActionCodeOnline")
  aCoder.encodeObject(iccApplicationLabel, forKey: "iccApplicationLabel")
  aCoder.encodeObject(iccApplicationCryptogram, forKey: "iccApplicationCryptogram")
  aCoder.encodeObject(iccApplicationIdentifierCard, forKey: "iccApplicationIdentifierCard")
  aCoder.encodeObject(iccApplicationIdentifierTerminal, forKey: "iccApplicationIdentifierTerminal")
  aCoder.encodeObject(iccApplicationTransactionCounter, forKey: "iccApplicationTransactionCounter")
  aCoder.encodeObject(iccApplicationVersionNumber, forKey: "iccApplicationVersionNumber")
  aCoder.encodeObject(iccCryptogramInformationData, forKey: "iccCryptogramInformationData")
  aCoder.encodeObject(iccCvmResults, forKey: "iccCvmResults")
  aCoder.encodeObject(iccInterfaceDeviceSerialNumber, forKey: "iccInterfaceDeviceSerialNumber")
  aCoder.encodeObject(iccIssuerApplicationData, forKey: "iccIssuerApplicationData")
  aCoder.encodeObject(iccPosEntryModeCode, forKey: "iccPosEntryModeCode")
  aCoder.encodeObject(iccTerminalCapabilities, forKey: "iccTerminalCapabilities")
  aCoder.encodeObject(iccTerminalCountryCode, forKey: "iccTerminalCountryCode")
  aCoder.encodeObject(iccTerminalType, forKey: "iccTerminalType")
  aCoder.encodeObject(iccTvr, forKey: "iccTvr")
  aCoder.encodeObject(iccTransactionDate, forKey: "iccTransactionDate")
  aCoder.encodeObject(iccTsi, forKey: "iccTsi")
  aCoder.encodeObject(iccTransactionType, forKey: "iccTransactionType")
  aCoder.encodeObject(iccUnpredictableNumber, forKey: "iccUnpredictableNumber")
  aCoder.encodeObject(iccTransactionTime, forKey: "iccTransactionTime")
  aCoder.encodeObject(iccAdditionalTerminalCapabilities, forKey: "iccAdditionalTerminalCapabilities")
  aCoder.encodeObject(iccTransactionCategoryCode, forKey: "iccTransactionCategoryCode")
  aCoder.encodeObject(iccIssuerApplicationPreferredName, forKey: "iccIssuerApplicationPreferredName")
  aCoder.encodeObject(iccCardholderName, forKey: "iccCardholderName")
  aCoder.encodeObject(iccIssuerCodeTableIndex, forKey: "iccIssuerCodeTableIndex")
  aCoder.encodeObject(iccIssuerScripts, forKey: "iccIssuerScripts")
  aCoder.encodeObject(iccIssuerScriptResults, forKey: "iccIssuerScriptResults")
  aCoder.encodeObject(debugTrack2EquivalentData, forKey: "debugTrack2EquivalentData")
  aCoder.encodeObject(debugApplicationPan, forKey: "debugApplicationPan")
  aCoder.encodeObject(debugAmountAuthorizedBinary, forKey: "debugAmountAuthorizedBinary")
  aCoder.encodeObject(debugAmountOtherBinary, forKey: "debugAmountOtherBinary")
  aCoder.encodeObject(debugTransactionStatusInformation, forKey: "debugTransactionStatusInformation")
  aCoder.encodeObject(debugPlainTrack1, forKey: "debugPlainTrack1")
  aCoder.encodeObject(debugPlainTrack2, forKey: "debugPlainTrack2")
  aCoder.encodeObject(schemePunATC, forKey: "schemePunATC")
  aCoder.encodeObject(schemeThirdPartyData, forKey: "schemeThirdPartyData")
  aCoder.encodeObject(schemeMerchantCustomData, forKey: "schemeMerchantCustomData")
  aCoder.encodeObject(schemeTerminalEntryCapability, forKey: "schemeTerminalEntryCapability")
  aCoder.encodeObject(pinBlockContainer, forKey: "pinBlockContainer")
  aCoder.encodeObject(pinBlock, forKey: "pinBlock")
  aCoder.encodeObject(pinBlockKsn, forKey: "pinBlockKsn")
  aCoder.encodeObject(gwContainer, forKey: "gwContainer")
  aCoder.encodeObject(gwIssuerAuthenticationData, forKey: "gwIssuerAuthenticationData")
  aCoder.encodeObject(gwIssuerScriptTemplate1, forKey: "gwIssuerScriptTemplate1")
  aCoder.encodeObject(gwIssuerScriptTemplate2, forKey: "gwIssuerScriptTemplate2")
  aCoder.encodeObject(gwIssuerAuthorizationResponseCode, forKey: "gwIssuerAuthorizationResponseCode")
  aCoder.encodeObject(gwMessageControlField, forKey: "gwMessageControlField")
  aCoder.encodeObject(gwTxResult?.rawValue, forKey: "gwTxResult")
  aCoder.encodeObject(cvmResult?.rawValue, forKey: "cvmResult")
  aCoder.encodeObject(serviceCode1?.rawValue, forKey: "serviceCode1")
  aCoder.encodeObject(serviceCode2?.rawValue, forKey: "serviceCode2")
  aCoder.encodeObject(serviceCode3?.rawValue, forKey: "serviceCode3")
  aCoder.encodeObject(offlineApprovalAuthCode, forKey: "offlineApprovalAuthCode")
  aCoder.encodeObject(availableOfflineSpendingAmount, forKey: "availableOfflineSpendingAmount")
}

required public init(coder aDecoder: NSCoder) {
      txResult = (aDecoder.decodeObjectForKey("txResult") as? String) != nil ?
      CLVModels.Pay.TxResult(rawValue: (aDecoder.decodeObjectForKey("txResult") as! String)) : nil
        txError = (aDecoder.decodeObjectForKey("txError") as? String) != nil ?
      CLVModels.Pay.ErrorCode(rawValue: (aDecoder.decodeObjectForKey("txError") as! String)) : nil
        amount = aDecoder.decodeObjectForKey("amount") as? Double
        tipAmount = aDecoder.decodeObjectForKey("tipAmount") as? Double
        cashBackAmount = aDecoder.decodeObjectForKey("cashBackAmount") as? Double
        errorCode = aDecoder.decodeObjectForKey("errorCode") as? String
        errorText = aDecoder.decodeObjectForKey("errorText") as? String
        transactionDate = aDecoder.decodeObjectForKey("transactionDate") as? String
        transactionTime = aDecoder.decodeObjectForKey("transactionTime") as? String
        msrContainer = aDecoder.decodeObjectForKey("msrContainer") as? String
        msrMaskedTrack1 = aDecoder.decodeObjectForKey("msrMaskedTrack1") as? String
        msrMaskedTrack2 = aDecoder.decodeObjectForKey("msrMaskedTrack2") as? String
        maskedManualPan = aDecoder.decodeObjectForKey("maskedManualPan") as? String
        sredContainer = aDecoder.decodeObjectForKey("sredContainer") as? String
        sred = aDecoder.decodeObjectForKey("sred") as? String
        ksn = aDecoder.decodeObjectForKey("ksn") as? String
        transArmorContainer = aDecoder.decodeObjectForKey("transArmorContainer") as? String
        transArmorKey = aDecoder.decodeObjectForKey("transArmorKey") as? String
        transArmorKeyId = aDecoder.decodeObjectForKey("transArmorKeyId") as? String
        transArmorEncryptedTrack1 = aDecoder.decodeObjectForKey("transArmorEncryptedTrack1") as? String
        transArmorEncryptedTrack2 = aDecoder.decodeObjectForKey("transArmorEncryptedTrack2") as? String
        transArmorEncryptedEmvTag57 = aDecoder.decodeObjectForKey("transArmorEncryptedEmvTag57") as? String
        transArmorEncryptedEmvTag5A = aDecoder.decodeObjectForKey("transArmorEncryptedEmvTag5A") as? String
        transArmorEncryptedManualKeyedData = aDecoder.decodeObjectForKey("transArmorEncryptedManualKeyedData") as? String
        iccContainer = aDecoder.decodeObjectForKey("iccContainer") as? String
        iccApplicationInterchangeProfile = aDecoder.decodeObjectForKey("iccApplicationInterchangeProfile") as? String
        iccMaskedEmv57 = aDecoder.decodeObjectForKey("iccMaskedEmv57") as? String
        iccMaskedEmv5A = aDecoder.decodeObjectForKey("iccMaskedEmv5A") as? String
        iccApplicationPanSequenceNumber = aDecoder.decodeObjectForKey("iccApplicationPanSequenceNumber") as? String
        iccApplicationExpirationDate = aDecoder.decodeObjectForKey("iccApplicationExpirationDate") as? String
        iccApplicationEffectiveDate = aDecoder.decodeObjectForKey("iccApplicationEffectiveDate") as? String
        iccAmountAuthorized = aDecoder.decodeObjectForKey("iccAmountAuthorized") as? String
        iccAmountOther = aDecoder.decodeObjectForKey("iccAmountOther") as? String
        iccTransactionCurrencyCode = aDecoder.decodeObjectForKey("iccTransactionCurrencyCode") as? String
        iccTransactionCurrencyExponent = aDecoder.decodeObjectForKey("iccTransactionCurrencyExponent") as? String
        iccApplicationUsageControl = aDecoder.decodeObjectForKey("iccApplicationUsageControl") as? String
        iccIssuerActionCodeDefault = aDecoder.decodeObjectForKey("iccIssuerActionCodeDefault") as? String
        iccIssuerActionCodeDenial = aDecoder.decodeObjectForKey("iccIssuerActionCodeDenial") as? String
        iccIssuerActionCodeOnline = aDecoder.decodeObjectForKey("iccIssuerActionCodeOnline") as? String
        iccApplicationLabel = aDecoder.decodeObjectForKey("iccApplicationLabel") as? String
        iccApplicationCryptogram = aDecoder.decodeObjectForKey("iccApplicationCryptogram") as? String
        iccApplicationIdentifierCard = aDecoder.decodeObjectForKey("iccApplicationIdentifierCard") as? String
        iccApplicationIdentifierTerminal = aDecoder.decodeObjectForKey("iccApplicationIdentifierTerminal") as? String
        iccApplicationTransactionCounter = aDecoder.decodeObjectForKey("iccApplicationTransactionCounter") as? String
        iccApplicationVersionNumber = aDecoder.decodeObjectForKey("iccApplicationVersionNumber") as? String
        iccCryptogramInformationData = aDecoder.decodeObjectForKey("iccCryptogramInformationData") as? String
        iccCvmResults = aDecoder.decodeObjectForKey("iccCvmResults") as? String
        iccInterfaceDeviceSerialNumber = aDecoder.decodeObjectForKey("iccInterfaceDeviceSerialNumber") as? String
        iccIssuerApplicationData = aDecoder.decodeObjectForKey("iccIssuerApplicationData") as? String
        iccPosEntryModeCode = aDecoder.decodeObjectForKey("iccPosEntryModeCode") as? String
        iccTerminalCapabilities = aDecoder.decodeObjectForKey("iccTerminalCapabilities") as? String
        iccTerminalCountryCode = aDecoder.decodeObjectForKey("iccTerminalCountryCode") as? String
        iccTerminalType = aDecoder.decodeObjectForKey("iccTerminalType") as? String
        iccTvr = aDecoder.decodeObjectForKey("iccTvr") as? String
        iccTransactionDate = aDecoder.decodeObjectForKey("iccTransactionDate") as? String
        iccTsi = aDecoder.decodeObjectForKey("iccTsi") as? String
        iccTransactionType = aDecoder.decodeObjectForKey("iccTransactionType") as? String
        iccUnpredictableNumber = aDecoder.decodeObjectForKey("iccUnpredictableNumber") as? String
        iccTransactionTime = aDecoder.decodeObjectForKey("iccTransactionTime") as? String
        iccAdditionalTerminalCapabilities = aDecoder.decodeObjectForKey("iccAdditionalTerminalCapabilities") as? String
        iccTransactionCategoryCode = aDecoder.decodeObjectForKey("iccTransactionCategoryCode") as? String
        iccIssuerApplicationPreferredName = aDecoder.decodeObjectForKey("iccIssuerApplicationPreferredName") as? String
        iccCardholderName = aDecoder.decodeObjectForKey("iccCardholderName") as? String
        iccIssuerCodeTableIndex = aDecoder.decodeObjectForKey("iccIssuerCodeTableIndex") as? String
        iccIssuerScripts = aDecoder.decodeObjectForKey("iccIssuerScripts") as? String
        iccIssuerScriptResults = aDecoder.decodeObjectForKey("iccIssuerScriptResults") as? String
        debugTrack2EquivalentData = aDecoder.decodeObjectForKey("debugTrack2EquivalentData") as? String
        debugApplicationPan = aDecoder.decodeObjectForKey("debugApplicationPan") as? String
        debugAmountAuthorizedBinary = aDecoder.decodeObjectForKey("debugAmountAuthorizedBinary") as? String
        debugAmountOtherBinary = aDecoder.decodeObjectForKey("debugAmountOtherBinary") as? String
        debugTransactionStatusInformation = aDecoder.decodeObjectForKey("debugTransactionStatusInformation") as? String
        debugPlainTrack1 = aDecoder.decodeObjectForKey("debugPlainTrack1") as? String
        debugPlainTrack2 = aDecoder.decodeObjectForKey("debugPlainTrack2") as? String
        schemePunATC = aDecoder.decodeObjectForKey("schemePunATC") as? String
        schemeThirdPartyData = aDecoder.decodeObjectForKey("schemeThirdPartyData") as? String
        schemeMerchantCustomData = aDecoder.decodeObjectForKey("schemeMerchantCustomData") as? String
        schemeTerminalEntryCapability = aDecoder.decodeObjectForKey("schemeTerminalEntryCapability") as? String
        pinBlockContainer = aDecoder.decodeObjectForKey("pinBlockContainer") as? String
        pinBlock = aDecoder.decodeObjectForKey("pinBlock") as? String
        pinBlockKsn = aDecoder.decodeObjectForKey("pinBlockKsn") as? String
        gwContainer = aDecoder.decodeObjectForKey("gwContainer") as? String
        gwIssuerAuthenticationData = aDecoder.decodeObjectForKey("gwIssuerAuthenticationData") as? String
        gwIssuerScriptTemplate1 = aDecoder.decodeObjectForKey("gwIssuerScriptTemplate1") as? String
        gwIssuerScriptTemplate2 = aDecoder.decodeObjectForKey("gwIssuerScriptTemplate2") as? String
        gwIssuerAuthorizationResponseCode = aDecoder.decodeObjectForKey("gwIssuerAuthorizationResponseCode") as? String
        gwMessageControlField = aDecoder.decodeObjectForKey("gwMessageControlField") as? String
        gwTxResult = (aDecoder.decodeObjectForKey("gwTxResult") as? String) != nil ?
      CLVModels.Pay.GwTxResult(rawValue: (aDecoder.decodeObjectForKey("gwTxResult") as! String)) : nil
        cvmResult = (aDecoder.decodeObjectForKey("cvmResult") as? String) != nil ?
      CLVModels.Payments.CvmResult(rawValue: (aDecoder.decodeObjectForKey("cvmResult") as! String)) : nil
        serviceCode1 = (aDecoder.decodeObjectForKey("serviceCode1") as? String) != nil ?
      CLVModels.Pay.ServiceCode1(rawValue: (aDecoder.decodeObjectForKey("serviceCode1") as! String)) : nil
        serviceCode2 = (aDecoder.decodeObjectForKey("serviceCode2") as? String) != nil ?
      CLVModels.Pay.ServiceCode2(rawValue: (aDecoder.decodeObjectForKey("serviceCode2") as! String)) : nil
        serviceCode3 = (aDecoder.decodeObjectForKey("serviceCode3") as? String) != nil ?
      CLVModels.Pay.ServiceCode3(rawValue: (aDecoder.decodeObjectForKey("serviceCode3") as! String)) : nil
        offlineApprovalAuthCode = aDecoder.decodeObjectForKey("offlineApprovalAuthCode") as? String
        availableOfflineSpendingAmount = aDecoder.decodeObjectForKey("availableOfflineSpendingAmount") as? Double
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      txResult <- map["txResult"]
        txError <- map["txError"]
        amount <- map["amount"]
        tipAmount <- map["tipAmount"]
        cashBackAmount <- map["cashBackAmount"]
        errorCode <- map["errorCode"]
        errorText <- map["errorText"]
        transactionDate <- map["transactionDate"]
        transactionTime <- map["transactionTime"]
        msrContainer <- map["msrContainer"]
        msrMaskedTrack1 <- map["msrMaskedTrack1"]
        msrMaskedTrack2 <- map["msrMaskedTrack2"]
        maskedManualPan <- map["maskedManualPan"]
        sredContainer <- map["sredContainer"]
        sred <- map["sred"]
        ksn <- map["ksn"]
        transArmorContainer <- map["transArmorContainer"]
        transArmorKey <- map["transArmorKey"]
        transArmorKeyId <- map["transArmorKeyId"]
        transArmorEncryptedTrack1 <- map["transArmorEncryptedTrack1"]
        transArmorEncryptedTrack2 <- map["transArmorEncryptedTrack2"]
        transArmorEncryptedEmvTag57 <- map["transArmorEncryptedEmvTag57"]
        transArmorEncryptedEmvTag5A <- map["transArmorEncryptedEmvTag5A"]
        transArmorEncryptedManualKeyedData <- map["transArmorEncryptedManualKeyedData"]
        iccContainer <- map["iccContainer"]
        iccApplicationInterchangeProfile <- map["iccApplicationInterchangeProfile"]
        iccMaskedEmv57 <- map["iccMaskedEmv57"]
        iccMaskedEmv5A <- map["iccMaskedEmv5A"]
        iccApplicationPanSequenceNumber <- map["iccApplicationPanSequenceNumber"]
        iccApplicationExpirationDate <- map["iccApplicationExpirationDate"]
        iccApplicationEffectiveDate <- map["iccApplicationEffectiveDate"]
        iccAmountAuthorized <- map["iccAmountAuthorized"]
        iccAmountOther <- map["iccAmountOther"]
        iccTransactionCurrencyCode <- map["iccTransactionCurrencyCode"]
        iccTransactionCurrencyExponent <- map["iccTransactionCurrencyExponent"]
        iccApplicationUsageControl <- map["iccApplicationUsageControl"]
        iccIssuerActionCodeDefault <- map["iccIssuerActionCodeDefault"]
        iccIssuerActionCodeDenial <- map["iccIssuerActionCodeDenial"]
        iccIssuerActionCodeOnline <- map["iccIssuerActionCodeOnline"]
        iccApplicationLabel <- map["iccApplicationLabel"]
        iccApplicationCryptogram <- map["iccApplicationCryptogram"]
        iccApplicationIdentifierCard <- map["iccApplicationIdentifierCard"]
        iccApplicationIdentifierTerminal <- map["iccApplicationIdentifierTerminal"]
        iccApplicationTransactionCounter <- map["iccApplicationTransactionCounter"]
        iccApplicationVersionNumber <- map["iccApplicationVersionNumber"]
        iccCryptogramInformationData <- map["iccCryptogramInformationData"]
        iccCvmResults <- map["iccCvmResults"]
        iccInterfaceDeviceSerialNumber <- map["iccInterfaceDeviceSerialNumber"]
        iccIssuerApplicationData <- map["iccIssuerApplicationData"]
        iccPosEntryModeCode <- map["iccPosEntryModeCode"]
        iccTerminalCapabilities <- map["iccTerminalCapabilities"]
        iccTerminalCountryCode <- map["iccTerminalCountryCode"]
        iccTerminalType <- map["iccTerminalType"]
        iccTvr <- map["iccTvr"]
        iccTransactionDate <- map["iccTransactionDate"]
        iccTsi <- map["iccTsi"]
        iccTransactionType <- map["iccTransactionType"]
        iccUnpredictableNumber <- map["iccUnpredictableNumber"]
        iccTransactionTime <- map["iccTransactionTime"]
        iccAdditionalTerminalCapabilities <- map["iccAdditionalTerminalCapabilities"]
        iccTransactionCategoryCode <- map["iccTransactionCategoryCode"]
        iccIssuerApplicationPreferredName <- map["iccIssuerApplicationPreferredName"]
        iccCardholderName <- map["iccCardholderName"]
        iccIssuerCodeTableIndex <- map["iccIssuerCodeTableIndex"]
        iccIssuerScripts <- map["iccIssuerScripts"]
        iccIssuerScriptResults <- map["iccIssuerScriptResults"]
        debugTrack2EquivalentData <- map["debugTrack2EquivalentData"]
        debugApplicationPan <- map["debugApplicationPan"]
        debugAmountAuthorizedBinary <- map["debugAmountAuthorizedBinary"]
        debugAmountOtherBinary <- map["debugAmountOtherBinary"]
        debugTransactionStatusInformation <- map["debugTransactionStatusInformation"]
        debugPlainTrack1 <- map["debugPlainTrack1"]
        debugPlainTrack2 <- map["debugPlainTrack2"]
        schemePunATC <- map["schemePunATC"]
        schemeThirdPartyData <- map["schemeThirdPartyData"]
        schemeMerchantCustomData <- map["schemeMerchantCustomData"]
        schemeTerminalEntryCapability <- map["schemeTerminalEntryCapability"]
        pinBlockContainer <- map["pinBlockContainer"]
        pinBlock <- map["pinBlock"]
        pinBlockKsn <- map["pinBlockKsn"]
        gwContainer <- map["gwContainer"]
        gwIssuerAuthenticationData <- map["gwIssuerAuthenticationData"]
        gwIssuerScriptTemplate1 <- map["gwIssuerScriptTemplate1"]
        gwIssuerScriptTemplate2 <- map["gwIssuerScriptTemplate2"]
        gwIssuerAuthorizationResponseCode <- map["gwIssuerAuthorizationResponseCode"]
        gwMessageControlField <- map["gwMessageControlField"]
        gwTxResult <- map["gwTxResult"]
        cvmResult <- map["cvmResult"]
        serviceCode1 <- map["serviceCode1"]
        serviceCode2 <- map["serviceCode2"]
        serviceCode3 <- map["serviceCode3"]
        offlineApprovalAuthCode <- map["offlineApprovalAuthCode"]
        availableOfflineSpendingAmount <- map["availableOfflineSpendingAmount"]
  }
}


 
public enum TxResult: String {
  case ERROR
  case MSR
  case EMV_OFFLINE_APPROVED
  case EMV_OFFLINE_DECLINED
  case EMV_GO_ONLINE
  case EMV_APPROVED_ONLINE
  case EMV_DECLINED_ONLINE
  case RFID_OFFLINE_APPROVED
  case RFID_OFFLINE_DECLINED
  case RFID_GO_ONLINE
  case RFID_TERMINATED
  case RFID_MSR
  case MANUAL
}

}
}
