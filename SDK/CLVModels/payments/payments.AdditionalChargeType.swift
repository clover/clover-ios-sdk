/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */

/*
    Type of additional charge. INTERAC is deprecated, use INTERAC_V2
*/
extension CLVModels.Payments {

    public enum AdditionalChargeType: Codable {
        case INTERAC
        case CREDIT_SURCHARGE
        case CONVENIENCE_FEE
        case INTERAC_V2
        case PARSE_UNKNOWN(String)

        enum Key: CodingKey {
            case rawValue
        }

        public init(rawValue:String) {
            switch rawValue {
                case  "INTERAC":
                    self = .INTERAC
                case  "CREDIT_SURCHARGE":
                    self = .CREDIT_SURCHARGE
                case  "CONVENIENCE_FEE":
                    self = .CONVENIENCE_FEE
                case  "INTERAC_V2":
                    self = .INTERAC_V2
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
                case  .INTERAC:
                    return "INTERAC"
                case  .CREDIT_SURCHARGE:
                    return "CREDIT_SURCHARGE"
                case  .CONVENIENCE_FEE:
                    return "CONVENIENCE_FEE"
                case  .INTERAC_V2:
                    return "INTERAC_V2"
                case .PARSE_UNKNOWN(let rawValue):
                    return rawValue            
            }
        }
    }
}