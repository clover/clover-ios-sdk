/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Order.operation {

    public class DiscountsAddedOperation: Codable {

        public var ids: [String]?
        public var orderId: String?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case ids
            case orderId
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            if (rootContainer.contains(.ids)) {
                do {
                    let idsContainer = try rootContainer.nestedContainer(keyedBy: CLVModels.ElementsKey.self, forKey: .ids)
                    self.ids = try idsContainer.decodeIfPresent([String].self, forKey: .elements)
                } catch {
                    decodeError.append(error)
                }
            }
            do {
                self.orderId = try rootContainer.decodeIfPresent(String.self, forKey: .orderId)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (ids != nil) { try container.encode(ids, forKey: .ids) }
            if (orderId != nil) { try container.encode(orderId, forKey: .orderId) }
        }
    }

}