/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */

extension CLVModels.Payments {

    public enum CardlessPaymentNetwork: Codable {
        case ALIPAY
        case WECHAT
        case PAYPAL
        case VENMO
        case PARSE_UNKNOWN(String)

        enum Key: CodingKey {
            case rawValue
        }

        public init(rawValue:String) {
            switch rawValue {
                case  "ALIPAY":
                    self = .ALIPAY
                case  "WECHAT":
                    self = .WECHAT
                case  "PAYPAL":
                    self = .PAYPAL
                case  "VENMO":
                    self = .VENMO
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
                case  .ALIPAY:
                    return "ALIPAY"
                case  .WECHAT:
                    return "WECHAT"
                case  .PAYPAL:
                    return "PAYPAL"
                case  .VENMO:
                    return "VENMO"
                case .PARSE_UNKNOWN(let rawValue):
                    return rawValue            
            }
        }
    }
}