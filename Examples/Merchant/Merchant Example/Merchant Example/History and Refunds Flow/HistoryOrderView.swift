//
//  HistoryOrderView.swift
//  Merchant Example
//
//  Created by Eric Rowe on 2/1/21.
//


/*
 Get Order
 {
   "id" : "EKEV0BD30EENE",
   "object" : "order",
   "amount" : 100000,
   "currency" : "USD",
   "charge" : "Y09HM58CPYDM6",   // Link to Charge
   "customer" : "A58A67CXWDPXR", // Link to Customer
   "items" : [ {
     "quantity" : 1,
     "amount" : 100000,
     "description" : "Item 1"
   }, {
     "type" : "tax",
     "description" : "Taxes (included)"
   } ],
   "shipping" : {
     "name" : "Minnie Mouse"
   }
 }
 */

import SwiftUI
import CloverREST

struct HistoryOrderView: View {
    let order:Clover.Ecomm.Order
    
    var body: some View {
        List {
            Section(header: Text("Order: \(order.id ?? "")")) {
                ForEach(0..<3) { item in
                    switch item {
                    case 0: ItemView(title: "Amount", value: buildCurrencyString(order.amount))
                    case 1:
                        if let chargeId = order.charge?.object as? String, let charge = MMChargesManager.shared.charges.first(where: { $0.id == chargeId }) {
                            NavigationLink(destination: HistoryChargeView(charge: charge)) {
                                ItemView(title: "Charge", value: buildVariantStringString(order.charge))
                            }
                        } else {
                            ItemView(title: "Charge", value: nil)
                        }
                    case 2:
                        if let customerId = order.customer?.object as? String, let customer = MMCustomersManager.shared.customers.first(where: { $0.id == customerId }) {
                            NavigationLink(destination: CustomerView(customer: customer)) {
                                ItemView(title: "Customer", value: customer.buildName())
                            }
                        } else {
                            ItemView(title: "Customer", value: nil)
                        }
                    default: Spacer()
                    }
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
fileprivate func buildCurrencyString(_ amount:Int64?) -> String {
    guard let amount = amount else { return "" }
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(from: NSNumber(value: Double(amount) / 100 )) ?? ""
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
