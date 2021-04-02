/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Remotepay {

    public class VaultCardRequest: Codable {

        /// The superClass
        public var _meta_superclass: CLVModels.Remotepay.BaseRequest?
        /// Allowed entry methods
        public var cardEntryMethods: CLVModels.Variant?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case _meta_superclass
            case cardEntryMethods
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
                self.cardEntryMethods = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .cardEntryMethods)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (_meta_superclass != nil) { try container.encode(_meta_superclass, forKey: ._meta_superclass) }
            if (cardEntryMethods != nil) { try container.encode(cardEntryMethods, forKey: .cardEntryMethods) }
        }
    }

}