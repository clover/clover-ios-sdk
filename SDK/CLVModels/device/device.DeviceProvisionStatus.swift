/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Device {

    public class DeviceProvisionStatus: Codable {

        /// Unique identifier
        public var id: String?
        public var chipUid: String?
        public var imei: String?
        public var provisionInfo: String?
        public var lastActivationCode: String?
        public var activationCode: String?
        public var emailSent: Bool?
        public var serialNumber: String?
        public var merchantId: Int64?
        public var provisionedTime: Date?
        public var activatedTime: Date?
        public var resellerId: Int64?
        public var deletedTime: Date?
        public var modifiedTime: Date?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case id
            case chipUid
            case imei
            case provisionInfo
            case lastActivationCode
            case activationCode
            case emailSent
            case serialNumber
            case merchantId
            case provisionedTime
            case activatedTime
            case resellerId
            case deletedTime
            case modifiedTime
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
                self.chipUid = try rootContainer.decodeIfPresent(String.self, forKey: .chipUid)
            } catch {
                decodeError.append(error)
            }
            do {
                self.imei = try rootContainer.decodeIfPresent(String.self, forKey: .imei)
            } catch {
                decodeError.append(error)
            }
            do {
                self.provisionInfo = try rootContainer.decodeIfPresent(String.self, forKey: .provisionInfo)
            } catch {
                decodeError.append(error)
            }
            do {
                self.lastActivationCode = try rootContainer.decodeIfPresent(String.self, forKey: .lastActivationCode)
            } catch {
                decodeError.append(error)
            }
            do {
                self.activationCode = try rootContainer.decodeIfPresent(String.self, forKey: .activationCode)
            } catch {
                decodeError.append(error)
            }
            do {
                self.emailSent = try rootContainer.decodeIfPresent(Bool.self, forKey: .emailSent)
            } catch {
                decodeError.append(error)
            }
            do {
                self.serialNumber = try rootContainer.decodeIfPresent(String.self, forKey: .serialNumber)
            } catch {
                decodeError.append(error)
            }
            do {
                self.merchantId = try rootContainer.decodeIfPresent(Int64.self, forKey: .merchantId)
            } catch {
                decodeError.append(error)
            }
            do {
                self.provisionedTime = try rootContainer.decodeIfPresent(Date.self, forKey: .provisionedTime)
            } catch {
                decodeError.append(error)
            }
            do {
                self.activatedTime = try rootContainer.decodeIfPresent(Date.self, forKey: .activatedTime)
            } catch {
                decodeError.append(error)
            }
            do {
                self.resellerId = try rootContainer.decodeIfPresent(Int64.self, forKey: .resellerId)
            } catch {
                decodeError.append(error)
            }
            do {
                self.deletedTime = try rootContainer.decodeIfPresent(Date.self, forKey: .deletedTime)
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
            if (id != nil) { try container.encode(id, forKey: .id) }
            if (chipUid != nil) { try container.encode(chipUid, forKey: .chipUid) }
            if (imei != nil) { try container.encode(imei, forKey: .imei) }
            if (provisionInfo != nil) { try container.encode(provisionInfo, forKey: .provisionInfo) }
            if (lastActivationCode != nil) { try container.encode(lastActivationCode, forKey: .lastActivationCode) }
            if (activationCode != nil) { try container.encode(activationCode, forKey: .activationCode) }
            if (emailSent != nil) { try container.encode(emailSent, forKey: .emailSent) }
            if (serialNumber != nil) { try container.encode(serialNumber, forKey: .serialNumber) }
            if (merchantId != nil) { try container.encode(merchantId, forKey: .merchantId) }
            if (provisionedTime != nil) { try container.encode(provisionedTime, forKey: .provisionedTime) }
            if (activatedTime != nil) { try container.encode(activatedTime, forKey: .activatedTime) }
            if (resellerId != nil) { try container.encode(resellerId, forKey: .resellerId) }
            if (deletedTime != nil) { try container.encode(deletedTime, forKey: .deletedTime) }
            if (modifiedTime != nil) { try container.encode(modifiedTime, forKey: .modifiedTime) }
        }
    }

}