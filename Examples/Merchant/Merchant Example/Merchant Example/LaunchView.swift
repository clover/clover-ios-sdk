//
//  ContentView.swift
//  Ecomm Merchant Example
//
//  Created by Eric Rowe on 10/20/20.
//

import SwiftUI
import CloverREST

struct LaunchView: View {
    @State private var showingSheet = false
    
    var navigationBar: some View {
        VStack(spacing: 0) {
            Divider()
            HStack {
                Spacer()
                Button(action:{
                    Clover.OAuthTokenManager.shared.checkTokenValidAndFetch()
                }) {
                    VStack {
                        Image(systemName: "person.3.fill")
                        Text("I'm with Mike")
                            .font(.footnote)
                    }
                }
                Group {
                    Spacer()
                    Divider()
                    Spacer()
                }
                Button(action:{
                    Clover.OAuthTokenManager.shared.checkTokenValidAndFetch()
                    self.showingSheet = true
                }) {
                    VStack {
                        Image(systemName: "bus.fill")
                        Text("Move My Stuff")
                            .font(.footnote)
                    }
                }
                Spacer()
            }.frame(height: 45)
            Divider()
        }
        .sheet(isPresented: $showingSheet) {
            // TODO Swap this back
//            MikeAdView()
            TestAPIView()
        }
    }
    
    var body: some View {

        VStack(alignment: .center) {
            
            HStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width:50, height:50)
                    .padding()
                Spacer()
                Text("Mike's\nMovers")
                    .font(.title)
                    .multilineTextAlignment(.center)
                Spacer()
                Image(systemName: "shippingbox")
                    .resizable()
                    .frame(width:50, height:50)
                    .padding()
            }

            Divider()
                .background(Color.black)

            Text("Mike will move all your stuff.  Big stuff. Small stuff.  All your stuff. So if you need stuff moved, call Mike.  He'll move your stuff.")
                .multilineTextAlignment(.leading)
            Spacer()

            Button("(719)-555-0101", action: {
                if let url = URL(string: "tel://7195550101"), UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                }
            })

            HStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width:40, height:40)
                Text("\"It's me, Mike.  Call today.\nI'll move your stuff.\"")
            }

            Spacer()
            navigationBar
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    var body: some View {
        content($value)
    }

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}

















//            Button("Send Authentication Request", action: {
//                TOKENREQUESTER.onTokenChange = {
//                    print("token = \(TOKENREQUESTER.token ?? "MISSING")")
//                }
//                TOKENREQUESTER.checkTokenValidAndFetch()
//            }).padding()
//            Button("Delete OAuth Token", action: {
//                TOKENREQUESTER.deleteToken()
//            }).padding()
//            Button("Send Charge Request", action: {
//                let charges = try? Charges(amount: 3200, source: "").charge(
//                    oauthHandler: TOKENREQUESTER,
//                    completionHandler: { (response, data, error, urlResponse) in
//                        print(response ?? "null")
//                        if let data = data {
//                            let string = String(data: data, encoding: .utf8)
//                            print(string ?? "null")
//                        }
//                        print(error ?? "null")
//                        print(urlResponse ?? "null")
//                })
//            }).padding()
//            Button("Send Keys Request", action: {
//                let keys = try? Keys().request(
//                    oauthHandler: TOKENREQUESTER,
//                    completionHandler: { (response, data, error, urlResponse) in
//                        print(response ?? "null")
//                        if let data = data {
//                            let string = String(data: data, encoding: .utf8)
//                            print(string ?? "null")
//                        }
//                        print(error ?? "null")
//                        print(urlResponse ?? "null")
//                })
//            }).padding()
//            Button("Send Merchants Request", action: {
//                let request = try? CLVModels.Merchant().GET(
//                    oauthHandler: TOKENREQUESTER,
//                    completionHandler: { (merchant, data, error, urlResponse) in
//                        guard let merchant = merchant else { return }
//                        print("Name:     \(merchant.name ?? "")")
//                        print("Id:       \(merchant.id ?? "")")
//                        print("Owner:    \(merchant.owner?.id ?? "")")
//                        if let merchantPlan = merchant.merchantPlan?.object as? CLVModels.Base.Reference {
//                            print("Plan:     \(merchantPlan.id ?? "")")
//                        }
//                        print("Reseller: \(merchant.reseller?.id ?? "")")
//                        if merchant.decodeError.count > 0 {
//                            print("Errors: ")
//                            for thisError in merchant.decodeError {
//                                print("    \(thisError)")
//                            }
//                        }
//                })
//            }).padding()
//            Button("Send Payments Request", action: {
//                let request = try? CLVModels.Payments().GET(
//                    oauthHandler: TOKENREQUESTER,
//                    completionHandler: { (payments, data, error, urlResponse) in
//                        guard let elements = payments?.elements else {
//                            if let data = data,
//                               let string = String(data: data, encoding: .utf8) {
//                                print(string)
//                            } else {
//                                print(data)
//                            }
//                            return
//                        }
//                        print(elements)
//                })
//            }).padding()
