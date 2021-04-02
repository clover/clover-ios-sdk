//
//  ViewController.swift
//  Merchant Example UIKit
//
//  Created by Eric Rowe on 1/5/21.
//

import UIKit
import CloverEcomm

class ViewController: UIViewController {
    
    var webView:Clover.ChargeView.UIKitView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Load the webview and add it to our view
        webView = buildWebView()
        self.view.addSubview(webView!)
        
        let deleteButton = UIButton(type: .system, primaryAction: UIAction(title: "Restart OAuth Process", handler: { _ in
            let _ = Clover.OAuthTokenManager.shared.deleteToken()
            Clover.OAuthTokenManager.shared.checkTokenValidAndFetch()
        }))
        deleteButton.frame = CGRect(x: 0, y: self.view.frame.height - 66, width: self.view.frame.width, height: 66)
        self.view.addSubview(deleteButton)
        
        // Add a handler to monitor for token changes.
        // This will be called whenever either the main token or the PAKMS token are changed
        // For the iFrame, the PAKMS token is the important part, as it provides access
        // The PAKMS token gets injected into the code we're loading locally, so we must reload the webview whenever it changes.
        Clover.OAuthTokenManager.shared.onTokenChange = { [weak self] in
            self?.reloadWebViews()
        }
        Clover.OAuthTokenManager.shared.onPAKMSTokenChange = { [weak self] in
            self?.reloadWebViews()
        }
    }
    
    func reloadWebViews() {
        // Ensure we're running on the main thread for all UI operations
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            // First remove it from the view
            if let webView = self.webView {
                webView.removeFromSuperview()
            }
            // Rebuild it.  If we have a PAKMS token, it will be injected during the build.
            self.webView = self.buildWebView()
            // Add it back to the subview
            self.view.addSubview(self.webView!)
        }
    }
    
    // Builds the webview and ties together the UIKit buttons with the JS functionality
    func buildWebView() -> Clover.ChargeView.UIKitView {
        let width = self.view.frame.width - 40
        let height = width * 0.6
        let webView = Clover.ChargeView.UIKitView(frame:CGRect(x: 10, y: 100, width: width, height: height))
        
        // The submit button tells the webview to submit in the handler
        let button = UIButton(type: .system, primaryAction: UIAction(title: "Submit", handler: { _ in
            self.webView?.submit()
        }))
        button.frame = CGRect(x: 20, y: 200 + height + 10, width: width, height: 44)
        // Start with the button isEnabled = false
        button.isEnabled = false
        button.backgroundColor = UIColor(red:0.133,green:0.533,blue:0,alpha: 1.0)
        button.tintColor = UIColor.white
        self.view.addSubview(button)

        // onTouchResults updates the validity of the inputs in the javascript card entry fields
        webView.onTouchResults = { results in
            // Mirror the isValid results in the button's enabled status
            // results.isValid == true signifies that the card entry fields have been validated locally by the javascript
            // This does not mean that the card is valid for payment of course, only that it passes initial field validation.
            button.isEnabled = results.isValid
        }
        // onTokenResults will return after the card has been sent to Clover for tokenization, and returns the token
        // That token can then be used to process a payment.
        webView.onTokenResults = { results in
            if let token = results.results?.token {
                print("Received a token: \(token)")
            }
        }
        return webView
    }
}

