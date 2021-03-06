/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */

extension CLVModels.Remotemessage {

    public enum UiDirection: Codable {
        case ENTER
        case EXIT
        case PARSE_UNKNOWN(String)

        enum Key: CodingKey {
            case rawValue
        }

        public init(rawValue:String) {
            switch rawValue {
                case  "ENTER":
                    self = .ENTER
                case  "EXIT":
                    self = .EXIT
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
                case  .ENTER:
                    return "ENTER"
                case  .EXIT:
                    return "EXIT"
                case .PARSE_UNKNOWN(let rawValue):
                    return rawValue            
            }
        }
    }
}