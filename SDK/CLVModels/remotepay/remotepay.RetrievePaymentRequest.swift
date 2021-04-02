/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */

/*
    Request to retrieve a payment made to a specific device.
*/

import Foundation

extension CLVModels.Remotepay {

    public class RetrievePaymentRequest: Codable {

        /// The superClass
        public var _meta_superclass: CLVModels.Remotepay.BaseRequest?
        /// The externalPaymentId used when a payment was created
        public var externalPaymentId: String?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case _meta_superclass
            case externalPaymentId
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self._meta_superclass = try rootContainer.decodeIfPresent(CLVModels.Remotepay.BaseRequest.self, forKey: ._meta_superclass)
            } catch {
                decodeError.append(error)
            }
            do {
                self.externalPaymentId = try rootContainer.decodeIfPresent(String.self, forKey: .externalPaymentId)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (_meta_superclass != nil) { try container.encode(_meta_superclass, forKey: ._meta_superclass) }
            if (externalPaymentId != nil) { try container.encode(externalPaymentId, forKey: .externalPaymentId) }
        }
    }

}