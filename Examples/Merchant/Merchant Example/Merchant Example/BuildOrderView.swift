//
//  BuildOrderView.swift
//  Merchant Example
//
//  Created by Eric Rowe on 12/14/20.
//

import SwiftUI
import CloverREST
import Combine

struct BuildOrderView: View {
    @State var showView = false
    @State var isActive = false
    @State var isAlsoActive = false
    
    @ObservedObject private var ordersManager = MMOrdersManager.shared
    
    init() {
        MMOrdersManager.shared.createNewBlankOrder(overwriteExisting: true)
    }
    
    var navigationBar: some View {
        VStack(spacing: 0) {
            Divider()
            HStack {
                Spacer()
                NavigationLink(destination: HistoryView()) {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("History")
                            .font(.footnote)
                    }
                }
                Group {
                    Spacer()
                    Divider()
                    Spacer()
                }
                NavigationLink(destination: BlindChargePrepView(rootIsActive: $isAlsoActive), isActive: $isAlsoActive) {
                    VStack {
                        Image(systemName: "creditcard")
                        Text("Charge")
                            .font(.footnote)
                    }
                }
                Group {
                    Spacer()
                    Divider()
                    Spacer()
                }
                NavigationLink(destination: SelectCustomerView(rootIsActive: $isActive), isActive: $isActive) {
                    VStack {
                        HStack {
                            if let amount = ordersManager.newOrder.calculatedAmountString {
                                Text(amount)
                            }
                            Image(systemName: "creditcard.circle")
                        }
                        Text("Pay for Order")
                            .font(.footnote)
                    }
                }
                .isDetailLink(false)
                Spacer()
            }.frame(height: 45)
            Divider()
        }
    }
    
    var body: some View {

        NavigationView {
            VStack() {
                List {
                    if let items = ordersManager.newOrder.items {
                        Section(header: Text("Stock Items")) {
                            ForEach(items) { item in
                                LineItemView(item: item)
                            }
                        }
                    }
                }
                Spacer()
                navigationBar
            }
            .navigationBarTitle(Text("Mike's Movers"), displayMode: .inline)
            .navigationBarHidden(false)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct NewItemView : View {
    var body: some View {
        
        Button(action: {}) {
            HStack {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                Spacer()
                Text("New Stock Item")
                    .font(.caption)
                Spacer()
            }
        }
    }
}
struct LineItemView : View {
    @ObservedObject private var ordersManager = MMOrdersManager.shared
    var item: CLVModels.Ecomm.OrderItem
    var count : Int64 {
        return item.getQuantity() ?? 0
    }

    var body: some View {
        
        Button(action: {
            ordersManager.addItem(item: item)
        }) {
            HStack {
                ZStack {
                    Circle()
                        .fill((count) < 1 ? Color.white : Color.green)
                        .frame(width: 30, height: 30)
                    Text("\(count)")
                        .foregroundColor(count < 1 ? Color.black : Color.white)
                }
                Text(item.getDescription() ?? "Unknown")
                    .font(.caption)
                Spacer()
                Text(item.amountString)
            }
            
        }
        .onTapGesture {
            ordersManager.addItem(item: item)
        }
        .onLongPressGesture {
            print("long press")
            ordersManager.removeItem(item: item)
        }
    }
}



struct BuildOrderView_Previews: PreviewProvider {
    static var previews: some View {
        BuildOrderView()
    }
}
