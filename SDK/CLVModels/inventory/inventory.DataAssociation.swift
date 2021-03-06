/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Inventory {

    public class DataAssociation: Codable {

        /// The primary object in an association, e.g., 'Item' in an 'Item - Tax Rate' association
        public var primary: CLVModels.Base.Reference?
        /// The secondary object in an association, e.g., 'Tax Rate' in an 'Item - Tax Rate' association
        public var secondary: CLVModels.Base.Reference?
        /// Serialized data related to the propagation, e.g. an update map.
        public var payload: String?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case primary
            case secondary
            case payload
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.primary = try rootContainer.decodeIfPresent(CLVModels.Base.Reference.self, forKey: .primary)
            } catch {
                decodeError.append(error)
            }
            do {
                self.secondary = try rootContainer.decodeIfPresent(CLVModels.Base.Reference.self, forKey: .secondary)
            } catch {
                decodeError.append(error)
            }
            do {
                self.payload = try rootContainer.decodeIfPresent(String.self, forKey: .payload)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (primary != nil) { try container.encode(primary, forKey: .primary) }
            if (secondary != nil) { try container.encode(secondary, forKey: .secondary) }
            if (payload != nil) { try container.encode(payload, forKey: .payload) }
        }
    }

}