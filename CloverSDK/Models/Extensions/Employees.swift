 
import ObjectMapper

extension CLVModels {
public class Employees {

 
public enum AccountRole: String {
  case ADMIN
  case MANAGER
  case EMPLOYEE
}


 
public class Employee: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// Full name of the employee
    public var name: String?
    /// Nickname of the employee (shows up on receipts)
    public var nickname: String?
    /// Custom ID of the employee
    public var customId: String?
    /// Email of the employee (optional)
    public var email: String?
    /// Returns true if this employee was sent an invite to activate their account
    public var inviteSent: Bool?
    /// Timestamp of when this employee claimed their account
    public var claimedTime: NSDate?
    /// Timestamp of when this employee was deleted
    public var deletedTime: NSDate?
    /// Employee PIN (hashed)
    public var pin: String?
    /// Employee PIN
    public var unhashedPin: String?
    /// Employee System Role
    public var role: CLVModels.Employees.AccountRole?
    public var roles: [CLVModels.Employees.Role]?
    /// Returns true if this employee is the owner account for this merchant
    public var isOwner: Bool?
    /// This employee's shifts
    public var shifts: [CLVModels.Employees.Shift]?
    /// This employee's payments
    public var payments: [CLVModels.Payments.Payment]?
    /// This employee's orders
    public var orders: [CLVModels.Order.Order]?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(nickname, forKey: "nickname")
  aCoder.encodeObject(customId, forKey: "customId")
  aCoder.encodeObject(email, forKey: "email")
  aCoder.encodeObject(inviteSent, forKey: "inviteSent")
  aCoder.encodeObject(claimedTime, forKey: "claimedTime")
  aCoder.encodeObject(deletedTime, forKey: "deletedTime")
  aCoder.encodeObject(pin, forKey: "pin")
  aCoder.encodeObject(unhashedPin, forKey: "unhashedPin")
  aCoder.encodeObject(role?.rawValue, forKey: "role")
  aCoder.encodeObject(roles, forKey: "roles")
  aCoder.encodeObject(isOwner, forKey: "isOwner")
  aCoder.encodeObject(shifts, forKey: "shifts")
  aCoder.encodeObject(payments, forKey: "payments")
  aCoder.encodeObject(orders, forKey: "orders")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        nickname = aDecoder.decodeObjectForKey("nickname") as? String
        customId = aDecoder.decodeObjectForKey("customId") as? String
        email = aDecoder.decodeObjectForKey("email") as? String
        inviteSent = aDecoder.decodeObjectForKey("inviteSent") as? Bool
        claimedTime = aDecoder.decodeObjectForKey("claimedTime") as? NSDate
        deletedTime = aDecoder.decodeObjectForKey("deletedTime") as? NSDate
        pin = aDecoder.decodeObjectForKey("pin") as? String
        unhashedPin = aDecoder.decodeObjectForKey("unhashedPin") as? String
        role = (aDecoder.decodeObjectForKey("role") as? String) != nil ?
      CLVModels.Employees.AccountRole(rawValue: (aDecoder.decodeObjectForKey("role") as! String)) : nil
        roles = aDecoder.decodeObjectForKey("roles") as? [CLVModels.Employees.Role]
        isOwner = aDecoder.decodeObjectForKey("isOwner") as? Bool
        shifts = aDecoder.decodeObjectForKey("shifts") as? [CLVModels.Employees.Shift]
        payments = aDecoder.decodeObjectForKey("payments") as? [CLVModels.Payments.Payment]
        orders = aDecoder.decodeObjectForKey("orders") as? [CLVModels.Order.Order]
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        nickname <- map["nickname"]
        customId <- map["customId"]
        email <- map["email"]
        inviteSent <- map["inviteSent"]
        claimedTime <- (map["claimedTime"], CLVDateTransform())
        deletedTime <- (map["deletedTime"], CLVDateTransform())
        pin <- map["pin"]
        unhashedPin <- map["unhashedPin"]
        role <- map["role"]
        roles <- (map["roles"], CLVArrayTransform<CLVModels.Employees.Role>())
        isOwner <- map["isOwner"]
        shifts <- (map["shifts"], CLVArrayTransform<CLVModels.Employees.Shift>())
        payments <- (map["payments"], CLVArrayTransform<CLVModels.Payments.Payment>())
        orders <- (map["orders"], CLVArrayTransform<CLVModels.Order.Order>())
  }
}


 
public enum Permission: String {
  case ORDERS_R
  case ORDERS_W
  case INVENTORY_R
  case INVENTORY_W
  case PAYMENTS_R
  case PAYMENTS_W
  case CUSTOMERS_R
  case CUSTOMERS_W
  case EMPLOYEES_R
  case EMPLOYEES_W
  case MERCHANT_R
  case MERCHANT_W
}


 
public class Permissions: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// A bitmap representing the permissions
    public var bits: Int?
    /// A readable list of permissions
    public var readablePermissions: [CLVModels.Employees.Permission]?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(bits, forKey: "bits")
//  aCoder.encodeObject(readablePermissions, forKey: "readablePermissions")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        bits = aDecoder.decodeObjectForKey("bits") as? Int
        readablePermissions = aDecoder.decodeObjectForKey("readablePermissions") as? [CLVModels.Employees.Permission]
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        bits <- map["bits"]
//        readablePermissions <- (map["readablePermissions"], CLVArrayTransform<CLVModels.Employees.Permission>())
  }
}


 
public class PermissionSet: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// Key of the permissionSet
    public var name: String?
    /// Label of the permissionSet
    public var label: String?
    public var app: CLVModels.Apps.App?
    public var employeeDefault: Bool?
    public var managerDefault: Bool?
    /// Bitmap of permissions
    public var permissions: CLVModels.Employees.Permissions?
    /// roles enabled for this merchant
    public var roles: [CLVModels.Employees.Role]?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(label, forKey: "label")
  aCoder.encodeObject(app, forKey: "app")
  aCoder.encodeObject(employeeDefault, forKey: "employeeDefault")
  aCoder.encodeObject(managerDefault, forKey: "managerDefault")
  aCoder.encodeObject(permissions, forKey: "permissions")
  aCoder.encodeObject(roles, forKey: "roles")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        label = aDecoder.decodeObjectForKey("label") as? String
        app = aDecoder.decodeObjectForKey("app") as? CLVModels.Apps.App
        employeeDefault = aDecoder.decodeObjectForKey("employeeDefault") as? Bool
        managerDefault = aDecoder.decodeObjectForKey("managerDefault") as? Bool
        permissions = aDecoder.decodeObjectForKey("permissions") as? CLVModels.Employees.Permissions
        roles = aDecoder.decodeObjectForKey("roles") as? [CLVModels.Employees.Role]
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        label <- map["label"]
        app <- map["app"]
        employeeDefault <- map["employeeDefault"]
        managerDefault <- map["managerDefault"]
        permissions <- map["permissions"]
        roles <- (map["roles"], CLVArrayTransform<CLVModels.Employees.Role>())
  }
}


 
public class PermissionSetRole: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// The role
    public var role: CLVModels.Employees.Role?
    /// The role
    public var permissionSet: CLVModels.Employees.PermissionSet?
    public var modified_time: Int?
    public var deleted_time: Int?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(role, forKey: "role")
  aCoder.encodeObject(permissionSet, forKey: "permissionSet")
  aCoder.encodeObject(modified_time, forKey: "modified_time")
  aCoder.encodeObject(deleted_time, forKey: "deleted_time")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        role = aDecoder.decodeObjectForKey("role") as? CLVModels.Employees.Role
        permissionSet = aDecoder.decodeObjectForKey("permissionSet") as? CLVModels.Employees.PermissionSet
        modified_time = aDecoder.decodeObjectForKey("modified_time") as? Int
        deleted_time = aDecoder.decodeObjectForKey("deleted_time") as? Int
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        role <- map["role"]
        permissionSet <- map["permissionSet"]
        modified_time <- map["modified_time"]
        deleted_time <- map["deleted_time"]
  }
}


 
public class Role: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// Full name of the role
    public var name: String?
    /// Base System Role
    public var systemRole: CLVModels.Employees.AccountRole?
    /// employees with this role
    public var employeesRef: [CLVModels.Employees.Employee]?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(systemRole?.rawValue, forKey: "systemRole")
  aCoder.encodeObject(employeesRef, forKey: "employeesRef")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        systemRole = (aDecoder.decodeObjectForKey("systemRole") as? String) != nil ?
      CLVModels.Employees.AccountRole(rawValue: (aDecoder.decodeObjectForKey("systemRole") as! String)) : nil
        employeesRef = aDecoder.decodeObjectForKey("employeesRef") as? [CLVModels.Employees.Employee]
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        systemRole <- map["systemRole"]
        employeesRef <- (map["employeesRef"], CLVArrayTransform<CLVModels.Employees.Employee>())
  }
}


 
public class Shift: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// The employee that worked this shift
    public var employee: CLVModels.Employees.Employee?
    /// Amount of cash tips collected
    public var cashTipsCollected: Int?
    /// Whether the employee used server banking
    public var serverBanking: Bool?
    /// Clock in time
    public var inTime: NSDate?
    /// Overridden clock in time
    public var overrideInTime: NSDate?
    /// The employee who overrode the clock in time
    public var overrideInEmployee: CLVModels.Employees.Employee?
    /// Clock out time
    public var outTime: NSDate?
    /// Overridden clock out time
    public var overrideOutTime: NSDate?
    /// The employee who overrode the clock out time
    public var overrideOutEmployee: CLVModels.Employees.Employee?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(employee, forKey: "employee")
  aCoder.encodeObject(cashTipsCollected, forKey: "cashTipsCollected")
  aCoder.encodeObject(serverBanking, forKey: "serverBanking")
  aCoder.encodeObject(inTime, forKey: "inTime")
  aCoder.encodeObject(overrideInTime, forKey: "overrideInTime")
  aCoder.encodeObject(overrideInEmployee, forKey: "overrideInEmployee")
  aCoder.encodeObject(outTime, forKey: "outTime")
  aCoder.encodeObject(overrideOutTime, forKey: "overrideOutTime")
  aCoder.encodeObject(overrideOutEmployee, forKey: "overrideOutEmployee")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        employee = aDecoder.decodeObjectForKey("employee") as? CLVModels.Employees.Employee
        cashTipsCollected = aDecoder.decodeObjectForKey("cashTipsCollected") as? Int
        serverBanking = aDecoder.decodeObjectForKey("serverBanking") as? Bool
        inTime = aDecoder.decodeObjectForKey("inTime") as? NSDate
        overrideInTime = aDecoder.decodeObjectForKey("overrideInTime") as? NSDate
        overrideInEmployee = aDecoder.decodeObjectForKey("overrideInEmployee") as? CLVModels.Employees.Employee
        outTime = aDecoder.decodeObjectForKey("outTime") as? NSDate
        overrideOutTime = aDecoder.decodeObjectForKey("overrideOutTime") as? NSDate
        overrideOutEmployee = aDecoder.decodeObjectForKey("overrideOutEmployee") as? CLVModels.Employees.Employee
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        employee <- map["employee"]
        cashTipsCollected <- map["cashTipsCollected"]
        serverBanking <- map["serverBanking"]
        inTime <- (map["inTime"], CLVDateTransform())
        overrideInTime <- (map["overrideInTime"], CLVDateTransform())
        overrideInEmployee <- map["overrideInEmployee"]
        outTime <- (map["outTime"], CLVDateTransform())
        overrideOutTime <- (map["overrideOutTime"], CLVDateTransform())
        overrideOutEmployee <- map["overrideOutEmployee"]
  }
}

}
}
