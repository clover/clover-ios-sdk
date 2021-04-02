//
//  SelectCustomerView.swift
//  Merchant Example
//
//  Created by Eric Rowe on 12/7/20.
//

import SwiftUI
import CloverREST
import Combine

struct SelectCustomerView: View {
    @SwiftUI.Environment(\.presentationMode) var presentationMode
    @Binding var rootIsActive : Bool
    @ObservedObject private var customersManager = MMCustomersManager.shared

    
    var body: some View {
        List {
            Section(header: Text("Existing Customers")) {
                ForEach(customersManager.customers) { customer in
                    if let id = customer.id {
                        IndividualCustomerView(customerId: id, name: buildName(customer), phone:customer.getPhone(), email: customer.getEmail(), rootIsActive: $rootIsActive)
                    }
                }
            }
        }
    }
    func buildName(_ customer:Clover.Customers.Customer) -> String {
        if let name = customer.getName() { return name }
        return "\(customer.getFirstName() ?? "") \(customer.getLastName() ?? "")"
    }
    
    
    struct IndividualCustomerView : View {
        @SwiftUI.Environment(\.presentationMode) var presentationMode
        var customerId: String
        var name: String
        var phone: String?
        var email: String?
        @Binding var rootIsActive : Bool
        
        


        var body: some View {
            HStack {
                NavigationLink(destination:EditCustomerView(customer: MMCustomersManager.shared.getCustomer(id:customerId), rootIsActive: $rootIsActive)) {
                    customerView(customerId:customerId, name: name, phone: phone ?? "")
                }
                .isDetailLink(false)
            }
        }

        struct customerView: View {
            var customerId: String
            var name: String
            var phone: String
            var body: some View {
                VStack {
                    HStack {
                        Text(name)
                            .font(.headline)
                        Spacer()
                        Text(phone)
                    }
                    HStack {
                        Spacer()
                        Text(customerId)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
        }

    }
    
    
    
    struct NewCustomerView : View {
        var body: some View {
            HStack {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                Spacer()
                Text("Add Customer")
                    .font(.caption)
                Spacer()
            }
        }
    }
}
