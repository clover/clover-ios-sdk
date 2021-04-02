/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Remotemessage {

    public class IncrementPreAuthResponseMessage: Codable {

        /// The superClass
        public var _meta_superclass: CLVModels.Remotemessage.Message?
        /// initialization for the type
        public var _meta_init_method: CLVModels.Remotemessage.Method?
        /// The status of the request.
        public var status: CLVModels.Remotemessage.ResultStatus?
        /// Detail message from the server.
        public var reason: String?
        /// The resulting Authorization
        public var authorization: CLVModels.Payments.Authorization?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case _meta_superclass
            case _meta_init_method
            case status
            case reason
            case authorization
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
                self.status = try rootContainer.decodeIfPresent(CLVModels.Remotemessage.ResultStatus.self, forKey: .status)
            } catch {
                decodeError.append(error)
            }
            do {
                self.reason = try rootContainer.decodeIfPresent(String.self, forKey: .reason)
            } catch {
                decodeError.append(error)
            }
            do {
                self.authorization = try rootContainer.decodeIfPresent(CLVModels.Payments.Authorization.self, forKey: .authorization)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (_meta_superclass != nil) { try container.encode(_meta_superclass, forKey: ._meta_superclass) }
            if (_meta_init_method != nil) { try container.encode(_meta_init_method, forKey: ._meta_init_method) }
            if (status != nil) { try container.encode(status, forKey: .status) }
            if (reason != nil) { try container.encode(reason, forKey: .reason) }
            if (authorization != nil) { try container.encode(authorization, forKey: .authorization) }
        }
    }

}