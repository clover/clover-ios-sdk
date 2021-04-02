/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Merchant {

    public class Compliance: Codable {

        /// Unique identifier
        public var id: String?
        /// UUID of the merchant
        public var merchantUuid: String?
        /// The type of compliance
        public var type_: CLVModels.Merchant.MerchantComplianceType?
        /// If this compliance is enabled or disabled for this merchant
        public var enabled: Bool?
        /// The source of compliance
        public var source: CLVModels.Merchant.MerchantComplianceSource?
        /// Serialized integer data related to the record
        public var payloadInt1: CLVModels.Variant?
        /// Description about the integer data related to the record
        public var payloadInt1Description: CLVModels.Variant?
        /// Serialized string data related to the record
        public var payloadStr1: CLVModels.Variant?
        /// Description about the string data related to the record
        public var payloadStr1Description: CLVModels.Variant?
        /// Creation timestamp
        public var createdTime: Date?
        /// Timestamp of when this compliance was deleted
        public var deletedTime: Date?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case id
            case merchantUuid
            case type
            case enabled
            case source
            case payloadInt1
            case payloadInt1Description
            case payloadStr1
            case payloadStr1Description
            case createdTime
            case deletedTime
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
                self.merchantUuid = try rootContainer.decodeIfPresent(String.self, forKey: .merchantUuid)
            } catch {
                decodeError.append(error)
            }
            do {
                self.type_ = try rootContainer.decodeIfPresent(CLVModels.Merchant.MerchantComplianceType.self, forKey: .type)
            } catch {
                decodeError.append(error)
            }
            do {
                self.enabled = try rootContainer.decodeIfPresent(Bool.self, forKey: .enabled)
            } catch {
                decodeError.append(error)
            }
            do {
                self.source = try rootContainer.decodeIfPresent(CLVModels.Merchant.MerchantComplianceSource.self, forKey: .source)
            } catch {
                decodeError.append(error)
            }
            do {
                self.payloadInt1 = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .payloadInt1)
            } catch {
                decodeError.append(error)
            }
            do {
                self.payloadInt1Description = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .payloadInt1Description)
            } catch {
                decodeError.append(error)
            }
            do {
                self.payloadStr1 = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .payloadStr1)
            } catch {
                decodeError.append(error)
            }
            do {
                self.payloadStr1Description = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .payloadStr1Description)
            } catch {
                decodeError.append(error)
            }
            do {
                self.createdTime = try rootContainer.decodeIfPresent(Date.self, forKey: .createdTime)
            } catch {
                decodeError.append(error)
            }
            do {
                self.deletedTime = try rootContainer.decodeIfPresent(Date.self, forKey: .deletedTime)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (id != nil) { try container.encode(id, forKey: .id) }
            if (merchantUuid != nil) { try container.encode(merchantUuid, forKey: .merchantUuid) }
            if (type_ != nil) { try container.encode(type_, forKey: .type) }
            if (enabled != nil) { try container.encode(enabled, forKey: .enabled) }
            if (source != nil) { try container.encode(source, forKey: .source) }
            if (payloadInt1 != nil) { try container.encode(payloadInt1, forKey: .payloadInt1) }
            if (payloadInt1Description != nil) { try container.encode(payloadInt1Description, forKey: .payloadInt1Description) }
            if (payloadStr1 != nil) { try container.encode(payloadStr1, forKey: .payloadStr1) }
            if (payloadStr1Description != nil) { try container.encode(payloadStr1Description, forKey: .payloadStr1Description) }
            if (createdTime != nil) { try container.encode(createdTime, forKey: .createdTime) }
            if (deletedTime != nil) { try container.encode(deletedTime, forKey: .deletedTime) }
        }
    }

}