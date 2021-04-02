/*
  AppDelegate.swift
  Merchant Example UIKit

  This Example provides a very simple example implementation of the iFrame, when integrated into a UIKit application.
  For a more detailed example, please see the SwiftUI example.  The SDK functionality exercised in the SwiftUI
  example is identical to that exercised in a UIKit application, with the exception of the iFrame implementation.
 
  Before you can use this example application, you must follow the instructions in the Github Repository for setting up the Associated Domains.  As configured in this project, the Associated Domains are tied to the Clover Developer team, and will not work for you out of the box.  If you have any questions about configurating Associated Domains for your team, please contact Clover Developer Relations.  At a minimum, you must:
         1) Configure and install an apple-app-site-association file on a web server that you control.  That server must be public facing and secured via HTTPS.
         2) Configure the Associated Domains for this application by pointing the Associated Domains Entitlement entry for this project at your web server.  THis must be the same location where you installed the apple-app-site-association.
         3) Configure the Web URL for your app (typically the base URL for your server) in your Clover Developer Account.  This should be the same location where you installed the apple-app-site-association.
         4) Configure the callback URL in the OAuthTokenManager, with a path that matches what you configured in your apple-app-site-association file.

  This application makes use of two prebuilt components:
    1) Clover.OAuthTokenManager
          - Implements the OAuth flow for Merchant logins
          - Maintains the OAuth Token and PAKMS Token needed for API calls in Keychain
    2) Clover.ChargeView.UIKitView
          - Implements a native wrapper around the Clover Credit Card iFrame
          - Provides secure Card Entry and Tokenization services to your application

  The lifecycle demonstrated here is as follows:
    1) In the UIApplicationDelegate.didFinishLaunchingWithOptions:
        a) Initialize the OAuthTokenManager.
        b) Call Clover.OAuthTokenManager.shared.checkTokenValidAndFetch.  This checks for a valid token stored, and if necessary, kicks off the OAuth process.  This process runs through an external call to Safari for login, so consider where you make this particular call in your production app for your particular user flow scenario
    2) In the SceneDelegate.continue userActivity, we process the received URL.  This URL is received from the OAuth process, and contains the token for making further calls.  When receive that URL, we pass it back to the OAuthTokenManager.receivedAppCode function for processing and storage.
    3) In the ViewController, we build a Clover.ChargeView.UIKitView, and assign callbacks.  The building of the view involves injecting the PAKMS token that will be automatically fetched by the OAuthTokenManager after the OAuthProcess is complete (this is a secondary call, which uses the initially fetched token).
       a) OAuthTokenManager.onTokenChange >= Assign a callback here, where we rebuild the Clover.ChargeView.UIKitView.  Since the token must be statically injected into the Javascript loaded in that object, we will rebuild it every time we get a notification that the tokens have been updated.  In practice, this only gets called very rarely, but is important to the intial OAuth process since at launch we will not have a token, and then shortly after the OAuth process is complete we will receive the token.
       b) Clover.ChargeView.UIKitView.onTouchResults >= Assign a callback here to receive and process the results of the field validation in the Javascript components.  The Clover Javascript components in the iFrame will automatically perform local validation on the Credit Card information entered by the User, and update us by calling this callback every time it changes.  This will happen every time the user touches a field in the form.  The important part of this callback is the passed isValid field, which we use in this example to set the isEnabled field of the Submit button.
       c) Clover.ChargeView.UIKitView.Submit() <= Call this function from the handler of the Submit button.  This tells the underlying Javascript components to submit the contents of the Credit Card fields to Clover for tokenization, and then return the results.
       c) Clover.ChargeView.UIKitView.onTokenResults >= Assign a callback herre to receive and process the results of the tokenization.  After the Submit() function is called, the Javascript components will make the appropriate calls to the Clover servers, exchanging the Credit Card information for a Token.  This Token can then be used to make a payment using the Clover.Ecomm.Order.Pay() or the Clover.Ecomm.Charge.Create() calls.  See the SwiftUI example app for a demonstration of submitting payments and charges.
*/

import UIKit
import CloverEcomm

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if !Clover.OAuthTokenManager.shared.configure(
            // The URI that will be called on completion of the OAuth process
            redirectUri: <#Redirect URI#>,
            // Your App ID, retrieved from your Developer Dashboard
            appId: <#App ID#>,
            // Your App Secrete, retrieved from your Developer Dashboard
            appSecret: <#App Secret#>,
            // The environment that your merchant is configured on.
            environment: .Sandbox) {
            print("Error configuring OAuthTokenManager")
            fatalError()
        }
        // Looks in memory for a valid token, and if one is not found, initiates the OAuth process
        Clover.OAuthTokenManager.shared.checkTokenValidAndFetch()
        return true
    }


}

