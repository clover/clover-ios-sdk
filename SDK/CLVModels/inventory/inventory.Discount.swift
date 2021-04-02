/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Inventory {

    public class Discount: Codable {

        /// Unique identifier
        public var id: String?
        public var merchantRef: CLVModels.Base.Reference?
        /// Name of the discount
        public var name: String?
        /// Discount amount in fraction of currency unit (e.g. cents) based on currency fraction digits supported
        public var amount: CLVModels.Variant?
        /// Discount amount in percent
        public var percentage: CLVModels.Variant?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case id
            case merchantRef
            case name
            case amount
            case percentage
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.id = try rootContainer.decodeIfPresent(String.self, forKey: .id)
            } catch {
                decodeError.append(error)
            }
            do {
                self.merchantRef = try rootContainer.decodeIfPresent(CLVModels.Base.Reference.self, forKey: .merchantRef)
            } catch {
                decodeError.append(error)
            }
            do {
                self.name = try rootContainer.decodeIfPresent(String.self, forKey: .name)
            } catch {
                decodeError.append(error)
            }
            do {
                self.amount = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .amount)
            } catch {
                decodeError.append(error)
            }
            do {
                self.percentage = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .percentage)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (id != nil) { try container.encode(id, forKey: .id) }
            if (merchantRef != nil) { try container.encode(merchantRef, forKey: .merchantRef) }
            if (name != nil) { try container.encode(name, forKey: .name) }
            if (amount != nil) { try container.encode(amount, forKey: .amount) }
            if (percentage != nil) { try container.encode(percentage, forKey: .percentage) }
        }
    }

}