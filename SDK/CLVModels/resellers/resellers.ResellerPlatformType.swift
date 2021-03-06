/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */

extension CLVModels.Resellers {

    public enum ResellerPlatformType: Codable {
        case NORTH
        case OMAHA
        case SOUTH
        case PARSE_UNKNOWN(String)

        enum Key: CodingKey {
            case rawValue
        }

        public init(rawValue:String) {
            switch rawValue {
                case  "NORTH":
                    self = .NORTH
                case  "OMAHA":
                    self = .OMAHA
                case  "SOUTH":
                    self = .SOUTH
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
                case  .NORTH:
                    return "NORTH"
                case  .OMAHA:
                    return "OMAHA"
                case  .SOUTH:
                    return "SOUTH"
                case .PARSE_UNKNOWN(let rawValue):
                    return rawValue            
            }
        }
    }
}