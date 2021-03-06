/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Remotepay {

    public class VoidCreditResponse: Codable {

        /// Identifier for the request
        public var requestId: String?
        public var status: CLVModels.Remotepay.ResultStatus?
        /// The credit that was voided
        public var credit: CLVModels.Payments.Credit?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case requestId
            case status
            case credit
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.requestId = try rootContainer.decodeIfPresent(String.self, forKey: .requestId)
            } catch {
                decodeError.append(error)
            }
            do {
                self.status = try rootContainer.decodeIfPresent(CLVModels.Remotepay.ResultStatus.self, forKey: .status)
            } catch {
                decodeError.append(error)
            }
            do {
                self.credit = try rootContainer.decodeIfPresent(CLVModels.Payments.Credit.self, forKey: .credit)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (requestId != nil) { try container.encode(requestId, forKey: .requestId) }
            if (status != nil) { try container.encode(status, forKey: .status) }
            if (credit != nil) { try container.encode(credit, forKey: .credit) }
        }
    }

}