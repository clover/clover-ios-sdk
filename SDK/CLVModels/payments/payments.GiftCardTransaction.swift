/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Payments {

    public class GiftCardTransaction: Codable {

        /// UUID
        public var id: String?
        /// Transaction Amount
        public var amount: Int64?
        /// Tax Amount
        public var taxAmount: Int64?
        /// Tip Amount
        public var tipAmount: Int64?
        public var orderId: String?
        /// Gift Card
        public var card: CLVModels.Payments.GiftCard?
        public var paymentIds: [String]?
        public var ignorePayment: Bool?
        public var serviceChargeAmount: CLVModels.Payments.ServiceChargeAmount?
        public var taxableAmountRates: [CLVModels.Payments.TaxableAmountRate]?
        /// Payments that were made for this line item
        public var lineItems: [CLVModels.Payments.LineItemPayment]?
        public var employeeId: String?
        public var suppressPayment: Bool?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case id
            case amount
            case taxAmount
            case tipAmount
            case orderId
            case card
            case paymentIds
            case ignorePayment
            case serviceChargeAmount
            case taxableAmountRates
            case lineItems
            case employeeId
            case suppressPayment
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
                self.amount = try rootContainer.decodeIfPresent(Int64.self, forKey: .amount)
            } catch {
                decodeError.append(error)
            }
            do {
                self.taxAmount = try rootContainer.decodeIfPresent(Int64.self, forKey: .taxAmount)
            } catch {
                decodeError.append(error)
            }
            do {
                self.tipAmount = try rootContainer.decodeIfPresent(Int64.self, forKey: .tipAmount)
            } catch {
                decodeError.append(error)
            }
            do {
                self.orderId = try rootContainer.decodeIfPresent(String.self, forKey: .orderId)
            } catch {
                decodeError.append(error)
            }
            do {
                self.card = try rootContainer.decodeIfPresent(CLVModels.Payments.GiftCard.self, forKey: .card)
            } catch {
                decodeError.append(error)
            }
            if (rootContainer.contains(.paymentIds)) {
                do {
                    let paymentIdsContainer = try rootContainer.nestedContainer(keyedBy: CLVModels.ElementsKey.self, forKey: .paymentIds)
                    self.paymentIds = try paymentIdsContainer.decodeIfPresent([String].self, forKey: .elements)
                } catch {
                    decodeError.append(error)
                }
            }
            do {
                self.ignorePayment = try rootContainer.decodeIfPresent(Bool.self, forKey: .ignorePayment)
            } catch {
                decodeError.append(error)
            }
            do {
                self.serviceChargeAmount = try rootContainer.decodeIfPresent(CLVModels.Payments.ServiceChargeAmount.self, forKey: .serviceChargeAmount)
            } catch {
                decodeError.append(error)
            }
            if (rootContainer.contains(.taxableAmountRates)) {
                do {
                    let taxableAmountRatesContainer = try rootContainer.nestedContainer(keyedBy: CLVModels.ElementsKey.self, forKey: .taxableAmountRates)
                    self.taxableAmountRates = try taxableAmountRatesContainer.decodeIfPresent([CLVModels.Payments.TaxableAmountRate].self, forKey: .elements)
                } catch {
                    decodeError.append(error)
                }
            }
            if (rootContainer.contains(.lineItems)) {
                do {
                    let lineItemsContainer = try rootContainer.nestedContainer(keyedBy: CLVModels.ElementsKey.self, forKey: .lineItems)
                    self.lineItems = try lineItemsContainer.decodeIfPresent([CLVModels.Payments.LineItemPayment].self, forKey: .elements)
                } catch {
                    decodeError.append(error)
                }
            }
            do {
                self.employeeId = try rootContainer.decodeIfPresent(String.self, forKey: .employeeId)
            } catch {
                decodeError.append(error)
            }
            do {
                self.suppressPayment = try rootContainer.decodeIfPresent(Bool.self, forKey: .suppressPayment)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (id != nil) { try container.encode(id, forKey: .id) }
            if (amount != nil) { try container.encode(amount, forKey: .amount) }
            if (taxAmount != nil) { try container.encode(taxAmount, forKey: .taxAmount) }
            if (tipAmount != nil) { try container.encode(tipAmount, forKey: .tipAmount) }
            if (orderId != nil) { try container.encode(orderId, forKey: .orderId) }
            if (card != nil) { try container.encode(card, forKey: .card) }
            if (paymentIds != nil) { try container.encode(paymentIds, forKey: .paymentIds) }
            if (ignorePayment != nil) { try container.encode(ignorePayment, forKey: .ignorePayment) }
            if (serviceChargeAmount != nil) { try container.encode(serviceChargeAmount, forKey: .serviceChargeAmount) }
            if (taxableAmountRates != nil) { try container.encode(taxableAmountRates, forKey: .taxableAmountRates) }
            if (lineItems != nil) { try container.encode(lineItems, forKey: .lineItems) }
            if (employeeId != nil) { try container.encode(employeeId, forKey: .employeeId) }
            if (suppressPayment != nil) { try container.encode(suppressPayment, forKey: .suppressPayment) }
        }
    }

}