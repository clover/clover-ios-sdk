//
//  BlindChargeView.swift
//  Ecomm Merchant Example
//
//  Created by Eric Rowe on 11/5/20.
//

import SwiftUI
import CloverREST

struct BlindChargeView: View {
    /// @State tied to @Binding in CloverChargeView that is used to trigger a card tokenization
    @State public var submit:Bool = false
    /// @State used to trigger whether the Submit button is showing as enabled
    @State public var isValid:Bool = false
    /// Tracking the horizontal size class to use in adjusting the frame size of the Credit Card iFrame
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var firstName:String
    var lastName:String
    var phone:String
    var email:String
    var note:String
    var amount:String
    
    @State var token:String? = nil
    @Binding var rootIsActive : Bool
    @State public var isProcessing = false

    var cardHeight:CGFloat {
        return horizontalSizeClass == .compact ? 160 : 200
    }
    var amountString:String {
        let dollars = amountDouble
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: dollars)) ?? "$0.00"
    }
    var amountDouble:Double {
        return Double(amount.replacingOccurrences(of: "$", with: "")) ?? 0.0
    }
    var amountInt64:Int64 {
        return Int64(amountDouble * 100)
    }
    
    
    var body: some View {
        LoadingView(isShowing: $isProcessing) {
            VStack(alignment: .leading) {
                VStack {
                    Text("Payment to")
                    HStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width:50, height:50)
                        Text("Mike's Movers")
                            .font(.title)
                    }
                    Divider()
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("\(firstName) \(lastName)")
                    Text(phone)
                    Text(email)
                    Text(note)
                    Text(amountString)
                }
                Spacer()
                VStack {
                    Spacer()
                    if Clover.OAuthTokenManager.shared.pakmsToken != nil {
                        Clover.ChargeView.SwiftUIView(
                            // This variable will be tracked by the CloverChargeView to trigger a submission of the Credit Card Data
                            submit: $submit,
                            onTokenResults: { results in
                                // Check that we got a token back.  In the case of a server error or validation failure of the card data, you may not get a token back.
                                token = results.results?.token
                                guard let token = token else {
                                    print("============================================= DID NOT RECEIVE TOKEN ===========================================")
                                    // TODO add an overlay stating an error and/or add to a queue to resubmit some time later
                                    // Should also check results to see if we should bother resubmitting or if it is an entry error
                                    // i.e. if the processor kicks it back as invalid, don't retry and tell the user about it,
                                    // but if we get a server error, then retry later.
                                    isProcessing = false
                                    return
                                }
                                print("============================================= RECEIVED TOKEN ===========================================")
                                print("Token: \(token)")
                                submitCharge()
                            },
                            isValid: $isValid)
                                .padding(.leading, 20).padding(.trailing, 20)
                                .frame(maxWidth:.infinity, minHeight:cardHeight, maxHeight: cardHeight)
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        if (isValid) {
                            Button(action: {
                                isProcessing = true
                                // Displays the processing overlay
                                if token != nil { // already have a token, so just resubmit the charge
                                    print("============================================= HAVE TOKEN ===========================================")
                                    submitCharge()
                                } else { // don't have a token, so set the submit @State to trigger tokenization
                                    print("============================================= SUBMITTING CARD ===========================================")
                                    // This is tied in via an @Binding in WebView to kick off the card tokenization
                                    // After the card is tokenized, we'll get the callback that we passed in above when we set up the Clover.ChargeView.SwiftUIView
                                    // In that callback, we'll then call submitCharge() to pay for the order with the token we got back on the card
                                    submit = true
                                }
                            }) {
                                Text("Submit Payment")
                                    .padding(6)
                                    .background(Color(red:0.133,green:0.533,blue:0))
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        } else {
                            Button(action: {
                                // TODO report the state of the validation here
                                // first need to save that off above
                            }) {
                                Text("Submit Payment")
                                    .padding(6)
                                    .background(Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                    }
                }
                
            }.padding()
            .navigationBarTitle(Text("Clover"), displayMode: .inline)
            .navigationBarHidden(false)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    func submitCharge() {
        guard let token = token else { return }
        print("============================================= SUBMITTING CHARGE ===========================================")
        do {
            // Automatically process the charge with the token returned.
            // In your implementation you may wish to separate the tokenization from the transaction processing.  In that case, simply store off the token for later use, and then call the Charge.Create call later when you are ready to process the transaction.
            let emailOrNil = email.isEmpty ? nil : email
            let customer = CLVModels.Ecomm.CustomerRequest(firstName: firstName, lastName: lastName, email:email, phone:phone, address: nil)
            try Clover.Ecomm.Charge.Create(
                token: token,
                amount: amountInt64,
                currency: "usd",
                capture: true,
                receiptEmail: emailOrNil,
                customer: customer,
                success: { charge in
                    submit = false
                    print("============================================= PROCESSING SUCCESSFUL RESPONSE ===========================================")
                    MMOrdersManager.shared.createNewBlankOrder(overwriteExisting: true) // Create a new order
                    rootIsActive = false // Dismiss the charge page
                    isProcessing = false // Dismiss the overlay
                    if let chargeId = charge.id {
                        MMOrdersManager.shared.getOrder(id: chargeId)
                    }
                },
                failure: { data, response, error in
                    submit = false
                    print("============================================= PROCESSING FAILURE RESPONSE ===========================================")
                    if let response = response as? HTTPURLResponse {
                        switch response.statusCode {
                        case 401: // probably a token error, do not try again
                            // TODO - add more detailed error handling here
                            print("Token Error - check your login credentials")
                            #if DEBUG
                            if Clover.APIManager.shared.logLevel > 2 {
                                if let data = data,
                                   let string = String(data: data, encoding: .utf8) {
                                    print(string)
                                }
                            }
                            #endif
                            MMOrdersManager.shared.createNewBlankOrder(overwriteExisting: true) // Create a new order
                            rootIsActive = false // Dismiss the charge page
                            isProcessing = false // Dismiss the overlay
                        case 500: // usually a gateway error, try again
                            // TODO - add more detailed error handling here
                            print("Gateway Error, please try again momentarily")
                            isProcessing = false // Dismiss the overlay
                        default: // print out the error
                            // TODO - add more detailed error handling here
                            print("Other Error - see detailed server response:")
                            #if DEBUG
                            if Clover.APIManager.shared.logLevel > 2 {
                                if let data = data,
                                   let string = String(data: data, encoding: .utf8) {
                                    print(string)
                                }
                            }
                            #endif
                            isProcessing = false // Dismiss the overlay
                        }
                    }
                })
        } catch {
            // TODO - provide some example code for error codes
            print ("\(error)")
            isProcessing = false
        }
    }
}


