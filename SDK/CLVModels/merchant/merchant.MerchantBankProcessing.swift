/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */

/*
    Bank data for a merchant
*/

import Foundation

extension CLVModels.Merchant {

    public class MerchantBankProcessing: Codable {

        public var merchantRef: CLVModels.Base.Reference?
        /// Bank identification number of bank
        public var bin: String?
        /// Pay code
        public var payCode: String?
        /// Clearing code
        public var clearingCode: String?
        /// Interbank Card Association
        public var ica: String?
        /// Pay cycle
        public var payCycle: String?
        /// ACH rollup
        public var achRollup: String?
        /// Date record created
        public var createdTime: Date?
        /// Date record modified
        public var modifiedTime: Date?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case merchantRef
            case bin
            case payCode
            case clearingCode
            case ica
            case payCycle
            case achRollup
            case createdTime
            case modifiedTime
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.merchantRef = try rootContainer.decodeIfPresent(CLVModels.Base.Reference.self, forKey: .merchantRef)
            } catch {
                decodeError.append(error)
            }
            do {
                self.bin = try rootContainer.decodeIfPresent(String.self, forKey: .bin)
            } catch {
                decodeError.append(error)
            }
            do {
                self.payCode = try rootContainer.decodeIfPresent(String.self, forKey: .payCode)
            } catch {
                decodeError.append(error)
            }
            do {
                self.clearingCode = try rootContainer.decodeIfPresent(String.self, forKey: .clearingCode)
            } catch {
                decodeError.append(error)
            }
            do {
                self.ica = try rootContainer.decodeIfPresent(String.self, forKey: .ica)
            } catch {
                decodeError.append(error)
            }
            do {
                self.payCycle = try rootContainer.decodeIfPresent(String.self, forKey: .payCycle)
            } catch {
                decodeError.append(error)
            }
            do {
                self.achRollup = try rootContainer.decodeIfPresent(String.self, forKey: .achRollup)
            } catch {
                decodeError.append(error)
            }
            do {
                self.createdTime = try rootContainer.decodeIfPresent(Date.self, forKey: .createdTime)
            } catch {
                decodeError.append(error)
            }
            do {
                self.modifiedTime = try rootContainer.decodeIfPresent(Date.self, forKey: .modifiedTime)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (merchantRef != nil) { try container.encode(merchantRef, forKey: .merchantRef) }
            if (bin != nil) { try container.encode(bin, forKey: .bin) }
            if (payCode != nil) { try container.encode(payCode, forKey: .payCode) }
            if (clearingCode != nil) { try container.encode(clearingCode, forKey: .clearingCode) }
            if (ica != nil) { try container.encode(ica, forKey: .ica) }
            if (payCycle != nil) { try container.encode(payCycle, forKey: .payCycle) }
            if (achRollup != nil) { try container.encode(achRollup, forKey: .achRollup) }
            if (createdTime != nil) { try container.encode(createdTime, forKey: .createdTime) }
            if (modifiedTime != nil) { try container.encode(modifiedTime, forKey: .modifiedTime) }
        }
    }

}