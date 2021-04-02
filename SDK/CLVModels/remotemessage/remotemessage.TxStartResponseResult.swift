/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */

extension CLVModels.Remotemessage {

    public enum TxStartResponseResult: Codable {
        case SUCCESS
        case ORDER_MODIFIED
        case ORDER_LOAD
        case DUPLICATE
        case FAIL
        case PARSE_UNKNOWN(String)

        enum Key: CodingKey {
            case rawValue
        }

        public init(rawValue:String) {
            switch rawValue {
                case  "SUCCESS":
                    self = .SUCCESS
                case  "ORDER_MODIFIED":
                    self = .ORDER_MODIFIED
                case  "ORDER_LOAD":
                    self = .ORDER_LOAD
                case  "DUPLICATE":
                    self = .DUPLICATE
                case  "FAIL":
                    self = .FAIL
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
                case  .SUCCESS:
                    return "SUCCESS"
                case  .ORDER_MODIFIED:
                    return "ORDER_MODIFIED"
                case  .ORDER_LOAD:
                    return "ORDER_LOAD"
                case  .DUPLICATE:
                    return "DUPLICATE"
                case  .FAIL:
                    return "FAIL"
                case .PARSE_UNKNOWN(let rawValue):
                    return rawValue            
            }
        }
    }
}