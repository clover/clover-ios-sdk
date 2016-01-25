 
import ObjectMapper

extension CLVModels {
public class Customers {

 
public class Address: NSObject, NSCoding, Mappable {
    public var id: String?
    public var address1: String?
    public var address2: String?
    public var address3: String?
    public var city: String?
    public var country: String?
    public var state: String?
    public var zip: String?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(address1, forKey: "address1")
  aCoder.encodeObject(address2, forKey: "address2")
  aCoder.encodeObject(address3, forKey: "address3")
  aCoder.encodeObject(city, forKey: "city")
  aCoder.encodeObject(country, forKey: "country")
  aCoder.encodeObject(state, forKey: "state")
  aCoder.encodeObject(zip, forKey: "zip")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        address1 = aDecoder.decodeObjectForKey("address1") as? String
        address2 = aDecoder.decodeObjectForKey("address2") as? String
        address3 = aDecoder.decodeObjectForKey("address3") as? String
        city = aDecoder.decodeObjectForKey("city") as? String
        country = aDecoder.decodeObjectForKey("country") as? String
        state = aDecoder.decodeObjectForKey("state") as? String
        zip = aDecoder.decodeObjectForKey("zip") as? String
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        address1 <- map["address1"]
        address2 <- map["address2"]
        address3 <- map["address3"]
        city <- map["city"]
        country <- map["country"]
        state <- map["state"]
        zip <- map["zip"]
  }
}


 
public class Customer: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// The order with which the customer is associated
    public var orderRef: CLVModels.Order.Order?
    /// First/given name of the customer
    public var firstName: String?
    /// Last name/surname of the customer
    public var lastName: String?
    public var marketingAllowed: Bool?
    public var customerSince: Int?
    public var orders: [CLVModels.Order.Order]?
    public var addresses: [CLVModels.Customers.Address]?
    public var emailAddresses: [CLVModels.Customers.EmailAddress]?
    public var phoneNumbers: [CLVModels.Customers.PhoneNumber]?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(orderRef, forKey: "orderRef")
  aCoder.encodeObject(firstName, forKey: "firstName")
  aCoder.encodeObject(lastName, forKey: "lastName")
  aCoder.encodeObject(marketingAllowed, forKey: "marketingAllowed")
  aCoder.encodeObject(customerSince, forKey: "customerSince")
  aCoder.encodeObject(orders, forKey: "orders")
  aCoder.encodeObject(addresses, forKey: "addresses")
  aCoder.encodeObject(emailAddresses, forKey: "emailAddresses")
  aCoder.encodeObject(phoneNumbers, forKey: "phoneNumbers")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        orderRef = aDecoder.decodeObjectForKey("orderRef") as? CLVModels.Order.Order
        firstName = aDecoder.decodeObjectForKey("firstName") as? String
        lastName = aDecoder.decodeObjectForKey("lastName") as? String
        marketingAllowed = aDecoder.decodeObjectForKey("marketingAllowed") as? Bool
        customerSince = aDecoder.decodeObjectForKey("customerSince") as? Int
        orders = aDecoder.decodeObjectForKey("orders") as? [CLVModels.Order.Order]
        addresses = aDecoder.decodeObjectForKey("addresses") as? [CLVModels.Customers.Address]
        emailAddresses = aDecoder.decodeObjectForKey("emailAddresses") as? [CLVModels.Customers.EmailAddress]
        phoneNumbers = aDecoder.decodeObjectForKey("phoneNumbers") as? [CLVModels.Customers.PhoneNumber]
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        orderRef <- map["orderRef"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        marketingAllowed <- map["marketingAllowed"]
        customerSince <- map["customerSince"]
        orders <- (map["orders"], CLVArrayTransform<CLVModels.Order.Order>())
        addresses <- (map["addresses"], CLVArrayTransform<CLVModels.Customers.Address>())
        emailAddresses <- (map["emailAddresses"], CLVArrayTransform<CLVModels.Customers.EmailAddress>())
        phoneNumbers <- (map["phoneNumbers"], CLVArrayTransform<CLVModels.Customers.PhoneNumber>())
  }
}


 
public class EmailAddress: NSObject, NSCoding, Mappable {
    public var id: String?
    public var emailAddress: String?
    public var verifiedTime: NSDate?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(emailAddress, forKey: "emailAddress")
  aCoder.encodeObject(verifiedTime, forKey: "verifiedTime")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        emailAddress = aDecoder.decodeObjectForKey("emailAddress") as? String
        verifiedTime = aDecoder.decodeObjectForKey("verifiedTime") as? NSDate
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        emailAddress <- map["emailAddress"]
        verifiedTime <- (map["verifiedTime"], CLVDateTransform())
  }
}


 
public class PhoneNumber: NSObject, NSCoding, Mappable {
    public var id: String?
    public var phoneNumber: String?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(phoneNumber, forKey: "phoneNumber")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        phoneNumber = aDecoder.decodeObjectForKey("phoneNumber") as? String
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        phoneNumber <- map["phoneNumber"]
  }
}

}
}
