/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Remotepay {

    public class ResponseCodeEnum: Codable {

        public var status: CLVModels.Remotepay.ResponseCode?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case status
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.status = try rootContainer.decodeIfPresent(CLVModels.Remotepay.ResponseCode.self, forKey: .status)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (status != nil) { try container.encode(status, forKey: .status) }
        }
    }

}