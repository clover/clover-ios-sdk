/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Order {

    public class CreateLineItemsRequest: Codable {

        /// List of LineItem objects to create
        public var items: [CLVModels.Order.LineItem]?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case items
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            if (rootContainer.contains(.items)) {
                do {
                    let itemsContainer = try rootContainer.nestedContainer(keyedBy: CLVModels.ElementsKey.self, forKey: .items)
                    self.items = try itemsContainer.decodeIfPresent([CLVModels.Order.LineItem].self, forKey: .elements)
                } catch {
                    decodeError.append(error)
                }
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (items != nil) { try container.encode(items, forKey: .items) }
        }
    }

}