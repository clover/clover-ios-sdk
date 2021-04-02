//
//  MMChargesManager.swift
//  Merchant Example
//
//  Created by Eric Rowe on 12/3/20.
//

import Foundation
import CloverREST
import Combine

class MMChargesManager: ObservableObject {
    public static let shared = MMChargesManager()
    private init() {
        getCharges()
    }
    
    func createCharge(amount:Int64) {
        guard let token = Clover.OAuthTokenManager.shared.token else { return }
        do {
            try Clover.Ecomm.Charge.Create(
                token: token,
                amount: amount,
                currency: "usd",
                capture: true,
                success: { [weak self] charge in
                    guard let self = self else { return }
                    self.addOrUpdate(charge)
                },
                failure: { data, response, error in })
        } catch {
            // TODO - provide some example code for error codes
            print ("\(error)")
        }
    }
    
    private func getCharges(startingAfter:String?=nil,limit:Int32=100,continueDownloading:Bool=true) {
        try? Clover.Ecomm.Charge.Get(
            limit: limit > 100 ? 100 : limit,
            startingAfter: startingAfter,
            success: { charges, hasMore in
                for charge in charges {
                    if let id = charge.id {
                        try? Clover.Ecomm.Charge.Get(
                            id: id,
                            success: {charge in
                                self.addOrUpdate(charge)
                            },
                            failure: { data, response, error in })
                    }
                }
                if continueDownloading, let hasMore = hasMore, hasMore, let lastCharge = charges.last, let id = lastCharge.id {
                    self.getCharges(startingAfter: id)
                }
            },
            failure: { data, response, error in }
        )
    }
    public func getCharge(id:String) {
        try? Clover.Ecomm.Charge.Get(
            id: id,
            success: { order in
                self.addOrUpdate(order)
            },
            failure: { data, response, error in })
    }
    
    
    @Published var charges:[Clover.Ecomm.Charge] = [Clover.Ecomm.Charge]()
    func addOrUpdate(_ order:Clover.Ecomm.Charge) {
        // Be sure and make updates to the @Published on the main thread because SwiftUI isn't smart enough to do that for us
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if let index = self.charges.firstIndex(where: { $0.id == order.id } ) {
                self.charges[index] = order
                return
            }
            self.charges.append(order)
        }
    }
}
