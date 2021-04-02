//
//  HistoryView.swift
//  Merchant Example
//
//  Created by Eric Rowe on 1/29/21.
//

import SwiftUI
import CloverREST
import Combine

struct HistoryView: View {
    @ObservedObject private var ordersManager = MMOrdersManager.shared
    @ObservedObject private var chargesManager = MMChargesManager.shared

    
    var body: some View {
        List {
            // Orders all have a charge, but not all charges have an order
            // If you create a charge without creating a customer, then no order will be created
            // The Orders section contains all Orders.  Tap on an Order to see details, where the Charge can be dug into.
            Section(header: Text("Orders")) {
                ForEach(ordersManager.orders.sorted(by: >)) { item in
                    NavigationLink(destination: HistoryOrderView(order:item)) {
                        OrderItemView(order:item)
                    }
                }
            }
            // The Blind Charges section contains only those Charges that are not associated with an Order
            Section(header: Text("Blind Charges")) {
                let ordersCharges = ordersManager.orders.compactMap({$0.charge?.object as? String})
                // TODO: this filter is O^2 inefficient and won't scale well for production apps.  Please optimize.
                ForEach(chargesManager.charges.filter {
                    let thisCharge = $0.id
                    return ordersCharges.first { $0 == thisCharge } == nil
                }) { item in
                    NavigationLink(destination: HistoryChargeView(charge:item)) {
                        ChargeItemView(charge:item)
                    }
                }
            }
        }
    }
}



struct OrderItemView: View {
    var order: Clover.Ecomm.Order
    var body: some View {
        VStack {
            HStack {
                if let id = order.customer?.object as? String {
                    if let customer = MMCustomersManager.shared.customers.first(where: {$0.id == id}),
                       let name = customer.getName() {
                        Text(name)
                    }
                }
                Spacer()
                if let amount = order.amountString {
                    Text(amount)
                }
            }
            HStack {
                if let id = order.id {
                    Text(id)
                        .font(.caption2)
                }
                Spacer()
                if let status = order.status?.toString {
                    Text(status)
                        .font(.caption2)
                }
            }
        }
    }
}
struct ChargeItemView: View {
    var charge: Clover.Ecomm.Charge
    var body: some View {
        VStack {
            HStack {
                if let id = charge.customer?.object as? String {
                    if let customer = MMCustomersManager.shared.customers.first(where: {$0.id == id}),
                       let name = customer.getName() {
                        Text(name)
                    }
                }
                Spacer()
                if let amount = charge.amountString {
                    Text(amount)
                }
            }
            HStack {
                if let id = charge.id {
                    Text(id)
                        .font(.caption2)
                }
                Spacer()
                if let status = charge.status?.toString {
                    Text(status)
                        .font(.caption2)
                }
            }
        }
    }
}

// TODO - can we move this to the SDK?
// Order and Charge can both be declared Identifiable because they use a uniqe id field from the backing database
extension Clover.Ecomm.Order : Identifiable, Comparable {
    public static func < (lhs: Clover.Ecomm.Order, rhs: Clover.Ecomm.Order) -> Bool {
        guard let lhs = lhs.created, let rhs = rhs.created else { return false }
        return lhs < rhs
    }
    
    public static func == (lhs: Clover.Ecomm.Order, rhs: Clover.Ecomm.Order) -> Bool {
        return lhs.id == rhs.id
    }
}
extension Clover.Ecomm.Charge : Identifiable {}



struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
