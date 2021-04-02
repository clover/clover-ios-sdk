/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Ecomm {

    public class OrderReturn: Codable {

        /// True if this list has another page of items after this one that can be fetched.
        public var has_more: CLVModels.Variant?
        /// The URL where this list can be accessed
        public var url: CLVModels.Variant?
        /// Order return data such as items returned
        public var data: CLVModels.Ecomm.OrderReturnData?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case has_more
            case url
            case data
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.has_more = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .has_more)
            } catch {
                decodeError.append(error)
            }
            do {
                self.url = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .url)
            } catch {
                decodeError.append(error)
            }
            do {
                self.data = try rootContainer.decodeIfPresent(CLVModels.Ecomm.OrderReturnData.self, forKey: .data)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (has_more != nil) { try container.encode(has_more, forKey: .has_more) }
            if (url != nil) { try container.encode(url, forKey: .url) }
            if (data != nil) { try container.encode(data, forKey: .data) }
        }
    }

}