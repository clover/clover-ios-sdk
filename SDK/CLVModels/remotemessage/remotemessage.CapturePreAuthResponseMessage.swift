/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Remotemessage {

    public class CapturePreAuthResponseMessage: Codable {

        /// The superClass
        public var _meta_superclass: CLVModels.Remotemessage.Message?
        /// initialization for the type
        public var _meta_init_method: CLVModels.Remotemessage.Method?
        /// The status of the request.
        public var status: CLVModels.Remotemessage.ResultStatus?
        /// Detail message from the server.
        public var reason: String?
        public var message: String?
        /// Unique identifier for a payment
        public var paymentId: String?
        /// Total amount paid
        public var amount: Int64?
        /// Amount paid in tips
        public var tipAmount: CLVModels.Variant?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case _meta_superclass
            case _meta_init_method
            case status
            case reason
            case message
            case paymentId
            case amount
            case tipAmount
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self._meta_superclass = try rootContainer.decodeIfPresent(CLVModels.Remotemessage.Message.self, forKey: ._meta_superclass)
            } catch {
                decodeError.append(error)
            }
            do {
                self._meta_init_method = try rootContainer.decodeIfPresent(CLVModels.Remotemessage.Method.self, forKey: ._meta_init_method)
            } catch {
                decodeError.append(error)
            }
            do {
                self.status = try rootContainer.decodeIfPresent(CLVModels.Remotemessage.ResultStatus.self, forKey: .status)
            } catch {
                decodeError.append(error)
            }
            do {
                self.reason = try rootContainer.decodeIfPresent(String.self, forKey: .reason)
            } catch {
                decodeError.append(error)
            }
            do {
                self.message = try rootContainer.decodeIfPresent(String.self, forKey: .message)
            } catch {
                decodeError.append(error)
            }
            do {
                self.paymentId = try rootContainer.decodeIfPresent(String.self, forKey: .paymentId)
            } catch {
                decodeError.append(error)
            }
            do {
                self.amount = try rootContainer.decodeIfPresent(Int64.self, forKey: .amount)
            } catch {
                decodeError.append(error)
            }
            do {
                self.tipAmount = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .tipAmount)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (_meta_superclass != nil) { try container.encode(_meta_superclass, forKey: ._meta_superclass) }
            if (_meta_init_method != nil) { try container.encode(_meta_init_method, forKey: ._meta_init_method) }
            if (status != nil) { try container.encode(status, forKey: .status) }
            if (reason != nil) { try container.encode(reason, forKey: .reason) }
            if (message != nil) { try container.encode(message, forKey: .message) }
            if (paymentId != nil) { try container.encode(paymentId, forKey: .paymentId) }
            if (amount != nil) { try container.encode(amount, forKey: .amount) }
            if (tipAmount != nil) { try container.encode(tipAmount, forKey: .tipAmount) }
        }
    }

}