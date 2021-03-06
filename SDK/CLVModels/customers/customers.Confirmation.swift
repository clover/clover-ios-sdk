/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Customers {

    public class Confirmation: Codable {

        /// Order UUID could be passed in if confirmation is related to a transaction
        public var order: CLVModels.Variant?
        /// Customer associated with the confirmation
        public var customer: CLVModels.Variant?
        /// New Card that is being confirmed
        public var card: CLVModels.Variant?
        /// Email address to send confirmation to
        public var emailAddress: CLVModels.Variant?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case order
            case customer
            case card
            case emailAddress
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.order = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .order)
            } catch {
                decodeError.append(error)
            }
            do {
                self.customer = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .customer)
            } catch {
                decodeError.append(error)
            }
            do {
                self.card = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .card)
            } catch {
                decodeError.append(error)
            }
            do {
                self.emailAddress = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .emailAddress)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (order != nil) { try container.encode(order, forKey: .order) }
            if (customer != nil) { try container.encode(customer, forKey: .customer) }
            if (card != nil) { try container.encode(card, forKey: .card) }
            if (emailAddress != nil) { try container.encode(emailAddress, forKey: .emailAddress) }
        }
    }

}