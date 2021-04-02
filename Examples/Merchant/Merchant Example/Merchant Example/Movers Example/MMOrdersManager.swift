//
//  MMOrdersManager.swift
//  Merchant Example
//
//  Created by Eric Rowe on 12/11/20.
//

import Foundation
import CloverREST
import Combine

class MMOrdersManager: ObservableObject {
    static let shared = MMOrdersManager()
    
    private init() {
        getOrders()
    }
    
    private func getOrders(startingAfter:String?=nil,limit:Int32=100,continueDownloading:Bool=true) {
        #if DEBUG
        if Clover.APIManager.shared.logLevel > 0 {
            NSLog("Fetching Orders List")
        }
        #endif
        try? Clover.Ecomm.Order.Get(
            limit: limit > 100 ? 100 : limit,
            starting_after: startingAfter,
            success: { orders, hasMore in
                #if DEBUG
                if Clover.APIManager.shared.logLevel > 0 {
                    NSLog("Fetching Individual Orders")
                }
                #endif
                for order in orders {
                    if let id = order.id {
                        try? Clover.Ecomm.Order.Get(
                            id: id,
                            success: { order in
                                self.addOrUpdate(order)
                            },
                            failure: { data, response, error in })
                    }
                }
                if continueDownloading, let hasMore = hasMore, hasMore, let lastOrder = orders.last, let id = lastOrder.id {
                    self.getOrders(startingAfter: id)
                }
            },
            failure: { data, response, error in }
        )
    }
    public func getOrder(id:String) {
        try? Clover.Ecomm.Order.Get(
            id: id,
            success: { order in
                self.addOrUpdate(order)
            },
            failure: { data, response, error in })
    }
    
    @Published var orders:[Clover.Ecomm.Order] = [Clover.Ecomm.Order]()
    func addOrUpdate(_ order:Clover.Ecomm.Order) {
        DispatchQueue.main.async{ [weak self] in
            guard let self = self else { return }
            if let index = self.orders.firstIndex(where: { $0.id == order.id } ) {
                self.orders[index] = order
                return
            }
            self.orders.append(order)
        }
    }
    
    
    @Published var newOrder:Clover.Ecomm.Order = Clover.Ecomm.Order()
    func createNewBlankOrder(overwriteExisting:Bool = false) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if overwriteExisting {
                self.newOrder = Clover.Ecomm.Order()
            }
            if self.newOrder.items == nil {
                self.newOrder.items = [CLVModels.Ecomm.OrderItem]()
                for item in MMInventoryManager.shared.stockItems {
                    self.newOrder.items?.append(item.item.copy(unitQuantity: 0))
                }
            }
            self.objectWillChange.send()
        }
    }
    func addItem(item:CLVModels.Ecomm.OrderItem) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.createNewBlankOrder()
            if let item = self.newOrder.items?.first(where: { $0 == item }) {
                item.incrementQuantity()
            } else {
                self.newOrder.items?.append(item.copy(unitQuantity: 1))
            }
            self.objectWillChange.send()
        }
    }
    func removeItem(item:CLVModels.Ecomm.OrderItem) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.createNewBlankOrder()
            if let item = self.newOrder.items?.first(where: { $0 == item }) {
                item.decrementQuantity()
            }
            self.objectWillChange.send()
        }
    }
}

// TODO - this might need to be moved into the SDK
extension CLVModels.Ecomm.OrderItem : Equatable {
    public static func == (lhs: CLVModels.Ecomm.OrderItem, rhs: CLVModels.Ecomm.OrderItem) -> Bool {
        return lhs.description_?.object as? String == rhs.description_?.object as? String
    }
    public var amountString:String {
        guard let amount = amount?.object as? Int64 else { return "$0.00" }
        let dollars:Double = Double(amount) / 100.0
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: dollars)) ?? "$0.00"
    }
}
