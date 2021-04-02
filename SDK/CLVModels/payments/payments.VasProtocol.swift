/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */

/*
    Protocol identifier
*/
extension CLVModels.Payments {

    public enum VasProtocol: Codable {
        case ST
        case PK
        case PARSE_UNKNOWN(String)

        enum Key: CodingKey {
            case rawValue
        }

        public init(rawValue:String) {
            switch rawValue {
                case  "ST":
                    self = .ST
                case  "PK":
                    self = .PK
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
                case  .ST:
                    return "ST"
                case  .PK:
                    return "PK"
                case .PARSE_UNKNOWN(let rawValue):
                    return rawValue            
            }
        }
    }
}