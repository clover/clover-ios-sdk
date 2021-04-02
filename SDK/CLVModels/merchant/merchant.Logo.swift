/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Merchant {

    public class Logo: Codable {

        /// The type of merchant logo
        public var logoType: CLVModels.Merchant.LogoType?
        /// The filename of the logo
        public var logoFilename: String?
        /// URL of the logo file. Generated from filename.
        public var url: String?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case logoType
            case logoFilename
            case url
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.logoType = try rootContainer.decodeIfPresent(CLVModels.Merchant.LogoType.self, forKey: .logoType)
            } catch {
                decodeError.append(error)
            }
            do {
                self.logoFilename = try rootContainer.decodeIfPresent(String.self, forKey: .logoFilename)
            } catch {
                decodeError.append(error)
            }
            do {
                self.url = try rootContainer.decodeIfPresent(String.self, forKey: .url)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (logoType != nil) { try container.encode(logoType, forKey: .logoType) }
            if (logoFilename != nil) { try container.encode(logoFilename, forKey: .logoFilename) }
            if (url != nil) { try container.encode(url, forKey: .url) }
        }
    }

}