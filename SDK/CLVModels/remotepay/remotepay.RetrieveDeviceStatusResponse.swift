/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Remotepay {

    public class RetrieveDeviceStatusResponse: Codable {

        /// The superClass
        public var _meta_superclass: CLVModels.Remotepay.BaseResponse?
        /// High level state of the connected device.
        public var state: CLVModels.Remotepay.ExternalDeviceState?
        /// Additional data elements supplementing the state of the connected device.
        public var data: CLVModels.Remotepay.ExternalDeviceStateData?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case _meta_superclass
            case state
            case data
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self._meta_superclass = try rootContainer.decodeIfPresent(CLVModels.Remotepay.BaseResponse.self, forKey: ._meta_superclass)
            } catch {
                decodeError.append(error)
            }
            do {
                self.state = try rootContainer.decodeIfPresent(CLVModels.Remotepay.ExternalDeviceState.self, forKey: .state)
            } catch {
                decodeError.append(error)
            }
            do {
                self.data = try rootContainer.decodeIfPresent(CLVModels.Remotepay.ExternalDeviceStateData.self, forKey: .data)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (_meta_superclass != nil) { try container.encode(_meta_superclass, forKey: ._meta_superclass) }
            if (state != nil) { try container.encode(state, forKey: .state) }
            if (data != nil) { try container.encode(data, forKey: .data) }
        }
    }

}