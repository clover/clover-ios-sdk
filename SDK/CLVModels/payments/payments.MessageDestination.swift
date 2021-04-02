/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */

extension CLVModels.Payments {

    public enum MessageDestination: Codable {
        case CUSTOMER_DISPLAY
        case CUSTOMER_RECEIPT
        case CUSTOMER_RECEIPT_AID_PARAM
        case MERCHANT_DISPLAY
        case MERCHANT_RECEIPT
        case MERCHANT_RECEIPT_AID_PARAM
        case PARSE_UNKNOWN(String)

        enum Key: CodingKey {
            case rawValue
        }

        public init(rawValue:String) {
            switch rawValue {
                case  "CUSTOMER_DISPLAY":
                    self = .CUSTOMER_DISPLAY
                case  "CUSTOMER_RECEIPT":
                    self = .CUSTOMER_RECEIPT
                case  "CUSTOMER_RECEIPT_AID_PARAM":
                    self = .CUSTOMER_RECEIPT_AID_PARAM
                case  "MERCHANT_DISPLAY":
                    self = .MERCHANT_DISPLAY
                case  "MERCHANT_RECEIPT":
                    self = .MERCHANT_RECEIPT
                case  "MERCHANT_RECEIPT_AID_PARAM":
                    self = .MERCHANT_RECEIPT_AID_PARAM
                default:
                    self = .PARSE_UNKNOWN(rawValue)
            }
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            self.init(rawValue: rawValue)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(toString)
        }

        public var toString: String {
            switch self {
                case  .CUSTOMER_DISPLAY:
                    return "CUSTOMER_DISPLAY"
                case  .CUSTOMER_RECEIPT:
                    return "CUSTOMER_RECEIPT"
                case  .CUSTOMER_RECEIPT_AID_PARAM:
                    return "CUSTOMER_RECEIPT_AID_PARAM"
                case  .MERCHANT_DISPLAY:
                    return "MERCHANT_DISPLAY"
                case  .MERCHANT_RECEIPT:
                    return "MERCHANT_RECEIPT"
                case  .MERCHANT_RECEIPT_AID_PARAM:
                    return "MERCHANT_RECEIPT_AID_PARAM"
                case .PARSE_UNKNOWN(let rawValue):
                    return rawValue            
            }
        }
    }
}