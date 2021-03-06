/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Resellers {

    public class BrandAsset: Codable {

        /// Unique identifier
        public var id: String?
        public var type_: String?
        public var filename: String?
        public var mimeType: String?
        public var url: String?
        public var reseller: CLVModels.Base.Reference?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case id
            case type
            case filename
            case mimeType
            case url
            case reseller
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.id = try rootContainer.decodeIfPresent(String.self, forKey: .id)
            } catch {
                decodeError.append(error)
            }
            do {
                self.type_ = try rootContainer.decodeIfPresent(String.self, forKey: .type)
            } catch {
                decodeError.append(error)
            }
            do {
                self.filename = try rootContainer.decodeIfPresent(String.self, forKey: .filename)
            } catch {
                decodeError.append(error)
            }
            do {
                self.mimeType = try rootContainer.decodeIfPresent(String.self, forKey: .mimeType)
            } catch {
                decodeError.append(error)
            }
            do {
                self.url = try rootContainer.decodeIfPresent(String.self, forKey: .url)
            } catch {
                decodeError.append(error)
            }
            do {
                self.reseller = try rootContainer.decodeIfPresent(CLVModels.Base.Reference.self, forKey: .reseller)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (id != nil) { try container.encode(id, forKey: .id) }
            if (type_ != nil) { try container.encode(type_, forKey: .type) }
            if (filename != nil) { try container.encode(filename, forKey: .filename) }
            if (mimeType != nil) { try container.encode(mimeType, forKey: .mimeType) }
            if (url != nil) { try container.encode(url, forKey: .url) }
            if (reseller != nil) { try container.encode(reseller, forKey: .reseller) }
        }
    }

}