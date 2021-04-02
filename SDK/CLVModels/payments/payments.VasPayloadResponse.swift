/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */

/*
    Response from the provider after receiving the payload
*/

import Foundation

extension CLVModels.Payments {

    public class VasPayloadResponse: Codable {

        public var responseType: CLVModels.Payments.VasPayloadResponseType?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case responseType
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.responseType = try rootContainer.decodeIfPresent(CLVModels.Payments.VasPayloadResponseType.self, forKey: .responseType)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (responseType != nil) { try container.encode(responseType, forKey: .responseType) }
        }
    }

}