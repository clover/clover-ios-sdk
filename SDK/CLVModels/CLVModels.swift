public class CLVModels {
    public class Account {}
    public class Apps {}
    public class Base {}
    public class Boarding {}
    public class Cash {}
    public class Customers {}
    public class Custom {}
    public class Developer {}
    public class Device {}
    public class Ecomm {}
    public class Employees {}
    public class Hours {}
    public class Inventory {}
    public class Loyalty {}
    public class Merchant {}
    public class Order {
        public class operation {}
    }
    public class Pay {}
    public class Payments {}
    public class Printer {}
    public class Remotemessage {}
    public class Remotepay {}
    public class Resellers {}
    public class Tables {}
    public class Tokens {}
    
    
    
    public enum ElementsKey:String, CodingKey {
        case elements
    }
    
    /// This Variant object attempts to decode a Variant object as recieved
    /// from a REST call into a known type, which is then stored as an
    /// Any as the internal representation.  In practical use,
    /// the Variant.object should be optionally downcast using the as?
    /// operator to ensure type safety and code stability.
    /// Example:
    ///    let variant = Variant(42)
    ///     ...
    ///    guard let intVal = variant as? Int32
    ///    print(intVal) // intVal is now a non-optional Int32 type object
    public class Variant:Codable {
        public var object:Any?
        
        public init(_ object:Any) {
            self.object = object
        }
        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.singleValueContainer()
            if let newObject = try? rootContainer.decode(String.self) {
                object = newObject as Any
                return
            }
            if let newObject = try? rootContainer.decode(Bool.self) {
                object = newObject as Any
                return
            }
            if let newObject = try? rootContainer.decode(Int32.self) {
                object = newObject as Any
                return
            }
            if let newObject = try? rootContainer.decode(Int64.self) {
                object = newObject as Any
                return
            }
            if let newObject = try? rootContainer.decode(Double.self) {
                object = newObject as Any
                return
            }
            if let newObject = try? rootContainer.decode(Base.Reference.self) {
                object = newObject as Any
                return
            }
            throw DecodeError.UnsupportedType(objectName: rootContainer.codingPath)
        }
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            if let newObject = object as? String {
                try container.encode(newObject)
                return
            }
            if let newObject = object as? Bool {
                try container.encode(newObject)
                return
            }
            if let newObject = object as? Int32 {
                try container.encode(newObject)
                return
            }
            if let newObject = object as? Int64 {
                try container.encode(newObject)
                return
            }
            if let newObject = object as? Double {
                try container.encode(newObject)
                return
            }
            if let newObject = object as? Base.Reference {
                try container.encode(newObject)
                return
            }
            throw EncodeError.UnsupportedType(objectName: container.codingPath)
        }
        public struct DecodeError:Error {
            public struct UnsupportedType:Error {
                var objectName:[CodingKey]
            }
        }
        public struct EncodeError:Error {
            public struct UnsupportedType:Error {
                var objectName:[CodingKey]
            }
        }
    }
}


