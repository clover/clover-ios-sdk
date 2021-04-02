/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */

/*
    Errors that are encountered that cannot be recovered from are passed using this class.  This is intended to be used to aid integrators and Clover support in troubleshooting systems integration with devices.
*/

import Foundation

extension CLVModels.Remotemessage {

    public class RemoteError: Codable {

        /// The superClass
        public var _meta_superclass: CLVModels.Remotemessage.Message?
        /// initialization for the type
        public var _meta_init_method: CLVModels.Remotemessage.Method?
        /// Detailed information on the error.  This is engineering information for troubleshooting.
        public var errorDetail: CLVModels.Variant?
        /// A concise description of the error (fixme: the value 13 is suspicious)
        public var errorMessage: String?
        /// If available, the code for the error encountered.
        public var errorCode: CLVModels.Variant?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case _meta_superclass
            case _meta_init_method
            case errorDetail
            case errorMessage
            case errorCode
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
                self.errorDetail = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .errorDetail)
            } catch {
                decodeError.append(error)
            }
            do {
                self.errorMessage = try rootContainer.decodeIfPresent(String.self, forKey: .errorMessage)
            } catch {
                decodeError.append(error)
            }
            do {
                self.errorCode = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .errorCode)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (_meta_superclass != nil) { try container.encode(_meta_superclass, forKey: ._meta_superclass) }
            if (_meta_init_method != nil) { try container.encode(_meta_init_method, forKey: ._meta_init_method) }
            if (errorDetail != nil) { try container.encode(errorDetail, forKey: .errorDetail) }
            if (errorMessage != nil) { try container.encode(errorMessage, forKey: .errorMessage) }
            if (errorCode != nil) { try container.encode(errorCode, forKey: .errorCode) }
        }
    }

}