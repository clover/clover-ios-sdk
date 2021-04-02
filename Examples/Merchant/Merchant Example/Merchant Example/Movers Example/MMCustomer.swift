//
//  MMCustomer.swift
//  Ecomm Merchant Example
//
//  Created by Eric Rowe on 10/26/20.
//

import Foundation
import CloverREST

extension Clover.Customers.Customer {
    convenience init(firstName:String, lastName:String, phoneNumber:String, email:String, address1: String, address2: String? = nil, address3: String? = nil, city: String, state: String, country: String = "US", zip: String) {
        self.init()
        self.firstName = CLVModels.Variant(firstName)
        self.lastName = CLVModels.Variant(lastName)
        self.addresses = [CLVModels.Customers.Address(address1: address1, address2: address2, address3: address3, city: city, state: state, country: country, zip: zip)]
        self.phoneNumbers = [CLVModels.Customers.PhoneNumber(phoneNumber: phoneNumber)]
        self.emailAddresses = [CLVModels.Customers.EmailAddress(email: email)]
    }
    func buildName() -> String {
        var name = ""
        if let firstName = firstName?.object as? String {
            name += firstName
        }
        if let lastName = lastName?.object as? String {
            if name.count > 0 { name += " " }
            name += lastName
        }
        return name
    }
}

extension CLVModels.Customers.Address {
    convenience init(address1: String, address2: String? = nil, address3: String? = nil, city: String, state: String, country: String, zip: String) {
        self.init()
        self.address1 = address1
        self.address2 = address2
        self.address3 = address3
        self.city = city
        self.state = state
        self.country = country
        self.zip = zip
    }
}
extension CLVModels.Customers.PhoneNumber {
    convenience init(phoneNumber: String) {
        self.init()
        self.phoneNumber = phoneNumber
    }
}
extension CLVModels.Customers.EmailAddress {
    convenience init(email: String) {
        self.init()
        self.emailAddress = email
    }
}
