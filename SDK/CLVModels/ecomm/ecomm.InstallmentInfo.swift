/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Ecomm {

    public class InstallmentInfo: Codable {

        public var bill_pay_indicator: CLVModels.Ecomm.BillPayIndicator?
        /// Invoice number of the installment transaction
        public var invoice_number: CLVModels.Variant?
        /// Description of the installment transaction
        public var description_: CLVModels.Variant?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case bill_pay_indicator
            case invoice_number
            case description
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.bill_pay_indicator = try rootContainer.decodeIfPresent(CLVModels.Ecomm.BillPayIndicator.self, forKey: .bill_pay_indicator)
            } catch {
                decodeError.append(error)
            }
            do {
                self.invoice_number = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .invoice_number)
            } catch {
                decodeError.append(error)
            }
            do {
                self.description_ = try rootContainer.decodeIfPresent(CLVModels.Variant.self, forKey: .description)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (bill_pay_indicator != nil) { try container.encode(bill_pay_indicator, forKey: .bill_pay_indicator) }
            if (invoice_number != nil) { try container.encode(invoice_number, forKey: .invoice_number) }
            if (description_ != nil) { try container.encode(description_, forKey: .description) }
        }
    }

}