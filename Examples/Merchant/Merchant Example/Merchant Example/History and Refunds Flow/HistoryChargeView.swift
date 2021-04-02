//
//  HistoryChargeView.swift
//  Merchant Example
//
//  Created by Eric Rowe on 2/1/21.
//

/*
 Get Charge Response
 {
   "id" : "Y09HM58CPYDM6",
   "amount" : 100000,
   "currency" : "usd",
   "created" : 1611251481000,
   "captured" : false,
   "customer" : "A58A67CXWDPXR",
   "order" : "EKEV0BD30EENE",
   "outcome" : {
     "network_status" : "approved_by_network",
     "type" : "authorized"
   },
   "paid" : true,
   "status" : "succeeded",
   "source" : {
     "id" : "clv_1TSTSArf7dHJYPe7CZY7g4zk",
     "brand" : "DISCOVER",
     "first6" : "601136",
     "last4" : "6668"
   }
 }
 */

import SwiftUI
import CloverREST

struct HistoryChargeView: View {
    let charge:Clover.Ecomm.Charge
    
    
    struct navigationBar: View {
        let chargeId:String
        let refunded:Bool
        var body: some View {
            VStack(spacing: 0) {
                Divider()
                HStack {
                    Button(action:{
                        if !refunded {
                            try? Clover.Ecomm.Refund.Create(
                                charge: chargeId,
                                reason: .requested_by_customer,
                                success: { refund in
                                    MMChargesManager.shared.getCharge(id: chargeId)
                                }, failure: { data, response, error in })
                        }
                    }) {
                        VStack {
                            Image(systemName: "dollarsign.circle")
                            Text("Refund Charge")
                                .font(.footnote)
                        }
                        .foregroundColor(refunded ? Color.gray : Color.black)
                    }
                    .disabled(refunded)
                }.frame(height: 45)
                Divider()
            }
        }
    }
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Charge: \(charge.id ?? "")")) {
                    ForEach(0..<11) { item in
                        switch item {
                        case 0: ItemView(title: "Amount", value: buildCurrencyString(charge.amount, refundAmount: charge.amount_refunded))
                        case 1: ItemView(title: "Created", value: buildTimeString(charge.created))
                        case 2: ItemView(title: "Captured", value: buildBoolString(charge.captured))
                        case 3:
                            if let customerId = charge.customer?.object as? String, let customer = MMCustomersManager.shared.customers.first(where: { $0.id == customerId }) {
                                NavigationLink(destination: CustomerView(customer: customer)) {
                                    ItemView(title: "Customer", value: customer.buildName())
                                }
                            } else {
                                ItemView(title: "Customer", value: nil)
                            }
                        case 4:
                            if let id = charge.order?.object as? String, let order = MMOrdersManager.shared.orders.first(where: { $0.id == id }) {
                                NavigationLink(destination: HistoryOrderView(order: order)) {
                                    ItemView(title: "Order", value: buildVariantStringString(charge.order))
                                }
                            } else {
                                ItemView(title: "Order", value: nil)
                            }
                        case 5: ItemView(title: "Outcome", value: charge.outcome?.type_?.toString)
                        case 6: ItemView(title: "Paid", value: buildBoolString(charge.paid))
                        case 7: ItemView(title: "Status", value: charge.status?.toString)
                        case 8: ItemView(title: "Card Brand", value: buildVariantStringString(charge.source?.brand))
                        case 9: ItemView(title: "Card Number", value: buildCardNumber(charge.source))
                        case 10:ItemView(title: "Amount Refunded", value: buildCurrencyString(charge.amount_refunded))
                        default: Spacer()
                        }
                    }
                }
            }
            Spacer()
            if let chargeId = charge.id {
                if let amount = charge.amount, let amount_refunded = charge.amount_refunded, amount == amount_refunded {
                    navigationBar(chargeId: chargeId, refunded:true)
                } else {
                    navigationBar(chargeId: chargeId, refunded:false)
                }
            }
        }
    }
}

fileprivate struct ItemView:View {
    let title:String
    let value:String?
    var body: some View {
        VStack(alignment: .leading) {
            Text(value ?? "")
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

fileprivate func buildVariantStringString(_ variantString:CLVModels.Variant?) -> String {
    return variantString?.object as? String ?? ""
}
fileprivate func buildBoolString(_ bool:Bool?) -> String {
    guard let bool = bool else { return "" }
    return bool ? "YES" : "NO"
}
fileprivate func buildTimeString(_ created:Int64?) -> String {
    guard let created = created else { return "" }
    let date = Date(timeIntervalSince1970: Double(created))
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .full
    return formatter.string(from: date)
}
fileprivate func buildCurrencyString(_ amount:Int64?, refundAmount:Int64? = nil) -> String {
    guard let amount = amount else { return "" }
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    var returnVal = formatter.string(from: NSNumber(value: Double(amount) / 100 )) ?? ""
    if let refundAmount = refundAmount,
       let refundString = formatter.string(from: NSNumber(value: Double(refundAmount) / 100 )),
       let totalString =  formatter.string(from: NSNumber(value: Double(amount - refundAmount) / 100 )){
        returnVal += " - \(refundString) = \(totalString)"
    }
    return returnVal
}
fileprivate func buildCardNumber(_ source:CLVModels.Ecomm.Source?) -> String {
    guard let source = source else { return "" }
    var cardNumber = ""
    if let cardFirstSix = source.first6 {
        cardNumber = "\(cardFirstSix[0..<4]) \(cardFirstSix[4..<6])** **** "
    } else {
        cardNumber = "**** **** **** "
    }
    if let cardLast4 = source.last4 {
        cardNumber += "\(cardLast4)"
    } else {
        cardNumber += "****"
    }
    return cardNumber
}
extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }
}
