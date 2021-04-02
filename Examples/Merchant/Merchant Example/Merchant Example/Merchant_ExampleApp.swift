//
//  Merchant_ExampleApp.swift
//  Merchant Example
//
//  Created by Eric Rowe on 11/19/20.
//

import SwiftUI
import CloverREST

@main
struct Merchant_ExampleApp: App {
    init() {
        if !Clover.OAuthTokenManager.shared.configure(
            redirectUri: <#Your Redirect URI#>,
            appId: <#Your App Id#>,
            appSecret: <#Your App Secret#>,
            environment: .Sandbox) {
            print("ERROR - Configuration Error")
        }

        // Set the log level of the API Manager
        // Log level = 1 will tell you what's going on
        // Log level = 9 will tell you of every network transaction as it happens
        // Log level is only applicable when #if DEBUG evaluates to true
        Clover.APIManager.shared.logLevel = 1

        // Initialize the managers by calling the singleton instance once
        Clover.OAuthTokenManager.shared.onTokenChange = {
            #if DEBUG
            if Clover.APIManager.shared.logLevel > 0 {
                NSLog("onTokenChange")
            }
            #endif
            if Clover.OAuthTokenManager.shared.token != nil {
                #if DEBUG
                if Clover.APIManager.shared.logLevel > 0 {
                    NSLog("Initializing Managers")
                }
                #endif
                let _ = MMDemoManager.shared
                let _ = MMCustomersManager.shared
                let _ = MMOrdersManager.shared
                let _ = MMChargesManager.shared
            }
        }
    }
    var body: some Scene {
        WindowGroup {
            StartView()
                .onOpenURL(perform: { url in
                    print(url)
                    Clover.OAuthTokenManager.shared.receivedAppCode(url: url)
                })
        }
    }
}


struct StartView: View {
    @ObservedObject var tokenManager = Clover.OAuthTokenManager.shared
    var body: some View {
        ZStack {
            if !tokenManager.isLoggedIn {
                LaunchView()
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            } else {
                BuildOrderView()
            }
        }
    }
}
