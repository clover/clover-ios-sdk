/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Order {

    public class PrintOrder: Codable {

        /// Unique identifier
        public var id: String?
        public var merchantRef: CLVModels.Base.Reference?
        /// Reference to the order to be printed
        public var orderRef: CLVModels.Base.Reference?
        /// The printing device. A 128-bit UUID, not a normal base-13 Clover ID.
        public var deviceRef: CLVModels.Base.Reference?
        /// The print category
        public var category: CLVModels.Printer.PrintCategory?
        /// print event state
        public var state: CLVModels.Variant?
        /// Timestamp when the print event was created
        public var createdTime: Date?
        /// Timestamp when the print event was last modified
        public var modifiedTime: Date?
        /// Timestamp when the print event was last deleted
        public var deletedTime: Date?
        /// Timestamp when the print event needs to fire to printer
        public var printTime: Date?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case id
            case merchantRef
            case orderRef
            case deviceRef
            case category
            case state
            case createdTime
            case modifiedTime
            case deletedTime
            case printTime
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
                self.merchantRef = try rootContainer.decodeIfPresent(CLVModels.Base.Reference.self, forKey: .merchantRef)
            } catch {
                decodeError.append(error)
            }
            do {
                self.orderRef = try rootContainer.decodeIfPresent(CLVModels.Base.Reference.self, forKey: .orderRef)
            } catch {
                decodeError.append(error)
            }
            do {
                self.deviceRef = try rootContainer.decodeIfPresent(CLVModels.Base.Reference.self, forKey: .deviceRef)
            } catch {
                decodeError.append(error)
            }
            do {
                self.category = try rootContainer.decodeIfPresent(CLVModels.Printer.PrintCategory.self, forKey: .category)
            } catch {
                decodeError.append(error)
            }
            do {
                self.state = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .state)
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
            do {
                self.deletedTime = try rootContainer.decodeIfPresent(Date.self, forKey: .deletedTime)
            } catch {
                decodeError.append(error)
            }
            do {
                self.printTime = try rootContainer.decodeIfPresent(Date.self, forKey: .printTime)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (id != nil) { try container.encode(id, forKey: .id) }
            if (merchantRef != nil) { try container.encode(merchantRef, forKey: .merchantRef) }
            if (orderRef != nil) { try container.encode(orderRef, forKey: .orderRef) }
            if (deviceRef != nil) { try container.encode(deviceRef, forKey: .deviceRef) }
            if (category != nil) { try container.encode(category, forKey: .category) }
            if (state != nil) { try container.encode(state, forKey: .state) }
            if (createdTime != nil) { try container.encode(createdTime, forKey: .createdTime) }
            if (modifiedTime != nil) { try container.encode(modifiedTime, forKey: .modifiedTime) }
            if (deletedTime != nil) { try container.encode(deletedTime, forKey: .deletedTime) }
            if (printTime != nil) { try container.encode(printTime, forKey: .printTime) }
        }
    }

}