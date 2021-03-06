/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Remotepay {

    public class CardInfoResponse: Codable {

        /// The superClass
        public var _meta_superclass: CLVModels.Remotepay.BaseResponse?
        /// The card that was vaulted.
        public var card: CLVModels.Payments.VaultedCard?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case _meta_superclass
            case card
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
                self.card = try rootContainer.decodeIfPresent(CLVModels.Payments.VaultedCard.self, forKey: .card)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (_meta_superclass != nil) { try container.encode(_meta_superclass, forKey: ._meta_superclass) }
            if (card != nil) { try container.encode(card, forKey: .card) }
        }
    }

}