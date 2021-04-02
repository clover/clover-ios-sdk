//
//  MikeAdPage.swift
//  Ecomm Merchant Example
//
//  Created by Eric Rowe on 11/6/20.
//

import SwiftUI
import CloverREST

struct MikeAdView: View {
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
            
            Text("Mike offers competitive rates on all your moving needs.  Mike and his people are careful.  So careful you'd think he was moving his Grandma's stuff.  So call Mike today and let him treat you like family.")
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
        }
    }
}

struct MikeAdView_Previews: PreviewProvider {
    static var previews: some View {
        MikeAdView()
    }
}
