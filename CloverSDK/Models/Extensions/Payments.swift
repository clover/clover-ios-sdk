 
 import ObjectMapper
 
 extension CLVModels {
  public class Payments {
    
    
    public class Authorization: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      /// Payment that the auth was opened with
      public var payment: CLVModels.Payments.Payment?
      /// Name of tab
      public var tabName: String?
      /// Amount authorized
      public var amount: Int?
      /// Type of credit card used for authorization
      public var cardType: CLVModels.Payments.CardType?
      /// Last 4 digits of credit card used for authorization
      public var last4: String?
      /// Authorization code
      public var authcode: String?
      public var type_: CLVModels.Payments.Type_?
      public var note: String?
      /// Payment that the auth was closed with
      public var closingPayment: CLVModels.Payments.Payment?
      /// Time authorization was recorded on server
      public var createdTime: NSDate?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(payment, forKey: "payment")
        aCoder.encodeObject(tabName, forKey: "tabName")
        aCoder.encodeObject(amount, forKey: "amount")
        aCoder.encodeObject(cardType?.rawValue, forKey: "cardType")
        aCoder.encodeObject(last4, forKey: "last4")
        aCoder.encodeObject(authcode, forKey: "authcode")
        aCoder.encodeObject(type_?.rawValue, forKey: "type_")
        aCoder.encodeObject(note, forKey: "note")
        aCoder.encodeObject(closingPayment, forKey: "closingPayment")
        aCoder.encodeObject(createdTime, forKey: "createdTime")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        payment = aDecoder.decodeObjectForKey("payment") as? CLVModels.Payments.Payment
        tabName = aDecoder.decodeObjectForKey("tabName") as? String
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        cardType = (aDecoder.decodeObjectForKey("cardType") as? String) != nil ?
          CLVModels.Payments.CardType(rawValue: (aDecoder.decodeObjectForKey("cardType") as! String)) : nil
        last4 = aDecoder.decodeObjectForKey("last4") as? String
        authcode = aDecoder.decodeObjectForKey("authcode") as? String
        type_ = (aDecoder.decodeObjectForKey("type_") as? String) != nil ?
          CLVModels.Payments.Type_(rawValue: (aDecoder.decodeObjectForKey("type_") as! String)) : nil
        note = aDecoder.decodeObjectForKey("note") as? String
        closingPayment = aDecoder.decodeObjectForKey("closingPayment") as? CLVModels.Payments.Payment
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        payment <- map["payment"]
        tabName <- map["tabName"]
        amount <- map["amount"]
        cardType <- map["cardType"]
        last4 <- map["last4"]
        authcode <- map["authcode"]
        type_ <- map["type_"]
        note <- map["note"]
        closingPayment <- map["closingPayment"]
        createdTime <- (map["createdTime"], CLVDateTransform())
      }
    }
    
    
    
    public enum AVSResult: String {
      case SUCCESS
      case ZIP_CODE_MATCH
      case ZIP_CODE_MATCH_ADDRESS_NOT_CHECKED
      case ADDRESS_MATCH
      case ADDRESS_MATCH_ZIP_NOT_CHECKED
      case NEITHER_MATCH
      case SERVICE_FAILURE
      case SERVICE_UNAVAILABLE
      case NOT_CHECKED
      case ZIP_CODE_NOT_MATCHED_ADDRESS_NOT_CHECKED
      case ADDRESS_NOT_MATCHED_ZIP_CODE_NOT_CHECKED
    }
    
    
    
    public class Batch: NSObject, NSCoding, Mappable {
      public var id: String?
      public var merchantId: Int?
      public var firstGatewayTxId: Int?
      public var lastGatewayTxId: Int?
      /// The id of employee who executed batch
      public var accountId: Int?
      /// The number of transactions being batched
      public var txCount: Int?
      /// Total amount closed
      public var totalBatchAmount: Int?
      /// List of devices in batch
      public var devices: String?
      public var state: CLVModels.Payments.BatchState?
      public var batchType: CLVModels.Payments.BatchType?
      /// Created time of batch
      public var createdTime: NSDate?
      /// Modified time of batch
      public var modifiedTime: NSDate?
      /// Details split based on card / employees
      public var batchDetails: CLVModels.Payments.BatchDetail?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(merchantId, forKey: "merchantId")
        aCoder.encodeObject(firstGatewayTxId, forKey: "firstGatewayTxId")
        aCoder.encodeObject(lastGatewayTxId, forKey: "lastGatewayTxId")
        aCoder.encodeObject(accountId, forKey: "accountId")
        aCoder.encodeObject(txCount, forKey: "txCount")
        aCoder.encodeObject(totalBatchAmount, forKey: "totalBatchAmount")
        aCoder.encodeObject(devices, forKey: "devices")
        aCoder.encodeObject(state?.rawValue, forKey: "state")
        aCoder.encodeObject(batchType?.rawValue, forKey: "batchType")
        aCoder.encodeObject(createdTime, forKey: "createdTime")
        aCoder.encodeObject(modifiedTime, forKey: "modifiedTime")
        aCoder.encodeObject(batchDetails, forKey: "batchDetails")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        merchantId = aDecoder.decodeObjectForKey("merchantId") as? Int
        firstGatewayTxId = aDecoder.decodeObjectForKey("firstGatewayTxId") as? Int
        lastGatewayTxId = aDecoder.decodeObjectForKey("lastGatewayTxId") as? Int
        accountId = aDecoder.decodeObjectForKey("accountId") as? Int
        txCount = aDecoder.decodeObjectForKey("txCount") as? Int
        totalBatchAmount = aDecoder.decodeObjectForKey("totalBatchAmount") as? Int
        devices = aDecoder.decodeObjectForKey("devices") as? String
        state = (aDecoder.decodeObjectForKey("state") as? String) != nil ?
          CLVModels.Payments.BatchState(rawValue: (aDecoder.decodeObjectForKey("state") as! String)) : nil
        batchType = (aDecoder.decodeObjectForKey("batchType") as? String) != nil ?
          CLVModels.Payments.BatchType(rawValue: (aDecoder.decodeObjectForKey("batchType") as! String)) : nil
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        modifiedTime = aDecoder.decodeObjectForKey("modifiedTime") as? NSDate
        batchDetails = aDecoder.decodeObjectForKey("batchDetails") as? CLVModels.Payments.BatchDetail
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        merchantId <- map["merchantId"]
        firstGatewayTxId <- map["firstGatewayTxId"]
        lastGatewayTxId <- map["lastGatewayTxId"]
        accountId <- map["accountId"]
        txCount <- map["txCount"]
        totalBatchAmount <- map["totalBatchAmount"]
        devices <- map["devices"]
        state <- map["state"]
        batchType <- map["batchType"]
        createdTime <- (map["createdTime"], CLVDateTransform())
        modifiedTime <- (map["modifiedTime"], CLVDateTransform())
        batchDetails <- map["batchDetails"]
      }
    }
    
    
    
    public class BatchCardTotal: NSObject, NSCoding, Mappable {
      public var cardType: CLVModels.Payments.CardType?
      /// Total count of types
      public var count: Int?
      /// Total amount for type
      public var total: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(cardType?.rawValue, forKey: "cardType")
        aCoder.encodeObject(count, forKey: "count")
        aCoder.encodeObject(total, forKey: "total")
      }
      
      required public init(coder aDecoder: NSCoder) {
        cardType = (aDecoder.decodeObjectForKey("cardType") as? String) != nil ?
          CLVModels.Payments.CardType(rawValue: (aDecoder.decodeObjectForKey("cardType") as! String)) : nil
        count = aDecoder.decodeObjectForKey("count") as? Int
        total = aDecoder.decodeObjectForKey("total") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        cardType <- map["cardType"]
        count <- map["count"]
        total <- map["total"]
      }
    }
    
    
    
    public class BatchDetail: NSObject, NSCoding, Mappable {
      public var batchTotals: CLVModels.Payments.BatchTotalStats?
      public var serverTotals: [CLVModels.Payments.ServerTotalStats]?
      public var cardTotals: [CLVModels.Payments.BatchCardTotal]?
      /// Number of open tips.
      public var openTips: Int?
      /// Number of open tabs.
      public var openTabs: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(batchTotals, forKey: "batchTotals")
        aCoder.encodeObject(serverTotals, forKey: "serverTotals")
        aCoder.encodeObject(cardTotals, forKey: "cardTotals")
        aCoder.encodeObject(openTips, forKey: "openTips")
        aCoder.encodeObject(openTabs, forKey: "openTabs")
      }
      
      required public init(coder aDecoder: NSCoder) {
        batchTotals = aDecoder.decodeObjectForKey("batchTotals") as? CLVModels.Payments.BatchTotalStats
        serverTotals = aDecoder.decodeObjectForKey("serverTotals") as? [CLVModels.Payments.ServerTotalStats]
        cardTotals = aDecoder.decodeObjectForKey("cardTotals") as? [CLVModels.Payments.BatchCardTotal]
        openTips = aDecoder.decodeObjectForKey("openTips") as? Int
        openTabs = aDecoder.decodeObjectForKey("openTabs") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        batchTotals <- map["batchTotals"]
        serverTotals <- (map["serverTotals"], CLVArrayTransform<CLVModels.Payments.ServerTotalStats>())
        cardTotals <- (map["cardTotals"], CLVArrayTransform<CLVModels.Payments.BatchCardTotal>())
        openTips <- map["openTips"]
        openTabs <- map["openTabs"]
      }
    }
    
    
    
    public class BatchRequest: NSObject, NSCoding, Mappable {
      public var devices: [String]?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(devices, forKey: "devices")
      }
      
      required public init(coder aDecoder: NSCoder) {
        devices = aDecoder.decodeObjectForKey("devices") as? [String]
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        devices <- map["devices"]
      }
    }
    
    
    
    public enum BatchState: String {
      case OPEN
      case QUEUED_FOR_PROCESSING
      case PROCESSING
      case CLOSED
      case FAILED
    }
    
    
    
    public class BatchTotalStats: NSObject, NSCoding, Mappable {
      public var sales: CLVModels.Payments.BatchTotalType?
      public var refunds: CLVModels.Payments.BatchTotalType?
      public var net: CLVModels.Payments.BatchTotalType?
      public var giftCardLoads: CLVModels.Payments.BatchTotalType?
      public var giftCardCashOuts: CLVModels.Payments.BatchTotalType?
      public var tax: CLVModels.Payments.BatchTotalType?
      public var tips: CLVModels.Payments.BatchTotalType?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(sales, forKey: "sales")
        aCoder.encodeObject(refunds, forKey: "refunds")
        aCoder.encodeObject(net, forKey: "net")
        aCoder.encodeObject(giftCardLoads, forKey: "giftCardLoads")
        aCoder.encodeObject(giftCardCashOuts, forKey: "giftCardCashOuts")
        aCoder.encodeObject(tax, forKey: "tax")
        aCoder.encodeObject(tips, forKey: "tips")
      }
      
      required public init(coder aDecoder: NSCoder) {
        sales = aDecoder.decodeObjectForKey("sales") as? CLVModels.Payments.BatchTotalType
        refunds = aDecoder.decodeObjectForKey("refunds") as? CLVModels.Payments.BatchTotalType
        net = aDecoder.decodeObjectForKey("net") as? CLVModels.Payments.BatchTotalType
        giftCardLoads = aDecoder.decodeObjectForKey("giftCardLoads") as? CLVModels.Payments.BatchTotalType
        giftCardCashOuts = aDecoder.decodeObjectForKey("giftCardCashOuts") as? CLVModels.Payments.BatchTotalType
        tax = aDecoder.decodeObjectForKey("tax") as? CLVModels.Payments.BatchTotalType
        tips = aDecoder.decodeObjectForKey("tips") as? CLVModels.Payments.BatchTotalType
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        sales <- map["sales"]
        refunds <- map["refunds"]
        net <- map["net"]
        giftCardLoads <- map["giftCardLoads"]
        giftCardCashOuts <- map["giftCardCashOuts"]
        tax <- map["tax"]
        tips <- map["tips"]
      }
    }
    
    
    
    public class BatchTotalType: NSObject, NSCoding, Mappable {
      /// Total count of types
      public var count: Int?
      /// Total amount for type
      public var total: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(count, forKey: "count")
        aCoder.encodeObject(total, forKey: "total")
      }
      
      required public init(coder aDecoder: NSCoder) {
        count = aDecoder.decodeObjectForKey("count") as? Int
        total = aDecoder.decodeObjectForKey("total") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        count <- map["count"]
        total <- map["total"]
      }
    }
    
    
    
    public enum BatchType: String {
      case MANUAL_CLOSE
      case AUTO_CLOSE
    }
    
    
    
    public enum CardEntryType: String {
      case SWIPED
      case KEYED
      case VOICE
      case VAULTED
      case OFFLINE_SWIPED
      case OFFLINE_KEYED
      case EMV_CONTACT
      case EMV_CONTACTLESS
      case MSD_CONTACTLESS
      case PINPAD_MANUAL_ENTRY
    }
    
    
    
    public class CardTransaction: NSObject, NSCoding, Mappable {
      /// The payment with which the card transaction is associated
      public var paymentRef: CLVModels.Payments.Payment?
      /// The credit with which the card transaction is associated
      public var creditRef: CLVModels.Payments.Credit?
      public var cardType: CLVModels.Payments.CardType?
      public var entryType: CLVModels.Payments.CardEntryType?
      /// The last four digits of the credit card number
      public var last4: String?
      public var type_: CLVModels.Payments.CardTransactionType?
      /// Authorization code (if successful)
      public var authCode: String?
      public var referenceId: String?
      public var transactionNo: String?
      public var state: CLVModels.Payments.CardTransactionState?
      /// Extra info to be stored as part of gateway/card transaction
      public var extra: [String:String]?
      public var begBalance: Int?
      public var endBalance: Int?
      public var avsResult: CLVModels.Payments.AVSResult?
      public var cardholderName: String?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(paymentRef, forKey: "paymentRef")
        aCoder.encodeObject(creditRef, forKey: "creditRef")
        aCoder.encodeObject(cardType?.rawValue, forKey: "cardType")
        aCoder.encodeObject(entryType?.rawValue, forKey: "entryType")
        aCoder.encodeObject(last4, forKey: "last4")
        aCoder.encodeObject(type_?.rawValue, forKey: "type_")
        aCoder.encodeObject(authCode, forKey: "authCode")
        aCoder.encodeObject(referenceId, forKey: "referenceId")
        aCoder.encodeObject(transactionNo, forKey: "transactionNo")
        aCoder.encodeObject(state?.rawValue, forKey: "state")
        aCoder.encodeObject(extra, forKey: "extra")
        aCoder.encodeObject(begBalance, forKey: "begBalance")
        aCoder.encodeObject(endBalance, forKey: "endBalance")
        aCoder.encodeObject(avsResult?.rawValue, forKey: "avsResult")
        aCoder.encodeObject(cardholderName, forKey: "cardholderName")
      }
      
      required public init(coder aDecoder: NSCoder) {
        paymentRef = aDecoder.decodeObjectForKey("paymentRef") as? CLVModels.Payments.Payment
        creditRef = aDecoder.decodeObjectForKey("creditRef") as? CLVModels.Payments.Credit
        cardType = (aDecoder.decodeObjectForKey("cardType") as? String) != nil ?
          CLVModels.Payments.CardType(rawValue: (aDecoder.decodeObjectForKey("cardType") as! String)) : nil
        entryType = (aDecoder.decodeObjectForKey("entryType") as? String) != nil ?
          CLVModels.Payments.CardEntryType(rawValue: (aDecoder.decodeObjectForKey("entryType") as! String)) : nil
        last4 = aDecoder.decodeObjectForKey("last4") as? String
        type_ = (aDecoder.decodeObjectForKey("type_") as? String) != nil ?
          CLVModels.Payments.CardTransactionType(rawValue: (aDecoder.decodeObjectForKey("type_") as! String)) : nil
        authCode = aDecoder.decodeObjectForKey("authCode") as? String
        referenceId = aDecoder.decodeObjectForKey("referenceId") as? String
        transactionNo = aDecoder.decodeObjectForKey("transactionNo") as? String
        state = (aDecoder.decodeObjectForKey("state") as? String) != nil ?
          CLVModels.Payments.CardTransactionState(rawValue: (aDecoder.decodeObjectForKey("state") as! String)) : nil
        extra = aDecoder.decodeObjectForKey("extra") as? [String:String]
        begBalance = aDecoder.decodeObjectForKey("begBalance") as? Int
        endBalance = aDecoder.decodeObjectForKey("endBalance") as? Int
        avsResult = (aDecoder.decodeObjectForKey("avsResult") as? String) != nil ?
          CLVModels.Payments.AVSResult(rawValue: (aDecoder.decodeObjectForKey("avsResult") as! String)) : nil
        cardholderName = aDecoder.decodeObjectForKey("cardholderName") as? String
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        paymentRef <- map["paymentRef"]
        creditRef <- map["creditRef"]
        cardType <- map["cardType"]
        entryType <- map["entryType"]
        last4 <- map["last4"]
        type_ <- map["type_"]
        authCode <- map["authCode"]
        referenceId <- map["referenceId"]
        transactionNo <- map["transactionNo"]
        state <- map["state"]
        extra <- map["extra"]
        begBalance <- map["begBalance"]
        endBalance <- map["endBalance"]
        avsResult <- map["avsResult"]
        cardholderName <- map["cardholderName"]
      }
    }
    
    
    
    public enum CardTransactionState: String {
      case PENDING
      case CLOSED
    }
    
    
    
    public enum CardTransactionType: String {
      case AUTH
      case PREAUTH
      case PREAUTHCAPTURE
      case ADJUST
      case VOID
      case VOIDRETURN
      case RETURN
      case REFUND
      case NAKEDREFUND
      case GETBALANCE
      case BATCHCLOSE
      case ACTIVATE
      case BALANCE_LOCK
      case LOAD
      case CASHOUT
      case CASHOUT_ACTIVE_STATUS
      case REDEMPTION
      case REDEMPTION_UNLOCK
      case RELOAD
    }
    
    
    
    public enum CardType: String {
      case VISA
      case MC
      case AMEX
      case DISCOVER
      case DINERS_CLUB
      case JCB
      case MAESTRO
      case SOLO
      case LASER
      case CHINA_UNION_PAY
      case CARTE_BLANCHE
      case UNKNOWN
      case GIFT_CARD
      case EBT
    }
    
    
    
    public class Credit: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      /// The order with which the credit is associated
      public var orderRef: CLVModels.Order.Order?
      /// Device which processed this credit
      public var device: CLVModels.Device.Device?
      /// The tender type associated with this payment, e.g. credit card, cash, etc.
      public var tender: CLVModels.Base.Tender?
      /// The employee who processed the payment
      public var employee: CLVModels.Employees.Employee?
      /// Customer who received the credit/refund
      public var customers: CLVModels.Customers.Customer?
      /// Amount paid in tax
      public var amount: Int?
      /// Amount paid in tax
      public var taxAmount: Int?
      public var taxRates: [CLVModels.Payments.TaxableAmountRate]?
      /// Time payment was recorded on server
      public var createdTime: NSDate?
      public var clientCreatedTime: NSDate?
      /// Information about the card used for credit/debit card payments
      public var cardTransaction: CLVModels.Payments.CardTransaction?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(orderRef, forKey: "orderRef")
        aCoder.encodeObject(device, forKey: "device")
        aCoder.encodeObject(tender, forKey: "tender")
        aCoder.encodeObject(employee, forKey: "employee")
        aCoder.encodeObject(customers, forKey: "customers")
        aCoder.encodeObject(amount, forKey: "amount")
        aCoder.encodeObject(taxAmount, forKey: "taxAmount")
        aCoder.encodeObject(taxRates, forKey: "taxRates")
        aCoder.encodeObject(createdTime, forKey: "createdTime")
        aCoder.encodeObject(clientCreatedTime, forKey: "clientCreatedTime")
        aCoder.encodeObject(cardTransaction, forKey: "cardTransaction")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        orderRef = aDecoder.decodeObjectForKey("orderRef") as? CLVModels.Order.Order
        device = aDecoder.decodeObjectForKey("device") as? CLVModels.Device.Device
        tender = aDecoder.decodeObjectForKey("tender") as? CLVModels.Base.Tender
        employee = aDecoder.decodeObjectForKey("employee") as? CLVModels.Employees.Employee
        customers = aDecoder.decodeObjectForKey("customers") as? CLVModels.Customers.Customer
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        taxAmount = aDecoder.decodeObjectForKey("taxAmount") as? Int
        taxRates = aDecoder.decodeObjectForKey("taxRates") as? [CLVModels.Payments.TaxableAmountRate]
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        clientCreatedTime = aDecoder.decodeObjectForKey("clientCreatedTime") as? NSDate
        cardTransaction = aDecoder.decodeObjectForKey("cardTransaction") as? CLVModels.Payments.CardTransaction
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        orderRef <- map["orderRef"]
        device <- map["device"]
        tender <- map["tender"]
        employee <- map["employee"]
        customers <- map["customers"]
        amount <- map["amount"]
        taxAmount <- map["taxAmount"]
        taxRates <- (map["taxRates"], CLVArrayTransform<CLVModels.Payments.TaxableAmountRate>())
        createdTime <- (map["createdTime"], CLVDateTransform())
        clientCreatedTime <- (map["clientCreatedTime"], CLVDateTransform())
        cardTransaction <- map["cardTransaction"]
      }
    }
    
    
    
    public enum Currency: String {
      case USD
      case GBP
      case EUR
    }
    
    
    
    public enum CvmResult: String {
      case NO_CVM_REQUIRED
      case SIGNATURE
      case PIN
      case ONLINE_PIN
      case SIGNATURE_AND_PIN
      case CVM_FAILED
      case DEVICE
    }
    
    
    
    public enum CVVResult: String {
      case SUCCESS
      case FAILURE
      case NOT_PROCESSED
      case NOT_PRESENT
    }
    
    
    
    public class GatewayTxs: NSObject, NSCoding, Mappable {
      public var merchantGatewayId: Int?
      public var clientId: String?
      public var amount: Int?
      public var adjustAmount: Int?
      public var taxAmount: Int?
      public var tipAmount: Int?
      public var currency: CLVModels.Payments.Currency?
      public var state: CLVModels.Payments.GatewayTxState?
      public var retries: Int?
      public var type_: CLVModels.Payments.GatewayTxType?
      public var entryType: CLVModels.Payments.CardEntryType?
      public var responseCode: String?
      public var responseMessage: String?
      public var first4: String?
      public var last4: String?
      public var cardType: CLVModels.Payments.CardType?
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
      public var refundId: Int?
      public var paymentRefundId: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(merchantGatewayId, forKey: "merchantGatewayId")
        aCoder.encodeObject(clientId, forKey: "clientId")
        aCoder.encodeObject(amount, forKey: "amount")
        aCoder.encodeObject(adjustAmount, forKey: "adjustAmount")
        aCoder.encodeObject(taxAmount, forKey: "taxAmount")
        aCoder.encodeObject(tipAmount, forKey: "tipAmount")
        aCoder.encodeObject(currency?.rawValue, forKey: "currency")
        aCoder.encodeObject(state?.rawValue, forKey: "state")
        aCoder.encodeObject(retries, forKey: "retries")
        aCoder.encodeObject(type_?.rawValue, forKey: "type_")
        aCoder.encodeObject(entryType?.rawValue, forKey: "entryType")
        aCoder.encodeObject(responseCode, forKey: "responseCode")
        aCoder.encodeObject(responseMessage, forKey: "responseMessage")
        aCoder.encodeObject(first4, forKey: "first4")
        aCoder.encodeObject(last4, forKey: "last4")
        aCoder.encodeObject(cardType?.rawValue, forKey: "cardType")
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
        aCoder.encodeObject(refundId, forKey: "refundId")
        aCoder.encodeObject(paymentRefundId, forKey: "paymentRefundId")
      }
      
      required public init(coder aDecoder: NSCoder) {
        merchantGatewayId = aDecoder.decodeObjectForKey("merchantGatewayId") as? Int
        clientId = aDecoder.decodeObjectForKey("clientId") as? String
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        adjustAmount = aDecoder.decodeObjectForKey("adjustAmount") as? Int
        taxAmount = aDecoder.decodeObjectForKey("taxAmount") as? Int
        tipAmount = aDecoder.decodeObjectForKey("tipAmount") as? Int
        currency = (aDecoder.decodeObjectForKey("currency") as? String) != nil ?
          CLVModels.Payments.Currency(rawValue: (aDecoder.decodeObjectForKey("currency") as! String)) : nil
        state = (aDecoder.decodeObjectForKey("state") as? String) != nil ?
          CLVModels.Payments.GatewayTxState(rawValue: (aDecoder.decodeObjectForKey("state") as! String)) : nil
        retries = aDecoder.decodeObjectForKey("retries") as? Int
        type_ = (aDecoder.decodeObjectForKey("type_") as? String) != nil ?
          CLVModels.Payments.GatewayTxType(rawValue: (aDecoder.decodeObjectForKey("type_") as! String)) : nil
        entryType = (aDecoder.decodeObjectForKey("entryType") as? String) != nil ?
          CLVModels.Payments.CardEntryType(rawValue: (aDecoder.decodeObjectForKey("entryType") as! String)) : nil
        responseCode = aDecoder.decodeObjectForKey("responseCode") as? String
        responseMessage = aDecoder.decodeObjectForKey("responseMessage") as? String
        first4 = aDecoder.decodeObjectForKey("first4") as? String
        last4 = aDecoder.decodeObjectForKey("last4") as? String
        cardType = (aDecoder.decodeObjectForKey("cardType") as? String) != nil ?
          CLVModels.Payments.CardType(rawValue: (aDecoder.decodeObjectForKey("cardType") as! String)) : nil
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
        refundId = aDecoder.decodeObjectForKey("refundId") as? Int
        paymentRefundId = aDecoder.decodeObjectForKey("paymentRefundId") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        merchantGatewayId <- map["merchantGatewayId"]
        clientId <- map["clientId"]
        amount <- map["amount"]
        adjustAmount <- map["adjustAmount"]
        taxAmount <- map["taxAmount"]
        tipAmount <- map["tipAmount"]
        currency <- map["currency"]
        state <- map["state"]
        retries <- map["retries"]
        type_ <- map["type_"]
        entryType <- map["entryType"]
        responseCode <- map["responseCode"]
        responseMessage <- map["responseMessage"]
        first4 <- map["first4"]
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
        refundId <- map["refundId"]
        paymentRefundId <- map["paymentRefundId"]
      }
    }
    
    
    
    public enum GatewayTxState: String {
      case INITIATED
      case INITIATED_ON_AUTH
      case ACKNOWLEDGED
      case CONNECT_FAILED
      case TIMEOUT
      case FAILED
      case REVERSE_INITIATED
      case REVERSE_INITIATED_ON_AUTH
      case REVERSED
      case REVERSAL_FAILED
    }
    
    
    
    public enum GatewayTxType: String {
      case AUTH
      case PREAUTH
      case PREAUTHCAPTURE
      case ADJUST
      case VOID
      case VOIDRETURN
      case RETURN
      case REFUND
      case NAKEDREFUND
      case GETBALANCE
      case BATCHCLOSE
      case ACTIVATE
      case BALANCE_LOCK
      case LOAD
      case CASHOUT
      case CASHOUT_ACTIVE_STATUS
      case REDEMPTION
      case REDEMPTION_UNLOCK
      case RELOAD
    }
    
    
    
    public class GiftCard: NSObject, NSCoding, Mappable {
      /// Track 2 Card Data
      public var track2: String?
      /// Embossed Card Number
      public var cardNumber: String?
      /// Was Account Number Manually Entered
      public var isManuallyEntered: Bool?
      public var deviceSerial: String?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(track2, forKey: "track2")
        aCoder.encodeObject(cardNumber, forKey: "cardNumber")
        aCoder.encodeObject(isManuallyEntered, forKey: "isManuallyEntered")
        aCoder.encodeObject(deviceSerial, forKey: "deviceSerial")
      }
      
      required public init(coder aDecoder: NSCoder) {
        track2 = aDecoder.decodeObjectForKey("track2") as? String
        cardNumber = aDecoder.decodeObjectForKey("cardNumber") as? String
        isManuallyEntered = aDecoder.decodeObjectForKey("isManuallyEntered") as? Bool
        deviceSerial = aDecoder.decodeObjectForKey("deviceSerial") as? String
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        track2 <- map["track2"]
        cardNumber <- map["cardNumber"]
        isManuallyEntered <- map["isManuallyEntered"]
        deviceSerial <- map["deviceSerial"]
      }
    }
    
    
    
    public class GiftCardResponse: NSObject, NSCoding, Mappable {
      public var txType: CLVModels.Payments.TxType?
      public var state: CLVModels.Payments.GiftCardState?
      /// Transaction Amount
      public var requestAmount: Int?
      public var payment: CLVModels.Payments.Payment?
      public var responseMessage: String?
      public var requestSuccessful: Bool?
      public var accountNumber: String?
      public var giftCardTxUuid: String?
      public var transactionId: String?
      public var referenceUuid: String?
      public var authCode: String?
      public var begBal: Int?
      public var endBal: Int?
      public var holdBal: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(txType?.rawValue, forKey: "txType")
        aCoder.encodeObject(state?.rawValue, forKey: "state")
        aCoder.encodeObject(requestAmount, forKey: "requestAmount")
        aCoder.encodeObject(payment, forKey: "payment")
        aCoder.encodeObject(responseMessage, forKey: "responseMessage")
        aCoder.encodeObject(requestSuccessful, forKey: "requestSuccessful")
        aCoder.encodeObject(accountNumber, forKey: "accountNumber")
        aCoder.encodeObject(giftCardTxUuid, forKey: "giftCardTxUuid")
        aCoder.encodeObject(transactionId, forKey: "transactionId")
        aCoder.encodeObject(referenceUuid, forKey: "referenceUuid")
        aCoder.encodeObject(authCode, forKey: "authCode")
        aCoder.encodeObject(begBal, forKey: "begBal")
        aCoder.encodeObject(endBal, forKey: "endBal")
        aCoder.encodeObject(holdBal, forKey: "holdBal")
      }
      
      required public init(coder aDecoder: NSCoder) {
        txType = (aDecoder.decodeObjectForKey("txType") as? String) != nil ?
          CLVModels.Payments.TxType(rawValue: (aDecoder.decodeObjectForKey("txType") as! String)) : nil
        state = (aDecoder.decodeObjectForKey("state") as? String) != nil ?
          CLVModels.Payments.GiftCardState(rawValue: (aDecoder.decodeObjectForKey("state") as! String)) : nil
        requestAmount = aDecoder.decodeObjectForKey("requestAmount") as? Int
        payment = aDecoder.decodeObjectForKey("payment") as? CLVModels.Payments.Payment
        responseMessage = aDecoder.decodeObjectForKey("responseMessage") as? String
        requestSuccessful = aDecoder.decodeObjectForKey("requestSuccessful") as? Bool
        accountNumber = aDecoder.decodeObjectForKey("accountNumber") as? String
        giftCardTxUuid = aDecoder.decodeObjectForKey("giftCardTxUuid") as? String
        transactionId = aDecoder.decodeObjectForKey("transactionId") as? String
        referenceUuid = aDecoder.decodeObjectForKey("referenceUuid") as? String
        authCode = aDecoder.decodeObjectForKey("authCode") as? String
        begBal = aDecoder.decodeObjectForKey("begBal") as? Int
        endBal = aDecoder.decodeObjectForKey("endBal") as? Int
        holdBal = aDecoder.decodeObjectForKey("holdBal") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        txType <- map["txType"]
        state <- map["state"]
        requestAmount <- map["requestAmount"]
        payment <- map["payment"]
        responseMessage <- map["responseMessage"]
        requestSuccessful <- map["requestSuccessful"]
        accountNumber <- map["accountNumber"]
        giftCardTxUuid <- map["giftCardTxUuid"]
        transactionId <- map["transactionId"]
        referenceUuid <- map["referenceUuid"]
        authCode <- map["authCode"]
        begBal <- map["begBal"]
        endBal <- map["endBal"]
        holdBal <- map["holdBal"]
      }
    }
    
    
    
    public enum GiftCardState: String {
      case INVALID
      case ACTIVATED
      case INACTIVE
    }
    
    
    
    public class GiftCardTransaction: NSObject, NSCoding, Mappable {
      /// Transaction Amount
      public var amount: Int?
      /// Tax Amount
      public var taxAmount: Int?
      public var orderId: String?
      /// Gift Card
      public var card: CLVModels.Payments.GiftCard?
      public var paymentIds: [String]?
      public var ignorePayment: Bool?
      public var serviceChargeAmount: CLVModels.Payments.ServiceChargeAmount?
      public var taxableAmountRates: [CLVModels.Payments.TaxableAmountRate]?
      /// Payments that were made for this line item
      public var lineItems: [CLVModels.Payments.LineItemPayment]?
      public var employeeId: String?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(amount, forKey: "amount")
        aCoder.encodeObject(taxAmount, forKey: "taxAmount")
        aCoder.encodeObject(orderId, forKey: "orderId")
        aCoder.encodeObject(card, forKey: "card")
        aCoder.encodeObject(paymentIds, forKey: "paymentIds")
        aCoder.encodeObject(ignorePayment, forKey: "ignorePayment")
        aCoder.encodeObject(serviceChargeAmount, forKey: "serviceChargeAmount")
        aCoder.encodeObject(taxableAmountRates, forKey: "taxableAmountRates")
        aCoder.encodeObject(lineItems, forKey: "lineItems")
        aCoder.encodeObject(employeeId, forKey: "employeeId")
      }
      
      required public init(coder aDecoder: NSCoder) {
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        taxAmount = aDecoder.decodeObjectForKey("taxAmount") as? Int
        orderId = aDecoder.decodeObjectForKey("orderId") as? String
        card = aDecoder.decodeObjectForKey("card") as? CLVModels.Payments.GiftCard
        paymentIds = aDecoder.decodeObjectForKey("paymentIds") as? [String]
        ignorePayment = aDecoder.decodeObjectForKey("ignorePayment") as? Bool
        serviceChargeAmount = aDecoder.decodeObjectForKey("serviceChargeAmount") as? CLVModels.Payments.ServiceChargeAmount
        taxableAmountRates = aDecoder.decodeObjectForKey("taxableAmountRates") as? [CLVModels.Payments.TaxableAmountRate]
        lineItems = aDecoder.decodeObjectForKey("lineItems") as? [CLVModels.Payments.LineItemPayment]
        employeeId = aDecoder.decodeObjectForKey("employeeId") as? String
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        amount <- map["amount"]
        taxAmount <- map["taxAmount"]
        orderId <- map["orderId"]
        card <- map["card"]
        paymentIds <- map["paymentIds"]
        ignorePayment <- map["ignorePayment"]
        serviceChargeAmount <- map["serviceChargeAmount"]
        taxableAmountRates <- (map["taxableAmountRates"], CLVArrayTransform<CLVModels.Payments.TaxableAmountRate>())
        lineItems <- (map["lineItems"], CLVArrayTransform<CLVModels.Payments.LineItemPayment>())
        employeeId <- map["employeeId"]
      }
    }
    
    
    
    public class LineItemPayment: NSObject, NSCoding, Mappable {
      /// Unique identifier; TBD this is confusing because it's used as either line item id or payment id
      public var id: String?
      /// The line item with which the line item payment is associated
      public var lineItemRef: CLVModels.Order.LineItem?
      /// The payment with which the line item payment is associated
      public var paymentRef: CLVModels.Payments.Payment?
      /// Percent of this line item covered by this payment
      public var percentage: Int?
      /// Bin this line item payment was for
      public var binName: String?
      /// Payment has been refunded
      public var refunded: Bool?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(lineItemRef, forKey: "lineItemRef")
        aCoder.encodeObject(paymentRef, forKey: "paymentRef")
        aCoder.encodeObject(percentage, forKey: "percentage")
        aCoder.encodeObject(binName, forKey: "binName")
        aCoder.encodeObject(refunded, forKey: "refunded")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        lineItemRef = aDecoder.decodeObjectForKey("lineItemRef") as? CLVModels.Order.LineItem
        paymentRef = aDecoder.decodeObjectForKey("paymentRef") as? CLVModels.Payments.Payment
        percentage = aDecoder.decodeObjectForKey("percentage") as? Int
        binName = aDecoder.decodeObjectForKey("binName") as? String
        refunded = aDecoder.decodeObjectForKey("refunded") as? Bool
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        lineItemRef <- map["lineItemRef"]
        paymentRef <- map["paymentRef"]
        percentage <- map["percentage"]
        binName <- map["binName"]
        refunded <- map["refunded"]
      }
    }
    
    
    
    public class Payment: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      /// The order with which the payment is associated
      public var order: CLVModels.Order.Order?
      /// Device which processed the transaction for this payment
      public var device: CLVModels.Device.Device?
      /// The tender type associated with this payment, e.g. credit card, cash, etc.
      public var tender: CLVModels.Base.Tender?
      /// Total amount paid
      public var amount: Int?
      /// Amount paid in tips
      public var tipAmount: Int?
      /// Amount paid in tax
      public var taxAmount: Int?
      /// Amount given back in a cash back transaction
      public var cashbackAmount: Int?
      /// Amount of cash given by the customer
      public var cashTendered: Int?
      public var externalPaymentId: String?
      /// The employee who processed the payment
      public var employee: CLVModels.Employees.Employee?
      /// Time payment was recorded on server
      public var createdTime: NSDate?
      public var clientCreatedTime: NSDate?
      /// Last modified time of the payment
      public var modifiedTime: NSDate?
      public var offline: Bool?
      public var result: CLVModels.Payments.Result?
      /// Information about the card used for credit/debit card payments
      public var cardTransaction: CLVModels.Payments.CardTransaction?
      /// Amount record as a service charge
      public var serviceCharge: CLVModels.Payments.ServiceChargeAmount?
      public var taxRates: [CLVModels.Payments.PaymentTaxRate]?
      public var refunds: [CLVModels.Payments.Refund]?
      public var note: String?
      public var lineItemPayments: [CLVModels.Payments.LineItemPayment]?
      /// If voided, the reason why (when available)
      public var voidReason: CLVModels.Order.VoidReason?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(order, forKey: "order")
        aCoder.encodeObject(device, forKey: "device")
        aCoder.encodeObject(tender, forKey: "tender")
        aCoder.encodeObject(amount, forKey: "amount")
        aCoder.encodeObject(tipAmount, forKey: "tipAmount")
        aCoder.encodeObject(taxAmount, forKey: "taxAmount")
        aCoder.encodeObject(cashbackAmount, forKey: "cashbackAmount")
        aCoder.encodeObject(cashTendered, forKey: "cashTendered")
        aCoder.encodeObject(externalPaymentId, forKey: "externalPaymentId")
        aCoder.encodeObject(employee, forKey: "employee")
        aCoder.encodeObject(createdTime, forKey: "createdTime")
        aCoder.encodeObject(clientCreatedTime, forKey: "clientCreatedTime")
        aCoder.encodeObject(modifiedTime, forKey: "modifiedTime")
        aCoder.encodeObject(offline, forKey: "offline")
        aCoder.encodeObject(result?.rawValue, forKey: "result")
        aCoder.encodeObject(cardTransaction, forKey: "cardTransaction")
        aCoder.encodeObject(serviceCharge, forKey: "serviceCharge")
        aCoder.encodeObject(taxRates, forKey: "taxRates")
        aCoder.encodeObject(refunds, forKey: "refunds")
        aCoder.encodeObject(note, forKey: "note")
        aCoder.encodeObject(lineItemPayments, forKey: "lineItemPayments")
        aCoder.encodeObject(voidReason?.rawValue, forKey: "voidReason")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        order = aDecoder.decodeObjectForKey("order") as? CLVModels.Order.Order
        device = aDecoder.decodeObjectForKey("device") as? CLVModels.Device.Device
        tender = aDecoder.decodeObjectForKey("tender") as? CLVModels.Base.Tender
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        tipAmount = aDecoder.decodeObjectForKey("tipAmount") as? Int
        taxAmount = aDecoder.decodeObjectForKey("taxAmount") as? Int
        cashbackAmount = aDecoder.decodeObjectForKey("cashbackAmount") as? Int
        cashTendered = aDecoder.decodeObjectForKey("cashTendered") as? Int
        externalPaymentId = aDecoder.decodeObjectForKey("externalPaymentId") as? String
        employee = aDecoder.decodeObjectForKey("employee") as? CLVModels.Employees.Employee
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        clientCreatedTime = aDecoder.decodeObjectForKey("clientCreatedTime") as? NSDate
        modifiedTime = aDecoder.decodeObjectForKey("modifiedTime") as? NSDate
        offline = aDecoder.decodeObjectForKey("offline") as? Bool
        result = (aDecoder.decodeObjectForKey("result") as? String) != nil ?
          CLVModels.Payments.Result(rawValue: (aDecoder.decodeObjectForKey("result") as! String)) : nil
        cardTransaction = aDecoder.decodeObjectForKey("cardTransaction") as? CLVModels.Payments.CardTransaction
        serviceCharge = aDecoder.decodeObjectForKey("serviceCharge") as? CLVModels.Payments.ServiceChargeAmount
        taxRates = aDecoder.decodeObjectForKey("taxRates") as? [CLVModels.Payments.PaymentTaxRate]
        refunds = aDecoder.decodeObjectForKey("refunds") as? [CLVModels.Payments.Refund]
        note = aDecoder.decodeObjectForKey("note") as? String
        lineItemPayments = aDecoder.decodeObjectForKey("lineItemPayments") as? [CLVModels.Payments.LineItemPayment]
        voidReason = (aDecoder.decodeObjectForKey("voidReason") as? String) != nil ?
          CLVModels.Order.VoidReason(rawValue: (aDecoder.decodeObjectForKey("voidReason") as! String)) : nil
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        order <- map["order"]
        device <- map["device"]
        tender <- map["tender"]
        amount <- map["amount"]
        tipAmount <- map["tipAmount"]
        taxAmount <- map["taxAmount"]
        cashbackAmount <- map["cashbackAmount"]
        cashTendered <- map["cashTendered"]
        externalPaymentId <- map["externalPaymentId"]
        employee <- map["employee"]
        createdTime <- (map["createdTime"], CLVDateTransform())
        clientCreatedTime <- (map["clientCreatedTime"], CLVDateTransform())
        modifiedTime <- (map["modifiedTime"], CLVDateTransform())
        offline <- map["offline"]
        result <- map["result"]
        cardTransaction <- map["cardTransaction"]
        serviceCharge <- map["serviceCharge"]
        taxRates <- (map["taxRates"], CLVArrayTransform<CLVModels.Payments.PaymentTaxRate>())
        refunds <- (map["refunds"], CLVArrayTransform<CLVModels.Payments.Refund>())
        note <- map["note"]
        lineItemPayments <- (map["lineItemPayments"], CLVArrayTransform<CLVModels.Payments.LineItemPayment>())
        voidReason <- map["voidReason"]
      }
    }
    
    
    
    public class PaymentResponse: NSObject, NSCoding, Mappable {
      public var requestSuccessful: Bool?
      public var responseErrorMessage: String?
      public var payment: CLVModels.Payments.Payment?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(requestSuccessful, forKey: "requestSuccessful")
        aCoder.encodeObject(responseErrorMessage, forKey: "responseErrorMessage")
        aCoder.encodeObject(payment, forKey: "payment")
      }
      
      required public init(coder aDecoder: NSCoder) {
        requestSuccessful = aDecoder.decodeObjectForKey("requestSuccessful") as? Bool
        responseErrorMessage = aDecoder.decodeObjectForKey("responseErrorMessage") as? String
        payment = aDecoder.decodeObjectForKey("payment") as? CLVModels.Payments.Payment
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        requestSuccessful <- map["requestSuccessful"]
        responseErrorMessage <- map["responseErrorMessage"]
        payment <- map["payment"]
      }
    }
    
    
    
    public class PaymentTaxRate: NSObject, NSCoding, Mappable {
      public var id: String?
      /// The payment with which the payment tax rate is associated
      public var paymentRef: CLVModels.Payments.Payment?
      public var name: String?
      public var rate: Int?
      public var isDefault: Bool?
      public var taxableAmount: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(paymentRef, forKey: "paymentRef")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(rate, forKey: "rate")
        aCoder.encodeObject(isDefault, forKey: "isDefault")
        aCoder.encodeObject(taxableAmount, forKey: "taxableAmount")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        paymentRef = aDecoder.decodeObjectForKey("paymentRef") as? CLVModels.Payments.Payment
        name = aDecoder.decodeObjectForKey("name") as? String
        rate = aDecoder.decodeObjectForKey("rate") as? Int
        isDefault = aDecoder.decodeObjectForKey("isDefault") as? Bool
        taxableAmount = aDecoder.decodeObjectForKey("taxableAmount") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        paymentRef <- map["paymentRef"]
        name <- map["name"]
        rate <- map["rate"]
        isDefault <- map["isDefault"]
        taxableAmount <- map["taxableAmount"]
      }
    }
    
    
    
    public class Refund: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      /// The order with which the refund is associated
      public var orderRef: CLVModels.Order.Order?
      /// Device which processed the transaction for this refund
      public var device: CLVModels.Device.Device?
      /// Total amount refunded, including tax
      public var amount: Int?
      /// Tax amount refunded
      public var taxAmount: Int?
      /// The time when the refund was recorded on the server
      public var createdTime: NSDate?
      /// The time when the refund was recorded on the client
      public var clientCreatedTime: NSDate?
      /// The payment with which the refund is associated
      public var payment: CLVModels.Payments.Payment?
      public var employee: CLVModels.Employees.Employee?
      public var lineItems: [CLVModels.Order.LineItem]?
      /// The tender type associated with this payment, e.g. credit card, cash, etc.
      public var overrideMerchantTender: CLVModels.Base.Tender?
      public var taxableAmountRates: [CLVModels.Payments.TaxableAmountRate]?
      public var serviceChargeAmount: CLVModels.Payments.ServiceChargeAmount?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(orderRef, forKey: "orderRef")
        aCoder.encodeObject(device, forKey: "device")
        aCoder.encodeObject(amount, forKey: "amount")
        aCoder.encodeObject(taxAmount, forKey: "taxAmount")
        aCoder.encodeObject(createdTime, forKey: "createdTime")
        aCoder.encodeObject(clientCreatedTime, forKey: "clientCreatedTime")
        aCoder.encodeObject(payment, forKey: "payment")
        aCoder.encodeObject(employee, forKey: "employee")
        aCoder.encodeObject(lineItems, forKey: "lineItems")
        aCoder.encodeObject(overrideMerchantTender, forKey: "overrideMerchantTender")
        aCoder.encodeObject(taxableAmountRates, forKey: "taxableAmountRates")
        aCoder.encodeObject(serviceChargeAmount, forKey: "serviceChargeAmount")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        orderRef = aDecoder.decodeObjectForKey("orderRef") as? CLVModels.Order.Order
        device = aDecoder.decodeObjectForKey("device") as? CLVModels.Device.Device
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        taxAmount = aDecoder.decodeObjectForKey("taxAmount") as? Int
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        clientCreatedTime = aDecoder.decodeObjectForKey("clientCreatedTime") as? NSDate
        payment = aDecoder.decodeObjectForKey("payment") as? CLVModels.Payments.Payment
        employee = aDecoder.decodeObjectForKey("employee") as? CLVModels.Employees.Employee
        lineItems = aDecoder.decodeObjectForKey("lineItems") as? [CLVModels.Order.LineItem]
        overrideMerchantTender = aDecoder.decodeObjectForKey("overrideMerchantTender") as? CLVModels.Base.Tender
        taxableAmountRates = aDecoder.decodeObjectForKey("taxableAmountRates") as? [CLVModels.Payments.TaxableAmountRate]
        serviceChargeAmount = aDecoder.decodeObjectForKey("serviceChargeAmount") as? CLVModels.Payments.ServiceChargeAmount
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        orderRef <- map["orderRef"]
        device <- map["device"]
        amount <- map["amount"]
        taxAmount <- map["taxAmount"]
        createdTime <- (map["createdTime"], CLVDateTransform())
        clientCreatedTime <- (map["clientCreatedTime"], CLVDateTransform())
        payment <- map["payment"]
        employee <- map["employee"]
        lineItems <- (map["lineItems"], CLVArrayTransform<CLVModels.Order.LineItem>())
        overrideMerchantTender <- map["overrideMerchantTender"]
        taxableAmountRates <- (map["taxableAmountRates"], CLVArrayTransform<CLVModels.Payments.TaxableAmountRate>())
        serviceChargeAmount <- map["serviceChargeAmount"]
      }
    }
    
    
    
    public enum Result: String {
      case SUCCESS
      case FAIL
      case INITIATED
      case VOIDED
      case VOIDING
      case AUTH
    }
    
    
    
    public class ServerTotalStats: NSObject, NSCoding, Mappable {
      /// Employee corresponding to these stats
      public var employeeId: String?
      public var employeeName: String?
      public var sales: CLVModels.Payments.BatchTotalType?
      public var refunds: CLVModels.Payments.BatchTotalType?
      public var net: CLVModels.Payments.BatchTotalType?
      public var giftCardLoads: CLVModels.Payments.BatchTotalType?
      public var giftCardCashOuts: CLVModels.Payments.BatchTotalType?
      public var tax: CLVModels.Payments.BatchTotalType?
      public var tips: CLVModels.Payments.BatchTotalType?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(employeeId, forKey: "employeeId")
        aCoder.encodeObject(employeeName, forKey: "employeeName")
        aCoder.encodeObject(sales, forKey: "sales")
        aCoder.encodeObject(refunds, forKey: "refunds")
        aCoder.encodeObject(net, forKey: "net")
        aCoder.encodeObject(giftCardLoads, forKey: "giftCardLoads")
        aCoder.encodeObject(giftCardCashOuts, forKey: "giftCardCashOuts")
        aCoder.encodeObject(tax, forKey: "tax")
        aCoder.encodeObject(tips, forKey: "tips")
      }
      
      required public init(coder aDecoder: NSCoder) {
        employeeId = aDecoder.decodeObjectForKey("employeeId") as? String
        employeeName = aDecoder.decodeObjectForKey("employeeName") as? String
        sales = aDecoder.decodeObjectForKey("sales") as? CLVModels.Payments.BatchTotalType
        refunds = aDecoder.decodeObjectForKey("refunds") as? CLVModels.Payments.BatchTotalType
        net = aDecoder.decodeObjectForKey("net") as? CLVModels.Payments.BatchTotalType
        giftCardLoads = aDecoder.decodeObjectForKey("giftCardLoads") as? CLVModels.Payments.BatchTotalType
        giftCardCashOuts = aDecoder.decodeObjectForKey("giftCardCashOuts") as? CLVModels.Payments.BatchTotalType
        tax = aDecoder.decodeObjectForKey("tax") as? CLVModels.Payments.BatchTotalType
        tips = aDecoder.decodeObjectForKey("tips") as? CLVModels.Payments.BatchTotalType
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        employeeId <- map["employeeId"]
        employeeName <- map["employeeName"]
        sales <- map["sales"]
        refunds <- map["refunds"]
        net <- map["net"]
        giftCardLoads <- map["giftCardLoads"]
        giftCardCashOuts <- map["giftCardCashOuts"]
        tax <- map["tax"]
        tips <- map["tips"]
      }
    }
    
    
    
    public class ServiceChargeAmount: NSObject, NSCoding, Mappable {
      public var id: String?
      public var name: String?
      public var amount: Int?
      /// The payment with which the payment tax rate is associated
      public var paymentRef: CLVModels.Payments.Payment?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(amount, forKey: "amount")
        aCoder.encodeObject(paymentRef, forKey: "paymentRef")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        paymentRef = aDecoder.decodeObjectForKey("paymentRef") as? CLVModels.Payments.Payment
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        amount <- map["amount"]
        paymentRef <- map["paymentRef"]
      }
    }
    
    
    
    public class TaxableAmountRate: NSObject, NSCoding, Mappable {
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
    
    
    
    public class Transaction: NSObject, NSCoding, Mappable {
      /// The time when the transaction was recorded on the server
      public var createdTime: NSDate?
      /// The time when the transaction was recorded on the client
      public var clientCreatedTime: NSDate?
      public var payment: CLVModels.Payments.Payment?
      public var refund: CLVModels.Payments.Refund?
      public var credit: CLVModels.Payments.Credit?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(createdTime, forKey: "createdTime")
        aCoder.encodeObject(clientCreatedTime, forKey: "clientCreatedTime")
        aCoder.encodeObject(payment, forKey: "payment")
        aCoder.encodeObject(refund, forKey: "refund")
        aCoder.encodeObject(credit, forKey: "credit")
      }
      
      required public init(coder aDecoder: NSCoder) {
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        clientCreatedTime = aDecoder.decodeObjectForKey("clientCreatedTime") as? NSDate
        payment = aDecoder.decodeObjectForKey("payment") as? CLVModels.Payments.Payment
        refund = aDecoder.decodeObjectForKey("refund") as? CLVModels.Payments.Refund
        credit = aDecoder.decodeObjectForKey("credit") as? CLVModels.Payments.Credit
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        createdTime <- (map["createdTime"], CLVDateTransform())
        clientCreatedTime <- (map["clientCreatedTime"], CLVDateTransform())
        payment <- map["payment"]
        refund <- map["refund"]
        credit <- map["credit"]
      }
    }
    
    
    
    public enum TxType: String {
      case AUTH
      case PREAUTH
      case PREAUTHCAPTURE
      case ADJUST
      case VOID
      case VOIDRETURN
      case RETURN
      case REFUND
      case NAKEDREFUND
      case GETBALANCE
      case BATCHCLOSE
      case ACTIVATE
      case BALANCE_LOCK
      case LOAD
      case CASHOUT
      case CASHOUT_ACTIVE_STATUS
      case REDEMPTION
      case REDEMPTION_UNLOCK
      case RELOAD
    }
    
    
    
    public enum Type_: String {
      case TAB
      case AUTH
    }
    
  }
 }
