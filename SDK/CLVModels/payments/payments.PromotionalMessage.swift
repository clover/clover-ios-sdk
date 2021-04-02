/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Payments {

    public class PromotionalMessage: Codable {

        public var message: String?
        public var showOnMerchantReceipt: Bool?
        public var showOnCustomerReceipt: Bool?
        public var showOnDisplay: Bool?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case message
            case showOnMerchantReceipt
            case showOnCustomerReceipt
            case showOnDisplay
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.message = try rootContainer.decodeIfPresent(String.self, forKey: .message)
            } catch {
                decodeError.append(error)
            }
            do {
                self.showOnMerchantReceipt = try rootContainer.decodeIfPresent(Bool.self, forKey: .showOnMerchantReceipt)
            } catch {
                decodeError.append(error)
            }
            do {
                self.showOnCustomerReceipt = try rootContainer.decodeIfPresent(Bool.self, forKey: .showOnCustomerReceipt)
            } catch {
                decodeError.append(error)
            }
            do {
                self.showOnDisplay = try rootContainer.decodeIfPresent(Bool.self, forKey: .showOnDisplay)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (message != nil) { try container.encode(message, forKey: .message) }
            if (showOnMerchantReceipt != nil) { try container.encode(showOnMerchantReceipt, forKey: .showOnMerchantReceipt) }
            if (showOnCustomerReceipt != nil) { try container.encode(showOnCustomerReceipt, forKey: .showOnCustomerReceipt) }
            if (showOnDisplay != nil) { try container.encode(showOnDisplay, forKey: .showOnDisplay) }
        }
    }

}