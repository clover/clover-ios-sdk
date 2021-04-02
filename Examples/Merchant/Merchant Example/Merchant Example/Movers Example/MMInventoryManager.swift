//
//  MMInventoryManager.swift
//  Merchant Example
//
//  Created by Eric Rowe on 12/14/20.
//

import Foundation
import CloverREST
import Combine

class MMInventoryManager : ObservableObject {
    static let shared = MMInventoryManager()
    private init() {
        if let savedItems = UserDefaults.standard.array(forKey: "MM_InventoryItems") as? [CLVModels.Ecomm.OrderItem] {
            for item in savedItems {
                stockItems.append((item,true))
            }
        }
    }
    
    
    public var stockItems = [(item:CLVModels.Ecomm.OrderItem,save:Bool)]()
    
    public func loadDemo() {
        addStockItem(CLVModels.Ecomm.OrderItem(description:"Labor Hours", amount: 5000, quantity: 1, type: .sku), save: false)
        addStockItem(CLVModels.Ecomm.OrderItem(description:"Miles, 100", amount: 10000, quantity: 1, type: .sku), save: false)
        addStockItem(CLVModels.Ecomm.OrderItem(description:"Boxes, Case of 25", amount: 10000, quantity: 1, type: .sku), save: false)
        addStockItem(CLVModels.Ecomm.OrderItem(description:"Moving Blanket", amount: 500, quantity: 1, type: .sku), save: false)
    }
    
    public func addStockItem(_ item:CLVModels.Ecomm.OrderItem, save:Bool=true) {
        stockItems.append((item,save))
        saveItems()
    }
    private func saveItems() {
        let toBeSaved:[CLVModels.Ecomm.OrderItem] = stockItems.map({ if $0.save { return $0.item } else { return nil }}).compactMap( { $0 })
        UserDefaults.standard.set(toBeSaved, forKey: "MM_InventoryItems")
        UserDefaults.standard.synchronize()
    }
}


// TODO move this to the SDK and out of the example
extension CLVModels.Ecomm.OrderItem : Identifiable {
    
    convenience init(description:String, amount:Int64, currency:String="USD",quantity:Int64, type:CLVModels.Ecomm.item_type) {
        self.init()
        // Total amount for the items in the smallest monetary unit of the merchant's currency
        self.amount = CLVModels.Variant(amount)
        // Three-letter ISO 4217 currency code (in lowercase)
        self.currency = CLVModels.Variant(currency)
        // User-facing description of the item (for example, "water bottle" or "candy"). This can also describe non-SKU items such as taxes or shipping methods.
        self.description_ = CLVModels.Variant(description)
        // If the type is sku, the number of instances of parent for the line item
        self.quantity = CLVModels.Variant(quantity)
        // Line item type
        self.type_ = type
    }
    
    public func copy(unitQuantity:Int64) -> CLVModels.Ecomm.OrderItem {
        let newItem = CLVModels.Ecomm.OrderItem()
        newItem.amount = CLVModels.Variant(self.amount?.object as? Int64 ?? 0)
        newItem.currency = CLVModels.Variant(self.currency?.object as? String ?? "")
        newItem.description_ = CLVModels.Variant(self.description_?.object as? String ?? "")
        newItem.quantity = CLVModels.Variant(unitQuantity)
        newItem.type_ = type_
        return newItem
    }
    
    public func getAmount() -> Int64? {
        return amount?.object as? Int64
    }
    public func getCurrency() -> String? {
        return currency?.object as? String
    }
    public func getDescription() -> String? {
        return description_?.object as? String
    }
    public func getQuantity() -> Int64? {
        return quantity?.object as? Int64
    }
    public func setQuantity(val:Int64) {
        quantity = CLVModels.Variant(val)
    }
    public func incrementQuantity() {
        quantity = CLVModels.Variant((getQuantity() ?? 0) + 1)
    }
    public func decrementQuantity() {
        var new = (getQuantity() ?? 0) - 1
        if new < 0 { new = 0 }
        quantity = CLVModels.Variant(new)
    }
}
