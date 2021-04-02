/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Payments {

    public class TaxableAmountRate: Codable {

        /// Tax rate id.
        public var id: String?
        /// Tax rate name. This field is optional.
        public var name: String?
        /// The sub-total of line items that the tax was based on. For VAT, this amount includes tax. For all others, this amount does not include tax.
        public var taxableAmount: Int64?
        /// The tax rate. 100% = 1e7.
        public var rate: Int64?
        /// Whether the taxable amount includes tax.
        public var isVat: Bool?
        /// The amount of tax collected. In cases where there are multiple payments for an order then it may be necessary to add an extra cent of tax to the last payment.
        public var taxAmount: Int64?
        /// The refund with which the tax rate is associated
        public var transactionRef: CLVModels.Base.Reference?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case id
            case name
            case taxableAmount
            case rate
            case isVat
            case taxAmount
            case transactionRef
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
                self.name = try rootContainer.decodeIfPresent(String.self, forKey: .name)
            } catch {
                decodeError.append(error)
            }
            do {
                self.taxableAmount = try rootContainer.decodeIfPresent(Int64.self, forKey: .taxableAmount)
            } catch {
                decodeError.append(error)
            }
            do {
                self.rate = try rootContainer.decodeIfPresent(Int64.self, forKey: .rate)
            } catch {
                decodeError.append(error)
            }
            do {
                self.isVat = try rootContainer.decodeIfPresent(Bool.self, forKey: .isVat)
            } catch {
                decodeError.append(error)
            }
            do {
                self.taxAmount = try rootContainer.decodeIfPresent(Int64.self, forKey: .taxAmount)
            } catch {
                decodeError.append(error)
            }
            do {
                self.transactionRef = try rootContainer.decodeIfPresent(CLVModels.Base.Reference.self, forKey: .transactionRef)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (id != nil) { try container.encode(id, forKey: .id) }
            if (name != nil) { try container.encode(name, forKey: .name) }
            if (taxableAmount != nil) { try container.encode(taxableAmount, forKey: .taxableAmount) }
            if (rate != nil) { try container.encode(rate, forKey: .rate) }
            if (isVat != nil) { try container.encode(isVat, forKey: .isVat) }
            if (taxAmount != nil) { try container.encode(taxAmount, forKey: .taxAmount) }
            if (transactionRef != nil) { try container.encode(transactionRef, forKey: .transactionRef) }
        }
    }

}