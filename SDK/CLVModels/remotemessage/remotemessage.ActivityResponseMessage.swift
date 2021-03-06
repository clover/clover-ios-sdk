/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Remotemessage {

    public class ActivityResponseMessage: Codable {

        /// The superClass
        public var _meta_superclass: CLVModels.Remotemessage.Message?
        /// initialization for the type
        public var _meta_init_method: CLVModels.Remotemessage.Method?
        /// The result code after running this activity
        public var resultCode: Int64?
        /// If this activity failed, the reason for the failure
        public var failReason: String?
        /// Response data for this activity
        public var payload: String?
        /// The name of the action for this activity
        public var action: String?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case _meta_superclass
            case _meta_init_method
            case resultCode
            case failReason
            case payload
            case action
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
                self.resultCode = try rootContainer.decodeIfPresent(Int64.self, forKey: .resultCode)
            } catch {
                decodeError.append(error)
            }
            do {
                self.failReason = try rootContainer.decodeIfPresent(String.self, forKey: .failReason)
            } catch {
                decodeError.append(error)
            }
            do {
                self.payload = try rootContainer.decodeIfPresent(String.self, forKey: .payload)
            } catch {
                decodeError.append(error)
            }
            do {
                self.action = try rootContainer.decodeIfPresent(String.self, forKey: .action)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (_meta_superclass != nil) { try container.encode(_meta_superclass, forKey: ._meta_superclass) }
            if (_meta_init_method != nil) { try container.encode(_meta_init_method, forKey: ._meta_init_method) }
            if (resultCode != nil) { try container.encode(resultCode, forKey: .resultCode) }
            if (failReason != nil) { try container.encode(failReason, forKey: .failReason) }
            if (payload != nil) { try container.encode(payload, forKey: .payload) }
            if (action != nil) { try container.encode(action, forKey: .action) }
        }
    }

}