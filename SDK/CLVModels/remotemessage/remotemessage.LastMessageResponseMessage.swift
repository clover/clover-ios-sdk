/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Remotemessage {

    public class LastMessageResponseMessage: Codable {

        /// The superClass
        public var _meta_superclass: CLVModels.Remotemessage.Message?
        /// initialization for the type
        public var _meta_init_method: CLVModels.Remotemessage.Method?
        /// The last transactional request the device recorded
        public var request: CLVModels.Remotemessage.Message?
        /// The last transactional response the device recorded
        public var response: CLVModels.Remotemessage.Message?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case _meta_superclass
            case _meta_init_method
            case request
            case response
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self._meta_superclass = try rootContainer.decodeIfPresent(CLVModels.Remotemessage.Message.self, forKey: ._meta_superclass)
            } catch {
                decodeError.append(error)
            }
            do {
                self._meta_init_method = try rootContainer.decodeIfPresent(CLVModels.Remotemessage.Method.self, forKey: ._meta_init_method)
            } catch {
                decodeError.append(error)
            }
            do {
                self.request = try rootContainer.decodeIfPresent(CLVModels.Remotemessage.Message.self, forKey: .request)
            } catch {
                decodeError.append(error)
            }
            do {
                self.response = try rootContainer.decodeIfPresent(CLVModels.Remotemessage.Message.self, forKey: .response)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (_meta_superclass != nil) { try container.encode(_meta_superclass, forKey: ._meta_superclass) }
            if (_meta_init_method != nil) { try container.encode(_meta_init_method, forKey: ._meta_init_method) }
            if (request != nil) { try container.encode(request, forKey: .request) }
            if (response != nil) { try container.encode(response, forKey: .response) }
        }
    }

}