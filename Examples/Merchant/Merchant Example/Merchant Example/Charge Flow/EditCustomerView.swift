//
//  EditCustomerView.swift
//  Merchant Example
//
//  Created by Eric Rowe on 2/24/21.
//

import SwiftUI
import CloverREST

struct EditCustomerView: View {
    init(customer:Clover.Customers.Customer? = nil, rootIsActive:Binding<Bool>) {
        
        if customer == nil {
            self.customer = Clover.Customers.Customer()
            self.customerNew = true
        } else {
            self.customer = customer!
            self.customerNew = false
        }
        self._rootIsActive = rootIsActive
        if self.customer.firstName == nil {
            self.customer.firstName = CLVModels.Variant("")
        }
        if self.customer.lastName == nil {
            self.customer.lastName = CLVModels.Variant("")
        }
        if self.customer.emailAddresses == nil {
            self.customer.emailAddresses = [CLVModels.Customers.EmailAddress]()
        }
        if self.customer.emailAddresses!.count == 0 {
            self.customer.emailAddresses?.append(CLVModels.Customers.EmailAddress(email: ""))
        }
        if self.customer.phoneNumbers == nil {
            self.customer.phoneNumbers = [CLVModels.Customers.PhoneNumber]()
        }
        if self.customer.phoneNumbers!.count == 0 {
            self.customer.phoneNumbers?.append(CLVModels.Customers.PhoneNumber(phoneNumber: ""))
        }
        
        // Set the initial value of the emailValid state var to the current email validity, which we're defining in this example as the presense of any single email address in the account.  For the example, we do not validate the email addresses, just look for something that's not blank.
        _emailValid = State(initialValue: self.customer.getEmail() != nil)
    }
    let customerNew:Bool
    let customer:Clover.Customers.Customer
    @Binding var rootIsActive : Bool
    
    // We have to have a valid email address to use the Ecomm Order Payment endpoint.  In this example, I'm enforcing that by using any single valid email address in the customer's account, and then tying that out using this State var to the Continue button state, as well as a Required warning on the UI.
    @State var emailValid: Bool
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Customer: \(customer.id ?? "")")) {
                    if let name = customer.getName(), name != "" {
                        Text(name)
                    } else {
                        ForEach(0..<2) { item in
                            switch item {
                                case 0: VariantView(title: "First Name", field: customer.firstName!)
                                case 1: VariantView(title: "Last Name", field: customer.lastName!)
                                default: Spacer()
                            }
                        }
                    }
                }
                Section(header: EmailHeaderView(emailValid: $emailValid)) {
                    ForEach(0..<customer.emailAddresses!.count) { item in
                        if item < customer.emailAddresses!.count {
                            EmailView(title: "Email \(item)", field: customer.emailAddresses![item], didChange: {
                                // whenever the value changes (tied through the .onChange of the field), we'll update the overall email validity State
                                emailValid = customer.getEmail() != nil
                            })
                        }
                    }
                }
                Section(header: Text("Phone Numbers")) {
                    ForEach(0..<customer.phoneNumbers!.count) { item in
                        if item < customer.phoneNumbers!.count {
                            PhoneView(title: "Phone \(item)", field: customer.phoneNumbers![item])
                        }
                    }
                }
            }
            Spacer()
            NavigationLink(
                // Once we have a valid customer (i.e. a customer with an email address), then we'll move on to the ChargeView to take the credit card.
                destination: ChargeView(customer: customer, customerChanged: true, customerNew: customerNew, rootIsActive: $rootIsActive)) {
                Text("Continue")
            }.disabled(!emailValid) // tie the email validity State to the disabled state of the button
        }
    }
}

fileprivate struct EmailHeaderView:View {
    @Binding var emailValid:Bool
    var body: some View {
        Text("Email Addresses")
        if !emailValid {
            Text("required")
                .font(.system(size: 12, weight: .light, design: .serif))
                .italic()
                .foregroundColor(Color.red)
        }
    }
}
fileprivate struct EditView:View {
    var body: some View {
        Spacer()
    }
}
fileprivate struct VariantView:View {
    init(title:String, field:CLVModels.Variant) {
        self.title = title
        self.field = field
        self._value = State(initialValue: field.object as? String ?? "")
    }
    let field:CLVModels.Variant
    let title:String
    @State var value:String
    var body: some View {
        VStack(alignment: .leading) {
            TextField(title, text: $value)
                .onChange(of: value) { newValue in
                    self.field.object = newValue
                }
        }
    }
}
fileprivate struct EmailView:View {
    init(title:String, field:CLVModels.Customers.EmailAddress, didChange:@escaping ()->()) {
        self.didChange = didChange
        self.title = title
        self.field = field
        
        // We tie the initival value of the State value to the current value of this email address  Then down below in the .onChange of value we write the value back out.
        self._value = State(initialValue: field.emailAddress ?? "")
    }
    let field:CLVModels.Customers.EmailAddress
    let title:String
    @State var value:String
    let didChange:()->()
    var body: some View {
        VStack(alignment: .leading) {
            TextField(title, text: $value)
                .onChange(of: value) { newValue in
                    self.field.emailAddress = newValue  // Here we're setting the object's value based on the State value
                    didChange()
                }
            if let id = field.id { // For this example, display the ID of the entry for debugging purposes.  You likely won't want to do this in a production app as this is unnecessary information for the user.
                Text(id)
                    .font(.system(size: 10, weight: .light, design: .serif))
                    .italic()
                    .foregroundColor(Color.gray)
            }
        }
    }
}
fileprivate struct PhoneView:View {
    init(title:String, field:CLVModels.Customers.PhoneNumber) {
        self.title = title
        self.field = field
        
        // We tie the initival value of the State value to the current value of this phone number.  Then down below in the .onChange of value we write the value back out.
        self._value = State(initialValue: field.phoneNumber ?? "")
    }
    let field:CLVModels.Customers.PhoneNumber
    let title:String
    @State var value:String = ""
    var body: some View {
        VStack(alignment: .leading) {
            TextField(title, text: $value)
                .onChange(of: value) { newValue in
                    self.field.phoneNumber = newValue  // Here we're setting the object's value based on the State value
                }
            if let id = field.id { // For this example, display the ID of the entry for debugging purposes.  You likely won't want to do this in a production app as this is unnecessary information for the user.
                Text(id)
                    .font(.system(size: 10, weight: .light, design: .serif))
                    .italic()
                    .foregroundColor(Color.gray)
            }
        }
    }
}
fileprivate struct ItemView:View {
    let title:String
    @State var value:String
    var body: some View {
        VStack(alignment: .leading) {
            TextField(title, text: $value)
                .onChange(of: value) { newValue in
                    
                }
        }
    }
}

fileprivate func buildCardsString(_ cards:[CLVModels.Customers.Card]?) -> String {
    guard let cards = cards else { return "" }
    var returnVal = ""
    for card in cards {
        returnVal += buildCardString(card)
        returnVal += "\n"
    }
    return returnVal
}
fileprivate func buildCardString(_ card:CLVModels.Customers.Card) -> String {
    var cardNumber = ""
    if let cardFirstSix = card.first6 {
        cardNumber = "\(cardFirstSix[0..<4]) \(cardFirstSix[4..<6])** **** "
    } else {
        cardNumber = "**** **** **** "
    }
    if let cardLast4 = card.last4 {
        cardNumber += "\(cardLast4)"
    } else {
        cardNumber += "****"
    }
    return cardNumber
}
fileprivate func buildVariantStringString(_ variantString:CLVModels.Variant?) -> String {
    return variantString?.object as? String ?? ""
}
fileprivate func buildBoolString(_ bool:Bool?) -> String {
    guard let bool = bool else { return "" }
    return bool ? "YES" : "NO"
}
fileprivate func buildTimeString(_ created:Int64?) -> String {
    guard let created = created else { return "" }
    let date = Date(timeIntervalSince1970: Double(created))
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .full
    return formatter.string(from: date)
}
fileprivate func buildAddress(_ address: CLVModels.Customers.Address?) -> String {
    guard let address = address else { return "" }
    var returnVal = ""
    if let line1 = address.address1 { returnVal += line1 }
    if let line2 = address.address2 { returnVal += ("\n" + line2) }
    if let line3 = address.address3 { returnVal += ("\n" + line3) }
    if let city = address.city { returnVal += ("\n" + city) }
    if let state = address.state { returnVal += (", " + state) }
    if let zip = address.zip { returnVal += (" " + zip) }
    return returnVal
}
