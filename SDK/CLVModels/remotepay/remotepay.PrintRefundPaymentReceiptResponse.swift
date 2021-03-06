/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Remotepay {

    public class PrintRefundPaymentReceiptResponse: Codable {

        /// The superClass
        public var _meta_superclass: CLVModels.Remotepay.BaseResponse?
        public var payment: CLVModels.Payments.Payment?
        public var refund: CLVModels.Payments.Refund?
        public var order: CLVModels.Order.Order?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case _meta_superclass
            case payment
            case refund
            case order
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self._meta_superclass = try rootContainer.decodeIfPresent(CLVModels.Remotepay.BaseResponse.self, forKey: ._meta_superclass)
            } catch {
                decodeError.append(error)
            }
            do {
                self.payment = try rootContainer.decodeIfPresent(CLVModels.Payments.Payment.self, forKey: .payment)
            } catch {
                decodeError.append(error)
            }
            do {
                self.refund = try rootContainer.decodeIfPresent(CLVModels.Payments.Refund.self, forKey: .refund)
            } catch {
                decodeError.append(error)
            }
            do {
                self.order = try rootContainer.decodeIfPresent(CLVModels.Order.Order.self, forKey: .order)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (_meta_superclass != nil) { try container.encode(_meta_superclass, forKey: ._meta_superclass) }
            if (payment != nil) { try container.encode(payment, forKey: .payment) }
            if (refund != nil) { try container.encode(refund, forKey: .refund) }
            if (order != nil) { try container.encode(order, forKey: .order) }
        }
    }

}