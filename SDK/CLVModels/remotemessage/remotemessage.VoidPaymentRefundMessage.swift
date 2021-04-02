/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Remotemessage {

    public class VoidPaymentRefundMessage: Codable {

        /// The superClass
        public var _meta_superclass: CLVModels.Remotemessage.Message?
        /// initialization for the type
        public var _meta_init_method: CLVModels.Remotemessage.Method?
        public var orderId: String?
        public var refundId: String?
        public var disableCloverPrinting: Bool?
        public var disableReceiptSelection: Bool?
        /// Extra data used by external systems.
        public var extras: [String:String]?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case _meta_superclass
            case _meta_init_method
            case orderId
            case refundId
            case disableCloverPrinting
            case disableReceiptSelection
            case extras
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
                self.orderId = try rootContainer.decodeIfPresent(String.self, forKey: .orderId)
            } catch {
                decodeError.append(error)
            }
            do {
                self.refundId = try rootContainer.decodeIfPresent(String.self, forKey: .refundId)
            } catch {
                decodeError.append(error)
            }
            do {
                self.disableCloverPrinting = try rootContainer.decodeIfPresent(Bool.self, forKey: .disableCloverPrinting)
            } catch {
                decodeError.append(error)
            }
            do {
                self.disableReceiptSelection = try rootContainer.decodeIfPresent(Bool.self, forKey: .disableReceiptSelection)
            } catch {
                decodeError.append(error)
            }
            do {
                self.extras = try rootContainer.decodeIfPresent([String:String].self, forKey: .extras)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (_meta_superclass != nil) { try container.encode(_meta_superclass, forKey: ._meta_superclass) }
            if (_meta_init_method != nil) { try container.encode(_meta_init_method, forKey: ._meta_init_method) }
            if (orderId != nil) { try container.encode(orderId, forKey: .orderId) }
            if (refundId != nil) { try container.encode(refundId, forKey: .refundId) }
            if (disableCloverPrinting != nil) { try container.encode(disableCloverPrinting, forKey: .disableCloverPrinting) }
            if (disableReceiptSelection != nil) { try container.encode(disableReceiptSelection, forKey: .disableReceiptSelection) }
            if (extras != nil) { try container.encode(extras, forKey: .extras) }
        }
    }

}