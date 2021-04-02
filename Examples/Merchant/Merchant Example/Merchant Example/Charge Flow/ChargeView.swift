//
//  CloverChargeView.swift
//  Ecomm Merchant Example
//
//  Created by Eric Rowe on 11/5/20.
//

import SwiftUI
import CloverREST

struct ChargeView: View {
    /// @State tied to @Binding in CloverChargeView that is used to trigger a card tokenization
    @State public var submit:Bool = false
    /// @State used to trigger whether the Submit button is showing as enabled
    @State public var isValid:Bool = false
    /// Tracking the horizontal size class to use in adjusting the frame size of the Credit Card iFrame
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var customer:Clover.Customers.Customer
    var customerChanged:Bool // if we have an existing customer that we updated on the previous screen, this will be true
    var customerNew:Bool     // if we do not have an existing customer, then this will be true
    @State public var order:Clover.Ecomm.Order? = nil
    
    
    @State var tokenizeResults:Clover.ChargeView.TokenizeResults? = nil
    @State var token:String? = nil
    @Binding var rootIsActive : Bool
    @State public var isProcessing = false
    
    var cardHeight:CGFloat {
        return horizontalSizeClass == .compact ? 150 : 200
    }
    
    init(customer:Clover.Customers.Customer, customerChanged:Bool = false, customerNew:Bool = false, rootIsActive:Binding<Bool>) {
        print("ChargeView Init")
        self.customer = customer
        self._rootIsActive = rootIsActive
        self.customerChanged = customerChanged
        self.customerNew = customerNew
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
                    if let customerId = customer.id,
                       let customer = MMCustomersManager.shared.customers.first(where: { $0.id == customerId }) {
                        VStack(alignment: .leading) {
                            Text(customer.getName() ?? "")
                            Text(customer.getPhone() ?? "")
                            Text(customer.getEmail() ?? "")
                                .lineLimit(1)
                        }
                    }
                    if let order = order {
                        HStack {
                            Spacer()
                        VStack {
                            Spacer()
                            Text(order.amountString)
                                .font(.system(size: 34))
                            Text("Total to be Charged")
                                .font(.caption)
                        }
                            Spacer()
                        }
                    }
                    Spacer()
                    Text("Please enter your card details")
                        .font(.system(size: 10, weight: .light, design: .serif))
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
                                    tokenizeResults = results
                                    guard let token = token else {
                                        print("============================================= DID NOT RECEIVE TOKEN ===========================================")
                                        isProcessing = false
                                        return
                                    }
                                    print("============================================= RECEIVED TOKEN ===========================================")
                                    print("Token: \(token)")
                                    submit = false
                                    // Now we have the token, so update the customer record with 1) the token, and 2) any changes from the last screen
                                    updateCustomer()
                                },
                                isValid: $isValid)
                                    .overlay(RoundedRectangle(cornerRadius: 4, style: .circular).stroke(Color(red:0.133,green:0.533,blue:0), lineWidth: 1.0))
                                    .padding(.leading, 20).padding(.trailing, 20)
                                    .frame(maxWidth:.infinity, minHeight:cardHeight, maxHeight: cardHeight)
                        }
                        Spacer()
                        HStack{
                            Spacer()
                            if (isValid) {
                                Button(action: {
                                    if tokenizeResults == nil {  // if we used a stored token last time, nil that out so we can get a new one from the tokenization service
                                        token = nil
                                    }
                                    submitCard()
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
                        if let cards = customer.cards, cards.count > 0 {
                            Spacer()
                            Text("Or select from one of your stored cards below")
                                .font(.system(size: 10, weight: .light, design: .serif))
                            Spacer()
                            HStack{
                                List{
                                    ForEach(cards) { card in
                                        if let id = card.id, let numberString = buildCardString(card), let token = card.token, let tokenType = card.tokenType, tokenType == .MULTIPAY {
                                            Button(action:{
                                                isProcessing = true
                                                self.token = token
                                                self.tokenizeResults = nil // just in case we're coming through here a second time
                                                updateCustomer()
                                            }) {
                                                HStack {
                                                    Text(numberString)
                                                    Text(id)
                                                        .font(.system(size: 10, weight: .light, design: .serif))
                                                        .italic()
                                                        .foregroundColor(Color.gray)
                                                }
                                            }
                                        }
                                    }
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
    
    
    /* FLOWS:
            submitCard -> payForOrder -> Done (payment failed, retry)
            submitCard -> tokenize -> updateCustomer(customerNew)  -> addCard -> createOrder -> Done (new customer)
            submitCard -> tokenize -> updateCustomer(!customerNew) -> addCard -> createOrder -> Done (existing customer, new card)
            updateCustomer(!customerNew) -> addCard(tokenizeCard == nil) -> createOrder -> Done (existing customer, stored card)
    */
    func submitCard() {
        // Displays the processing overlay
        isProcessing = true
        if token != nil { // already have a token, so just resubmit the charge
            print("============================================= HAVE TOKEN ===========================================")
            payForOrder()
        } else { // don't have a token, so set the submit @State to trigger tokenization
            print("============================================= SUBMITTING CARD ===========================================")
            // This is tied in via an @Binding in WebView to kick off the card tokenization
            // After the card is tokenized, we'll get the callback that we passed in above when we set up the Clover.ChargeView.SwiftUIView
            // In that callback, we'll then call payForOrder() to pay for the order with the token we got back on the card
            submit = true
        }
    }
    func updateCustomer() {
        if !customerNew {
            let _ = MMCustomersManager.shared.updateCustomer(
                customer: customer,
                success: { customer in
                    addCard()
                },
                failure: { data, response, error in })
        } else {
            let _ = MMCustomersManager.shared.addCustomer(
                customer: customer,
                success: { customer in
                    addCard()
                },
                failure: { data, response, error in })
        }
    }
    func addCard() {
        guard let token = token else { return }
        guard let tokenizedCard = tokenizeResults?.results?.card else {
            // If we have a token, but not a tokenizeResult, then we are using a stored token so don't add it to the customer but go straight to createOrder
            createOrder()
            return
        }
        let card = CLVModels.Customers.Card()
        card.token = token
        card.cardType = tokenizedCard.brand
        card.first6 = tokenizedCard.first6
        card.last4 = tokenizedCard.last4
        if let expMonth = tokenizedCard.exp_month, let expYear = tokenizedCard.exp_year {
            card.expirationDate = "\(expMonth)\(expYear.replacingOccurrences(of: "20", with: ""))"
        }
        let _ = MMCustomersManager.shared.addCard(
            customer: customer,
            card: card,
            success: { customer in
                // once the customer is created, create the order record
                createOrder()
            },
            failure: { data, response, error in })
    }
    func createOrder() {
        guard let items = MMOrdersManager.shared.newOrder.items else { print("items"); return }
        guard let customerId = customer.id else { print("customerid"); return }
        guard let email = customer.getEmail() else { print("email"); return }
        print("Requesting Order Object")
        try? Clover.Ecomm.Order.Create(
            currency: "USD",
            customer: customerId,
            email: email,
            items: items,
            shipping: nil,
            success: { [self] order in
                self.order = order
                // finally we have: 1) the token, 2) a customer, 3) an order, so now we file it all as a payment on the order
                payForOrder()
            },
            failure: { data, response, error in })
    }
    func payForOrder() {
        guard let token = token else { return }
        guard let order = order else { return }
        print("============================================= SUBMITTING CHARGE ===========================================")
        do {
            // Automatically process the charge with the token returned.
            guard let email = customer.getEmail() else {
                return
                
            }
            try order.Pay(
                customer: nil,             // If your customer has a payment device associated, then you can pay using that device by passing in the customer's ID here.  If the customer does not have a payment device associated, then putting the customer's ID here will cause the payment to fail.
                source: token,             // The token we received for the credit card
                tip_amount: nil,           // Include a tip amount here
                convenience_fee: nil,      // Include an convenience fees here
                email: email,              // Email address for the receipt.  We've tied it to the email on file, but you could ask for another email instead.
                external_reference_id: nil,// An ID such as a PO number you can assign to the transaction to be stored in the database.
                stored_credentials: nil,   // 
                ecomind: nil,
                level2: nil,
                success: { order in
                    print("============================================= PROCESSING SUCCESSFUL RESPONSE ===========================================")
                    MMOrdersManager.shared.createNewBlankOrder(overwriteExisting: true) // Create a new order
                    rootIsActive = false // Dismiss the charge page
                    isProcessing = false // Dismiss the overlay

                    if let chargeId = order.id {
                        MMOrdersManager.shared.getOrder(id: chargeId)
                    }
                },
                failure: { data, response, error in
                    print("============================================= PROCESSING FAILURE RESPONSE ===========================================")
                    if let response = response as? HTTPURLResponse {
                        switch response.statusCode {
                        case 401: // probably a token error, do not try again
                            // TODO - add more detailed error handling here
                            print("Token Error - check your login credentials")
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




struct LoadingView<Content>: View where Content: View {

    @Binding var isShowing: Bool  // should the modal be visible?
    var content: () -> Content
    var text: String?  // the text to display under the ProgressView - defaults to "Loading..."

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                // the content to display - if the modal is showing, we'll blur it
                content()
                    .disabled(isShowing)
                    .blur(radius: isShowing ? 2 : 0)
                
                // all contents inside here will only be shown when isShowing is true
                if isShowing {
                    // this Rectangle is a semi-transparent black overlay
                    Rectangle()
                        .fill(Color.black).opacity(isShowing ? 0.6 : 0)
                        .edgesIgnoringSafeArea(.all)

                    // the magic bit - our ProgressView just displays an activity
                    // indicator, with some text underneath showing what we are doing
                    VStack {
                        ProgressView()
                        Text(text ?? "Processing...")
                    }
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.2)
                    .background(Color.white)
                    .foregroundColor(Color.primary)
                    .cornerRadius(16)
                }
            }
        }
    }
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
