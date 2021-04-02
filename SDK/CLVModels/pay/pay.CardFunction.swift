/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */

extension CLVModels.Pay {

    public enum CardFunction: Codable {
        case CREDIT
        case DEBIT
        case PREPAID
        case PINLESS_DEBIT
        case SIGNATURE_DEBIT
        case EBT
        case SNAP
        case PARSE_UNKNOWN(String)

        enum Key: CodingKey {
            case rawValue
        }

        public init(rawValue:String) {
            switch rawValue {
                case  "CREDIT":
                    self = .CREDIT
                case  "DEBIT":
                    self = .DEBIT
                case  "PREPAID":
                    self = .PREPAID
                case  "PINLESS_DEBIT":
                    self = .PINLESS_DEBIT
                case  "SIGNATURE_DEBIT":
                    self = .SIGNATURE_DEBIT
                case  "EBT":
                    self = .EBT
                case  "SNAP":
                    self = .SNAP
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
                case  .CREDIT:
                    return "CREDIT"
                case  .DEBIT:
                    return "DEBIT"
                case  .PREPAID:
                    return "PREPAID"
                case  .PINLESS_DEBIT:
                    return "PINLESS_DEBIT"
                case  .SIGNATURE_DEBIT:
                    return "SIGNATURE_DEBIT"
                case  .EBT:
                    return "EBT"
                case  .SNAP:
                    return "SNAP"
                case .PARSE_UNKNOWN(let rawValue):
                    return rawValue            
            }
        }
    }
}