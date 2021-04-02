/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Remotemessage {

    public class ActivityRequest: Codable {

        /// The superClass
        public var _meta_superclass: CLVModels.Remotemessage.Message?
        /// initialization for the type
        public var _meta_init_method: CLVModels.Remotemessage.Method?
        /// The name of the action for this activity
        public var action: String?
        /// Data for this activity
        public var payload: String?
        /// If true, then the activity can be stopped in regular execution.
        public var nonBlocking: Bool?
        /// If true, then the activity will cancel other activity and run.  This includes payment activity.
        public var forceLaunch: Bool?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case _meta_superclass
            case _meta_init_method
            case action
            case payload
            case nonBlocking
            case forceLaunch
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
                self.action = try rootContainer.decodeIfPresent(String.self, forKey: .action)
            } catch {
                decodeError.append(error)
            }
            do {
                self.payload = try rootContainer.decodeIfPresent(String.self, forKey: .payload)
            } catch {
                decodeError.append(error)
            }
            do {
                self.nonBlocking = try rootContainer.decodeIfPresent(Bool.self, forKey: .nonBlocking)
            } catch {
                decodeError.append(error)
            }
            do {
                self.forceLaunch = try rootContainer.decodeIfPresent(Bool.self, forKey: .forceLaunch)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (_meta_superclass != nil) { try container.encode(_meta_superclass, forKey: ._meta_superclass) }
            if (_meta_init_method != nil) { try container.encode(_meta_init_method, forKey: ._meta_init_method) }
            if (action != nil) { try container.encode(action, forKey: .action) }
            if (payload != nil) { try container.encode(payload, forKey: .payload) }
            if (nonBlocking != nil) { try container.encode(nonBlocking, forKey: .nonBlocking) }
            if (forceLaunch != nil) { try container.encode(forceLaunch, forKey: .forceLaunch) }
        }
    }

}