/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Ecomm {

    public class TaxRate: Codable {

        public var name: String?
        /// For percentage based discounts like sales tax
        public var rate: Int64?
        /// For a flat tax like recycling redemption fee, expressed as number of cents
        public var tax_amount: CLVModels.Variant?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case name
            case rate
            case tax_amount
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.name = try rootContainer.decodeIfPresent(String.self, forKey: .name)
            } catch {
                decodeError.append(error)
            }
            do {
                self.rate = try rootContainer.decodeIfPresent(Int64.self, forKey: .rate)
            } catch {
                decodeError.append(error)
            }
            do {
                self.tax_amount = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .tax_amount)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (name != nil) { try container.encode(name, forKey: .name) }
            if (rate != nil) { try container.encode(rate, forKey: .rate) }
            if (tax_amount != nil) { try container.encode(tax_amount, forKey: .tax_amount) }
        }
    }

}