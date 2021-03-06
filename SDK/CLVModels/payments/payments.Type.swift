/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */

extension CLVModels.Payments {

    public enum Type_: Codable {
        case TAB
        case AUTH
        case PARSE_UNKNOWN(String)

        enum Key: CodingKey {
            case rawValue
        }

        public init(rawValue:String) {
            switch rawValue {
                case  "TAB":
                    self = .TAB
                case  "AUTH":
                    self = .AUTH
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
                case  .TAB:
                    return "TAB"
                case  .AUTH:
                    return "AUTH"
                case .PARSE_UNKNOWN(let rawValue):
                    return rawValue            
            }
        }
    }
}