//
//  CustomerView.swift
//  Merchant Example
//
//  Created by Eric Rowe on 2/1/21.
//

import SwiftUI
import CloverREST

struct CustomerView: View {
    let customer:Clover.Customers.Customer
    
    var body: some View {
        List {
            Section(header: Text("Customer: \(customer.id ?? "")")) {
                ForEach(0..<8) { item in
                    switch item {
                    case 0: ItemView(title: "First Name", value: buildVariantStringString(customer.firstName))
                    case 1: ItemView(title: "Last Name", value: buildVariantStringString(customer.lastName))
                    case 2: ItemView(title: "Marketing Allowed", value: buildBoolString(customer.marketingAllowed))
                    case 3: ItemView(title: "Customer Since", value: buildTimeString(customer.customerSince))
                    case 4: ItemView(title: "Address", value: buildAddress(customer.addresses?.first))
                    case 5: ItemView(title: "Email", value: buildEmails(customer.emailAddresses))
                    case 6: ItemView(title: "Phone", value: buildPhones(customer.phoneNumbers))
                    case 7: ItemView(title: "Cards", value: buildCardsString(customer.cards))
                    default: Spacer()
                    }
                }
            }
        }
    }
}

fileprivate struct ItemView:View {
    let title:String
    let value:String?
    var body: some View {
        VStack(alignment: .leading) {
            Text(value ?? "")
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
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
fileprivate func buildEmails(_ emails: [CLVModels.Customers.EmailAddress]?) -> String {
    guard let emails = emails else { return "" }
    var returnVal = ""
    for email in emails {
        if let email = email.emailAddress {
            if returnVal.count > 0 { returnVal += "\n" }
            returnVal += email
        }
    }
    return returnVal
}
fileprivate func buildPhones(_ phones: [CLVModels.Customers.PhoneNumber]?) -> String {
    guard let phones = phones else { return "" }
    var returnVal = ""
    for phone in phones {
        if let phone = phone.phoneNumber {
            if returnVal.count > 0 { returnVal += "\n" }
            returnVal += phone
        }
    }
    return returnVal
}
