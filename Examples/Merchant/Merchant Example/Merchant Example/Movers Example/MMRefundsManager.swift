//
//  MMRefundsManager.swift
//  Merchant Example
//
//  Created by Eric Rowe on 2/2/21.
//

import Foundation
import CloverREST
import Combine

public class MMRefundsManager: ObservableObject {
    public static let shared = MMRefundsManager()
    private init() {
        getRefunds()
    }
    
    private func getRefunds(startingAfter:String?=nil,limit:Int32=100,continueDownloading:Bool=true) {
        try? Clover.Ecomm.Refund.Get(
            limit: limit > 100 ? 100 : limit,
            startingAfter: startingAfter,
            success: { refunds in
                for refund in refunds {
                    if let id = refund.id {
                        try? Clover.Ecomm.Refund.Get(id: id, success: {refund in
                            self.addOrUpdate(refund)
                        }, failure: { data, response, error in })
                    }
                }
                // Refunds doesn't support the hasMore flag, so we'll check if we got exactly the amount we asked for and use that to decide if we'll ask for more.
                if continueDownloading, refunds.count == limit, let last = refunds.last, let id = last.id {
                    self.getRefunds(startingAfter: id)
                }
            },
            failure: { data, response, error in }
        )
    }
    public func getRefund(id:String) {
        try? Clover.Ecomm.Refund.Get(id: id, success: {refund in
            self.addOrUpdate(refund)
        }, failure: { data, response, error in })
    }
    
    
    @Published var refunds:[Clover.Ecomm.Refund] = [Clover.Ecomm.Refund]()
    func addOrUpdate(_ refund:Clover.Ecomm.Refund) {
        // Be sure and make updates to the @Published on the main thread because SwiftUI isn't smart enough to do that for us
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if let index = self.refunds.firstIndex(where: { $0.id == refund.id } ) {
                self.refunds[index] = refund
                return
            }
            self.refunds.append(refund)
        }
    }
}
