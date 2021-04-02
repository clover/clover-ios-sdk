/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Device {

    public class UpdatedDeviceBundle: Codable {

        /// The UUID of the merchant that the equipment is associated with.
        public var merchantId: String?
        /// The serial number of the provisioned device that is being updated.
        public var provisionedSerialNumber: String?
        /// The equipment number of the boarded equipment that is getting the updated bundle.
        public var equipmentNumber: String?
        /// The equipment code of the boarded equipment that is getting the updated bundle.
        public var equipmentCode: String?
        /// The UUID of the bundle that is being used to be updated. Null if the bundle is being removed from the equipment.
        public var bundleId: String?
        /// The effective time of the bundle being assigned to a provisioned device.
        public var effectiveTime: Date?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case merchantId
            case provisionedSerialNumber
            case equipmentNumber
            case equipmentCode
            case bundleId
            case effectiveTime
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.merchantId = try rootContainer.decodeIfPresent(String.self, forKey: .merchantId)
            } catch {
                decodeError.append(error)
            }
            do {
                self.provisionedSerialNumber = try rootContainer.decodeIfPresent(String.self, forKey: .provisionedSerialNumber)
            } catch {
                decodeError.append(error)
            }
            do {
                self.equipmentNumber = try rootContainer.decodeIfPresent(String.self, forKey: .equipmentNumber)
            } catch {
                decodeError.append(error)
            }
            do {
                self.equipmentCode = try rootContainer.decodeIfPresent(String.self, forKey: .equipmentCode)
            } catch {
                decodeError.append(error)
            }
            do {
                self.bundleId = try rootContainer.decodeIfPresent(String.self, forKey: .bundleId)
            } catch {
                decodeError.append(error)
            }
            do {
                self.effectiveTime = try rootContainer.decodeIfPresent(Date.self, forKey: .effectiveTime)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (merchantId != nil) { try container.encode(merchantId, forKey: .merchantId) }
            if (provisionedSerialNumber != nil) { try container.encode(provisionedSerialNumber, forKey: .provisionedSerialNumber) }
            if (equipmentNumber != nil) { try container.encode(equipmentNumber, forKey: .equipmentNumber) }
            if (equipmentCode != nil) { try container.encode(equipmentCode, forKey: .equipmentCode) }
            if (bundleId != nil) { try container.encode(bundleId, forKey: .bundleId) }
            if (effectiveTime != nil) { try container.encode(effectiveTime, forKey: .effectiveTime) }
        }
    }

}