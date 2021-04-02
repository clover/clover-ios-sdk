/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Order {

    public class LineItemTaxRates: Codable {

        /// The new tax rates to assign to the line item with the corresponding line item id.
        public var rates: [String:[CLVModels.Inventory.TaxRate]]?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case rates
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.rates = try rootContainer.decodeIfPresent([String:[CLVModels.Inventory.TaxRate]].self, forKey: .rates)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (rates != nil) { try container.encode(rates, forKey: .rates) }
        }
    }

}