/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Printer {

    public class Printer: Codable {

        /// Unique identifier
        public var id: String?
        /// MAC address of a network printer
        public var mac: String?
        public var model: String?
        public var name: String?
        /// IP address of a network printer
        public var ipAddress: String?
        /// NETWORK is a printer that's directly connected to the network.  MY_LOCAL represents the printer that's connected to the device that's making the request.
        public var type_: CLVModels.Printer.PrinterType?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case id
            case mac
            case model
            case name
            case ipAddress
            case type
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
                self.mac = try rootContainer.decodeIfPresent(String.self, forKey: .mac)
            } catch {
                decodeError.append(error)
            }
            do {
                self.model = try rootContainer.decodeIfPresent(String.self, forKey: .model)
            } catch {
                decodeError.append(error)
            }
            do {
                self.name = try rootContainer.decodeIfPresent(String.self, forKey: .name)
            } catch {
                decodeError.append(error)
            }
            do {
                self.ipAddress = try rootContainer.decodeIfPresent(String.self, forKey: .ipAddress)
            } catch {
                decodeError.append(error)
            }
            do {
                self.type_ = try rootContainer.decodeIfPresent(CLVModels.Printer.PrinterType.self, forKey: .type)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (id != nil) { try container.encode(id, forKey: .id) }
            if (mac != nil) { try container.encode(mac, forKey: .mac) }
            if (model != nil) { try container.encode(model, forKey: .model) }
            if (name != nil) { try container.encode(name, forKey: .name) }
            if (ipAddress != nil) { try container.encode(ipAddress, forKey: .ipAddress) }
            if (type_ != nil) { try container.encode(type_, forKey: .type) }
        }
    }

}