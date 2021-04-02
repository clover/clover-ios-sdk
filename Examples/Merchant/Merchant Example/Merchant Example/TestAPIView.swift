//
//  TestAPIView.swift
//  Ecomm Merchant Example
//
//  Created by Eric Rowe on 11/9/20.
//

import SwiftUI
import CloverREST

struct TestAPIView: View {
    var body: some View {
        Button("Send Authentication Request", action: {
            Clover.OAuthTokenManager.shared.onTokenChange = {
                print("token = \(Clover.OAuthTokenManager.shared.token ?? "MISSING")")
            }
            Clover.OAuthTokenManager.shared.checkTokenValidAndFetch()
        }).padding()
        Button("Delete OAuth Token", action: {
            let _ = Clover.OAuthTokenManager.shared.deleteToken()
        }).padding()
    }
}

struct TestAPIView_Previews: PreviewProvider {
    static var previews: some View {
        TestAPIView()
    }
}
