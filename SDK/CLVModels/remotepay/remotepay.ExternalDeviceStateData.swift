/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Remotepay {

    public class ExternalDeviceStateData: Codable {

        /// External Payment Id, if applicable
        public var externalPaymentId: String?
        /// Custom Activity Id, if applicable
        public var customActivityId: String?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case externalPaymentId
            case customActivityId
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.externalPaymentId = try rootContainer.decodeIfPresent(String.self, forKey: .externalPaymentId)
            } catch {
                decodeError.append(error)
            }
            do {
                self.customActivityId = try rootContainer.decodeIfPresent(String.self, forKey: .customActivityId)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (externalPaymentId != nil) { try container.encode(externalPaymentId, forKey: .externalPaymentId) }
            if (customActivityId != nil) { try container.encode(customActivityId, forKey: .customActivityId) }
        }
    }

}