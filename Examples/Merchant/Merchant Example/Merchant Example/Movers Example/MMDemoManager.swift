//
//  MMDemoManager.swift
//  Merchant Example
//
//  Created by Eric Rowe on 12/14/20.
//

import Foundation
import CloverREST

class MMDemoManager {
    static let shared = MMDemoManager()
    private init() {
        MMInventoryManager.shared.loadDemo()
    }
    
    public static func deleteCustomers() {
        try? Clover.Customers.Customer.Get(
            success: { customers in
                for id in customers.compactMap( { $0.id }) {
                    try? Clover.Customers.Customer.Delete(customerId: id, completionHandler: { data, response, error in
                        if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                            print("Delete \(id) - SUCCESS")
                        } else {
                            print("Delete \(id) -           FAIL")
                        }
                    })
                }
            },
            failure: { data, response, error in })
    }
    // Injects demo data into the customer database for use by the demo system
    public static func injectDemoCustomers() {
        try? Clover.Customers.Customer.Create(
            customer: Clover.Customers.Customer(firstName: "Yon", lastName: "Yonson", phoneNumber: "715-853-7077", email: "mynameisyonyonson@example.com", address1: "815 North St", address2: nil, address3: nil, city: "Bonduel", state: "WI", zip: "54107"),
            success: { customer in }, failure: { data, response, error in })
        try? Clover.Customers.Customer.Create(
            customer: Clover.Customers.Customer(firstName: "Stan", lastName: "Bricks", phoneNumber: "719-555-0101", email: "stanmeister23@example.com", address1: "203 N. 18th St", address2: nil, address3: nil, city: "Colorado Springs", state: "CO", zip: "80904"),
            success: { customer in }, failure: { data, response, error in })
        try? Clover.Customers.Customer.Create(
            customer: Clover.Customers.Customer(firstName: "Becca", lastName: "Blevins", phoneNumber: "719-555-0102", email: "becca.blevins@example.com", address1: "8420 Freemantle Dr", address2: nil, address3: nil, city: "Colorado Springs", state: "CO", zip: "80920"),
            success: { customer in }, failure: { data, response, error in })
        try? Clover.Customers.Customer.Create(
            customer: Clover.Customers.Customer(firstName: "John Q.", lastName: "Pilot", phoneNumber: "719-555-0103", email: "iamawesomerthaneveryone@example.org", address1: "5217 Barnstormers Ave", address2: nil, address3: nil, city: "Colorado Springs", state: "CO", zip: "80911"),
            success: { customer in }, failure: { data, response, error in })
    }
}
