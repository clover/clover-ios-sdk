//
//  AppDelegate.swift
//  Ecomm SDK Testing
//
//  Created by Eric Rowe on 2/22/21.
//

import UIKit
import CloverREST

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
        Clover.OAuthTokenManager.shared.checkTokenValidAndFetch()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

