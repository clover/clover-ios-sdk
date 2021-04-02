//
//  SceneDelegate.swift
//  Merchant Example UIKit
//
//  Created by Eric Rowe on 1/5/21.
//

import UIKit
import CloverEcomm

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        guard let incomingURL = userActivity.webpageURL else { return }
        Clover.OAuthTokenManager.shared.receivedAppCode(url: incomingURL)
    }
}
