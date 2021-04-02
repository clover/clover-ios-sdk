/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Payments {

    public class PaymentAttribute: Codable {

        public var type_: String?
        public var value: String?
        /// The payment with which the payment attribute is associated
        public var paymentRef: CLVModels.Base.Reference?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case type
            case value
            case paymentRef
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.type_ = try rootContainer.decodeIfPresent(String.self, forKey: .type)
            } catch {
                decodeError.append(error)
            }
            do {
                self.value = try rootContainer.decodeIfPresent(String.self, forKey: .value)
            } catch {
                decodeError.append(error)
            }
            do {
                self.paymentRef = try rootContainer.decodeIfPresent(CLVModels.Base.Reference.self, forKey: .paymentRef)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (type_ != nil) { try container.encode(type_, forKey: .type) }
            if (value != nil) { try container.encode(value, forKey: .value) }
            if (paymentRef != nil) { try container.encode(paymentRef, forKey: .paymentRef) }
        }
    }

}