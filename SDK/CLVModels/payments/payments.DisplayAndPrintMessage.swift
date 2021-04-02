/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Payments {

    public class DisplayAndPrintMessage: Codable {

        /// Destination for the message CDSP - CustomerDisplay, CRCP - CustomerReceipt/AidParam, MDSP - MerchantDisplay, MRCP - MerchantReceipt/AidParam
        public var destination: CLVModels.Payments.MessageDestination?
        /// Contains the display and/or print message text from gateway
        public var content: String?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case destination
            case content
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.destination = try rootContainer.decodeIfPresent(CLVModels.Payments.MessageDestination.self, forKey: .destination)
            } catch {
                decodeError.append(error)
            }
            do {
                self.content = try rootContainer.decodeIfPresent(String.self, forKey: .content)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (destination != nil) { try container.encode(destination, forKey: .destination) }
            if (content != nil) { try container.encode(content, forKey: .content) }
        }
    }

}