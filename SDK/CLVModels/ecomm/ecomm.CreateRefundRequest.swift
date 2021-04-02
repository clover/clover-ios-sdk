/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Ecomm {

    public class CreateRefundRequest: Codable {

        /// The identifier of the charge to refund.
        public var charge: String?
        /// A positive integer in cents representing how much of this charge to refund. Can refund only up to the remaining, unrefunded amount of the charge. If no amount is provided in request default is total amount of charge
        public var amount: CLVModels.Variant?
        /// String indicating the reason for the refund. If set, possible values are duplicate, fraudulent, and requested_by_customer. If you believe the charge to be fraudulent, specifying fraudulent as the reason will add the associated card and email to your blocklists, and will also help us improve our fraud detection algorithms.
        public var reason: CLVModels.Ecomm.RefundReason?
        /// An id such as an Invoice PO number that can be passed to the merchant's gateway, and ultimately appear in settlement records.
        public var external_reference_id: String?
        /// A positive integer in cents representing how much of tip amount to refund. Can refund only up to the remaining, unrefunded tip amount of the charge.
        public var tip_amount: CLVModels.Variant?
        /// A positive integer in cents representing how much of tax amount to refund. Can refund only up to the remaining, unrefunded tax amount of the charge.
        public var tax_amount: CLVModels.Variant?
        /// A positive integer in cents representing how much of convenience fee to refund. Can refund only up to the remaining, unrefunded convenience fee amount of the charge.
        public var convenience_fee: CLVModels.Variant?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case charge
            case amount
            case reason
            case external_reference_id
            case tip_amount
            case tax_amount
            case convenience_fee
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.charge = try rootContainer.decodeIfPresent(String.self, forKey: .charge)
            } catch {
                decodeError.append(error)
            }
            do {
                self.amount = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .amount)
            } catch {
                decodeError.append(error)
            }
            do {
                self.reason = try rootContainer.decodeIfPresent(CLVModels.Ecomm.RefundReason.self, forKey: .reason)
            } catch {
                decodeError.append(error)
            }
            do {
                self.external_reference_id = try rootContainer.decodeIfPresent(String.self, forKey: .external_reference_id)
            } catch {
                decodeError.append(error)
            }
            do {
                self.tip_amount = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .tip_amount)
            } catch {
                decodeError.append(error)
            }
            do {
                self.tax_amount = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .tax_amount)
            } catch {
                decodeError.append(error)
            }
            do {
                self.convenience_fee = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .convenience_fee)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (charge != nil) { try container.encode(charge, forKey: .charge) }
            if (amount != nil) { try container.encode(amount, forKey: .amount) }
            if (reason != nil) { try container.encode(reason, forKey: .reason) }
            if (external_reference_id != nil) { try container.encode(external_reference_id, forKey: .external_reference_id) }
            if (tip_amount != nil) { try container.encode(tip_amount, forKey: .tip_amount) }
            if (tax_amount != nil) { try container.encode(tax_amount, forKey: .tax_amount) }
            if (convenience_fee != nil) { try container.encode(convenience_fee, forKey: .convenience_fee) }
        }
    }

}