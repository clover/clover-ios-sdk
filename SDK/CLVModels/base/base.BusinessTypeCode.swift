/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */

extension CLVModels.Base {

    public enum BusinessTypeCode: Codable {
        case FULL_SERVICE_RESTAURANT
        case QUICK_SERVICE_RESTAURANT
        case COFFEE_SHOP
        case BAKERY
        case BAR
        case FOOD_TRUCK
        case FROZEN_YOGURT
        case PIZZA
        case DELI
        case OTHER_RESTAURANT
        case BOUTIQUE
        case CONVENIENCE_STORE
        case GROCERY
        case LIQUOR_STORE
        case VAPE_SHOP
        case JEWELRY
        case FLORIST
        case OTHER_RETAIL
        case FITNESS
        case SPA
        case HAIR_SALON
        case HOME_AND_REPAIR
        case PROFESSIONAL_SERVICES
        case CATERING
        case OTHER_SERVICE
        case PARSE_UNKNOWN(String)

        enum Key: CodingKey {
            case rawValue
        }

        public init(rawValue:String) {
            switch rawValue {
                case  "FULL_SERVICE_RESTAURANT":
                    self = .FULL_SERVICE_RESTAURANT
                case  "QUICK_SERVICE_RESTAURANT":
                    self = .QUICK_SERVICE_RESTAURANT
                case  "COFFEE_SHOP":
                    self = .COFFEE_SHOP
                case  "BAKERY":
                    self = .BAKERY
                case  "BAR":
                    self = .BAR
                case  "FOOD_TRUCK":
                    self = .FOOD_TRUCK
                case  "FROZEN_YOGURT":
                    self = .FROZEN_YOGURT
                case  "PIZZA":
                    self = .PIZZA
                case  "DELI":
                    self = .DELI
                case  "OTHER_RESTAURANT":
                    self = .OTHER_RESTAURANT
                case  "BOUTIQUE":
                    self = .BOUTIQUE
                case  "CONVENIENCE_STORE":
                    self = .CONVENIENCE_STORE
                case  "GROCERY":
                    self = .GROCERY
                case  "LIQUOR_STORE":
                    self = .LIQUOR_STORE
                case  "VAPE_SHOP":
                    self = .VAPE_SHOP
                case  "JEWELRY":
                    self = .JEWELRY
                case  "FLORIST":
                    self = .FLORIST
                case  "OTHER_RETAIL":
                    self = .OTHER_RETAIL
                case  "FITNESS":
                    self = .FITNESS
                case  "SPA":
                    self = .SPA
                case  "HAIR_SALON":
                    self = .HAIR_SALON
                case  "HOME_AND_REPAIR":
                    self = .HOME_AND_REPAIR
                case  "PROFESSIONAL_SERVICES":
                    self = .PROFESSIONAL_SERVICES
                case  "CATERING":
                    self = .CATERING
                case  "OTHER_SERVICE":
                    self = .OTHER_SERVICE
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
                case  .FULL_SERVICE_RESTAURANT:
                    return "FULL_SERVICE_RESTAURANT"
                case  .QUICK_SERVICE_RESTAURANT:
                    return "QUICK_SERVICE_RESTAURANT"
                case  .COFFEE_SHOP:
                    return "COFFEE_SHOP"
                case  .BAKERY:
                    return "BAKERY"
                case  .BAR:
                    return "BAR"
                case  .FOOD_TRUCK:
                    return "FOOD_TRUCK"
                case  .FROZEN_YOGURT:
                    return "FROZEN_YOGURT"
                case  .PIZZA:
                    return "PIZZA"
                case  .DELI:
                    return "DELI"
                case  .OTHER_RESTAURANT:
                    return "OTHER_RESTAURANT"
                case  .BOUTIQUE:
                    return "BOUTIQUE"
                case  .CONVENIENCE_STORE:
                    return "CONVENIENCE_STORE"
                case  .GROCERY:
                    return "GROCERY"
                case  .LIQUOR_STORE:
                    return "LIQUOR_STORE"
                case  .VAPE_SHOP:
                    return "VAPE_SHOP"
                case  .JEWELRY:
                    return "JEWELRY"
                case  .FLORIST:
                    return "FLORIST"
                case  .OTHER_RETAIL:
                    return "OTHER_RETAIL"
                case  .FITNESS:
                    return "FITNESS"
                case  .SPA:
                    return "SPA"
                case  .HAIR_SALON:
                    return "HAIR_SALON"
                case  .HOME_AND_REPAIR:
                    return "HOME_AND_REPAIR"
                case  .PROFESSIONAL_SERVICES:
                    return "PROFESSIONAL_SERVICES"
                case  .CATERING:
                    return "CATERING"
                case  .OTHER_SERVICE:
                    return "OTHER_SERVICE"
                case .PARSE_UNKNOWN(let rawValue):
                    return rawValue            
            }
        }
    }
}