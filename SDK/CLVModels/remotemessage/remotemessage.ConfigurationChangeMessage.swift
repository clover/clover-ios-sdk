/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */

/*
     Used to notify clients of pay display of a configuration change.
 * This is conceptually abstract to allow for various configuration types.
*/

import Foundation

extension CLVModels.Remotemessage {

    public class ConfigurationChangeMessage: Codable {

        /// The superClass
        public var _meta_superclass: CLVModels.Remotemessage.Message?
        /// initialization for the type
        public var _meta_init_method: CLVModels.Remotemessage.Method?
        /// The type of configuration that is upcoming.  One of
        /// * com.clover.remote.message.ConfigurationChangeMessage#USB
        /// * com.clover.remote.message.ConfigurationChangeMessage#NETWORK_PAY_DISPLAY
        /// * com.clover.remote.message.ConfigurationChangeMessage#CLOUD_PAY_DISPLAY
        public var configurationType: String?
        /// Typically a json serialized string that represents the change to the configuration.
        /// * This is not typed, or constrained, so it could contain any string value, but the
        /// * intention is to include a serialized representation of the new configuration.
        public var configuration: String?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case _meta_superclass
            case _meta_init_method
            case configurationType
            case configuration
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
                self.configurationType = try rootContainer.decodeIfPresent(String.self, forKey: .configurationType)
            } catch {
                decodeError.append(error)
            }
            do {
                self.configuration = try rootContainer.decodeIfPresent(String.self, forKey: .configuration)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (_meta_superclass != nil) { try container.encode(_meta_superclass, forKey: ._meta_superclass) }
            if (_meta_init_method != nil) { try container.encode(_meta_init_method, forKey: ._meta_init_method) }
            if (configurationType != nil) { try container.encode(configurationType, forKey: .configurationType) }
            if (configuration != nil) { try container.encode(configuration, forKey: .configuration) }
        }
    }

}