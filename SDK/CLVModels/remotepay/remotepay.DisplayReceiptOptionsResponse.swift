/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Remotepay {

    public class DisplayReceiptOptionsResponse: Codable {

        /// The superClass
        public var _meta_superclass: CLVModels.Remotepay.BaseResponse?
        /// The status of the request.
        public var resultStatus: CLVModels.Remotepay.ResultStatus?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case _meta_superclass
            case resultStatus
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
                self.resultStatus = try rootContainer.decodeIfPresent(CLVModels.Remotepay.ResultStatus.self, forKey: .resultStatus)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (_meta_superclass != nil) { try container.encode(_meta_superclass, forKey: ._meta_superclass) }
            if (resultStatus != nil) { try container.encode(resultStatus, forKey: .resultStatus) }
        }
    }

}