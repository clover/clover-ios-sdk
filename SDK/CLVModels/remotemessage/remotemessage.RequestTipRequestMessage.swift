/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Remotemessage {

    public class RequestTipRequestMessage: Codable {

        /// The superClass
        public var _meta_superclass: CLVModels.Remotemessage.Message?
        /// initialization for the type
        public var _meta_init_method: CLVModels.Remotemessage.Method?
        public var tipSuggestions: [CLVModels.Merchant.TipSuggestion]?
        public var tippableAmount: Int64?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case _meta_superclass
            case _meta_init_method
            case tipSuggestions
            case tippableAmount
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
            if (rootContainer.contains(.tipSuggestions)) {
                do {
                    let tipSuggestionsContainer = try rootContainer.nestedContainer(keyedBy: CLVModels.ElementsKey.self, forKey: .tipSuggestions)
                    self.tipSuggestions = try tipSuggestionsContainer.decodeIfPresent([CLVModels.Merchant.TipSuggestion].self, forKey: .elements)
                } catch {
                    decodeError.append(error)
                }
            }
            do {
                self.tippableAmount = try rootContainer.decodeIfPresent(Int64.self, forKey: .tippableAmount)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (_meta_superclass != nil) { try container.encode(_meta_superclass, forKey: ._meta_superclass) }
            if (_meta_init_method != nil) { try container.encode(_meta_init_method, forKey: ._meta_init_method) }
            if (tipSuggestions != nil) { try container.encode(tipSuggestions, forKey: .tipSuggestions) }
            if (tippableAmount != nil) { try container.encode(tippableAmount, forKey: .tippableAmount) }
        }
    }

}