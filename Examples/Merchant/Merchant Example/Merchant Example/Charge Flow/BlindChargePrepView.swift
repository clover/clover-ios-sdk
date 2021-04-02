//
//  ChargeView.swift
//  Ecomm Merchant Example
//
//  Created by Eric Rowe on 11/4/20.
//

import SwiftUI
import CloverREST

struct BlindChargePrepView: View {
    @State var firstName:String = ""
    @State var lastName:String = ""
    @State var phone:String = ""
    @State var email:String = ""
    @State var note:String = ""
    @State var amount:String = ""
    @Binding var rootIsActive : Bool
    
    var navigationBar: some View {
        VStack(spacing: 0) {
            Divider()
            HStack {
                Spacer()
                NavigationLink(destination: BlindChargeView(firstName: firstName, lastName: lastName, phone: phone, email: email, note: note, amount: amount, rootIsActive: $rootIsActive)) {
                    Text("Charge")
                }
                Spacer()
            }.frame(height: 45)
            Divider()
        }
    }
    
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                Text("Use this page to charge a customer without an order.")
                Spacer()
                Text("Customer")
                VStack {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Phone", text: $phone)
                    TextField("Email", text: $email)
                }
                Spacer()
                TextField("Note", text: $note)
                    .frame(maxWidth: .infinity, minHeight: 100, alignment: .leading)
                TextField("Amount", text: $amount)
                Spacer()
            }
            .padding()
            navigationBar
        }
        .navigationBarTitle(Text("Charge"), displayMode: .inline)
        .navigationBarHidden(false)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


