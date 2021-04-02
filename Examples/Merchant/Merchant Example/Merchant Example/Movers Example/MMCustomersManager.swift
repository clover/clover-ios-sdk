//
//  MMCustomersManager.swift
//  Merchant Example
//
//  Created by Eric Rowe on 12/3/20.
//
/*  Manager to support the get and set operations of the Customers objects.
    There are two definitions of the Customer objects that we need to be aware of:
       V1: Ecomm.Customers.Customer
              -- Allows the Creation, Update, and Revokation of card from a Customer.  Does not allow Gets or Deletes.
              -- Used by the rest of the Ecomm payment flows
              -- Since this does not allow Gets, we'll use the V3 objects as backing, and provide some glue logic here.
       V3: Customer.Customers.Customer
              -- Allows the Creation, Update, Delete, etc. for Customer objects.
              -- Used as the data backing our Customer objects that we use locally.
              -- Whenver we make a V1 call, we'll follow up with a V3 call to update the data store.
  
   This example does not implement Persistant Data Storage.  In your production app, please persist this data in whatever data store you choose, and only pull updates based on the update timestamps on the records returned.
 */

import Foundation
import CloverREST
import Combine

class MMCustomersManager: ObservableObject {
    static let shared = MMCustomersManager()
    private init() {
//        MMDemoManager.deleteCustomers()
//        MMDemoManager.injectDemoCustomers()
        do {
            #if DEBUG
            if Clover.APIManager.shared.logLevel > 0 {
                NSLog("Fetching Customers List")
            }
            #endif
            try Clover.Customers.Customer.Get(
                success: { customers in
                    #if DEBUG
                    if Clover.APIManager.shared.logLevel > 0 {
                        NSLog("Fetching Individual Customers")
                    }
                    #endif
                    DispatchQueue.main.async {
                        self.customers = customers
                        for (index, customer) in customers.enumerated() {
                            if let id = customer.id {
                                do {
                                    try Clover.Customers.Customer.Get(
                                        customerId: id,
                                        success: { [weak self] customer in
                                            guard let self = self else { return }
                                            DispatchQueue.main.async {
                                                guard index < self.customers.count else { return }
                                                self.customers[index] = customer
                                            }
                                        },
                                        failure: { data, response, error in
                                            #if DEBUG
                                            if Clover.APIManager.shared.logLevel > 2 {
                                                if let data = data, let string = String(data: data, encoding: .utf8) {
                                                    print(string)
                                                }
                                            }
                                            #endif
                                        })
                                } catch {
                                    print(error)
                                }
                            }
                        }
                    }
                },
                failure: { data, re, error in })
        } catch {
            print(error)
        }
    }
    
    public func getCustomer(id:String) -> Clover.Customers.Customer {
        return customers.first(where: { $0.id == id })!
    }

    /*
     Contains a copy of the Customer list from the Clover servers
     Will be automatically updated on launch, and is not stored locally.  In your implementation, you probably want to cache this.
     Expectation: When updating a customer object, edit the object in this array directly.  Then call updateCustomer(customerId) to push the changes up to the Clover database.
     Expectation: When adding a customer object, create a new customer and then call addCustomer(Customer) passing in your new object.  It will be added to the array locally and pushed up to the Clover database.
     */
    @Published var customers = [Clover.Customers.Customer]()
    
    func addCustomer(
        /// first/given name of customer.
        firstName:String? = nil,
        /// last name/sur name of customer.
        lastName:String? = nil,
        /// Full name of customer.
        name:String? = nil,
        /// Email address.
        email:String? = nil,
        /// Billing phone number.
        phone:String? = nil,
        /// Shipping information such as customer name and address
        shipping:CLVModels.Ecomm.Shipping? = nil,
        /// A payment source to be associated with this customer. This can be a token
        source:String? = nil,
        /// Customer Business Name
        businessName: String? = nil,
        /// This is an optional value. This field indicates whether it's ECOMM, MOTO or RECURRING transaction
        ecomind: CLVModels.Ecomm.EcommerceIndicator? = .ecom) -> Bool {
        do {
            try Clover.Ecomm.Customer.Create(
                firstName: firstName,
                lastName: lastName,
                name: name,
                email: email,
                phone: phone,
                shipping: shipping,
                source: source,
                businessName: businessName,
                ecomind: ecomind,
                success: { customer in
                    guard let customerId = customer.id else { return }
                    try? Clover.Customers.Customer.Get(
                        customerId: customerId,
                        success: { [weak self] customer in
                            DispatchQueue.main.async {
                                self?.customers.append(customer)
                            }
                        },
                        failure: { data, response, error in })
                },
                failure: { data, response, error in })
            return true
        } catch {
            return false
        }
    }
    func updateCustomer(customer:Clover.Ecomm.Customer) -> Bool {
        do {
            try customer.Update(
                success: { customer in
                    // We're using the result of the V3 Customer calls in our backing data for this example.  The customer object returned from this call is a V1 Customer object, so rather than saving it off directly let's poll for a V3 object instead.
                    guard let customerId = customer.id else { return }
                    try? Clover.Customers.Customer.Get(
                        customerId: customerId,
                        success: { [weak self] customer in
                            guard let self = self else { return }
                            DispatchQueue.main.async {
                                if let index = self.customers.firstIndex(of: customer) {
                                    self.customers[index] = customer
                                } else {
                                    self.customers.append(customer)
                                }
                            }
                        },
                        failure: { data, response, error in })
                },
                failure: { data, response, error in })
            return true
        } catch {
            // TODO - print out some better error handling here
            return false
        }
    }
    
    func addCustomer(customer: Clover.Customers.Customer,
                     success: @escaping (Clover.Customers.Customer) -> Void,
                     failure: @escaping (Data?, URLResponse?, Error?) -> Void) -> Bool {
        do {
            try Clover.Customers.Customer.Create(
                customer: customer,
                success: { customer in
                    DispatchQueue.main.async {
                        self.customers.append(customer)
                    }
                    success(customer)
                },
                failure: { data, response, error in
                    failure(data, response, error)
            })
        } catch {
            return false
        }
        return true
    }
    func updateCustomer(customer:Clover.Customers.Customer,
                        success: @escaping (Clover.Customers.Customer) -> Void,
                        failure: @escaping (Data?, URLResponse?, Error?) -> Void) -> Bool {
        do {
            try customer.Update(
                success: { customer in
                    // We're using the result of the V3 Customer calls in our backing data for this example.  The customer object returned from this call is a V1 Customer object, so rather than saving it off directly let's poll for a V3 object instead.
                    guard let customerId = customer.id else { return }
                    try? Clover.Customers.Customer.Get(
                        customerId: customerId,
                        success: { [weak self] customer in
                            guard let self = self else { return }
                            DispatchQueue.main.async {
                                if let index = self.customers.firstIndex(of: customer) {
                                    self.customers[index] = customer
                                } else {
                                    self.customers.append(customer)
                                }
                                success(customer)
                            }
                        },
                        failure: { data, response, error in
                            failure(data, response, error)
                        })
                },
                failure: { data, response, error in
                    failure(data, response, error)
                })
            return true
        } catch {
            // TODO - print out some better error handling here
            return false
        }
    }
    func addCard(customer:Clover.Customers.Customer,
                 card:CLVModels.Customers.Card,
                 success: @escaping (Clover.Customers.Customer) -> Void,
                 failure: @escaping (Data?, URLResponse?, Error?) -> Void) -> Bool {
        do {
            try customer.AddCard(
                card: card,
                success: { card in
                    // We're using the result of the V3 Customer calls in our backing data for this example.  The customer object returned from this call is a V1 Customer object, so rather than saving it off directly let's poll for a V3 object instead.
                    
                    guard let customerId = customer.id else { return }
                    try? Clover.Customers.Customer.Get(
                        customerId: customerId,
                        success: { [weak self] customer in
                            guard let self = self else { return }
                            DispatchQueue.main.async {
                                if let index = self.customers.firstIndex(of: customer) {
                                    self.customers[index] = customer
                                } else {
                                    self.customers.append(customer)
                                }
                                success(customer)
                            }
                        },
                        failure: { data, response, error in
                            failure(data, response, error)
                        })
                },
                failure: { data, response, error in
                    failure(data, response, error)
                })
            return true
        } catch {
            // TODO - print out some better error handling here
            return false
        }
    }
}
