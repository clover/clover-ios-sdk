//
//  CloverChargeUIView.swift
//  CloverREST
//
//  Created by Eric Rowe on 1/5/21.
//
//  Clover.ChargeView.UIKitView is a UIView that provides secure credit card entry and tokenization.
//  The view wraps a WKWebView which contains the Clover iFrame components necessary
//  for tokenization.
//
//  On initialization, pass in closures to onTouchResults and onTokenResults to receive
//  status and tokenization results from the iFrame components.  Submit the card for
//  tokenization by calling submit() after verifying that the TouchResults.isValid is true.
//  TouchResults.isValid returned in the onTouchResults callback will be set to true once
//  local validation of the entered data is passed.  This does not guarantee a valid tokenization,
//  and error results returned from onTokenResults must still be monitored.

import Foundation
import UIKit
import SwiftUI
import Combine
import WebKit

protocol WebViewHandlerDelegate {
    func receivedJson(value: [String: Any?])
}

extension Clover {
    public class ChargeView {


        public class UIKitView : UIView, WebViewHandlerDelegate {
            // Will be called whenever the user updates a field in the card entry form.  TouchResults contains an isValid that reflects the validation state of the field values.
            public var onTouchResults: ((_ results:Clover.ChargeView.TouchResults) -> ())? = nil
            // Will be called when the token response is returned from the Clover servers.
            public var onTokenResults: ((_ results:Clover.ChargeView.TokenizeResults) -> ())? = nil
            // We'll use this to track if we've already submitted so we don't submit twice
            // This is especially important with SwiftUI, which can't easily keep track of that it self
            public private(set) var submitInProgress:Bool = false
            
            
            /**
              Creates a secure view for accepting Credit Card information, and then tokenizing that information.  Uses a hosted iFrame for security.
              
                - **Parameters**
                    - **frame**: Frame of the UIView
                    - **divHeight**: Use to override the height of the rows used in the form.
                    - **onTouchResults**: Callback *(Clover.ChargeView.TouchResults) -> ()* that will be called whenever the user updates a field in the card entry form.  TouchResults contains an isValid that should be used to determine if the data is acceptable for submission to Clover for tokenization.
                    - **onTokenResults**: Callback *(Clover.ChargeView.TokenizeResults) -> ()* that will be called when the token response is returned from the Clover servers.
              */
            public init(
                frame: CGRect,
                divHeight:CGFloat?=nil,
                onTouchResults: ((_ results:Clover.ChargeView.TouchResults) -> ())? = nil,
                onTokenResults: ((_ results:Clover.ChargeView.TokenizeResults) -> ())? = nil) {
                super.init(frame: frame)
                setupView(frame: frame,divHeight: divHeight)
                self.onTouchResults = onTouchResults
                self.onTokenResults = onTokenResults
            }
            
            /**
              Submits the contents of the iFrame for tokenization to Clover's servers.
              Check that TouchResults.isValid is true before calling this function.
              
                - **Parameters**
                    - **onTouchResults**: Callback *(Clover.ChargeView.TouchResults) -> ()* that will be called whenever the user updates a field in the card entry form.  TouchResults contains an isValid that should be used to determine if the data is acceptable for submission to Clover for tokenization.
                    - **onTokenResults**: Callback *(Clover.ChargeView.TokenizeResults) -> ()* that will be called when the token response is returned from the Clover servers.
                    - **divHeight**: Use to override the height of the rows used in the form.
              */
            public func submit() {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    guard self.submitInProgress == false else { return }
                    self.submitInProgress = true
                    self.webView?.evaluateJavaScript("clover.createToken().then(function(result) { window.webkit.messageHandlers.\(Clover.ChargeView.UIKitView.DELEGATE_NAME).postMessage({\"result\":result}); }).catch(function(data){ window.webkit.messageHandlers.\(Clover.ChargeView.UIKitView.DELEGATE_NAME).postMessage({\"error\":data}); });")
                }
            }
            
            
            
            
            // MARK: - 
            
            internal var webView: WKWebView? = nil
            private var divHeight:String? = nil

            private static let DELEGATE_NAME = "CloverFrameMessages"

            internal func receivedJson(value: [String : Any?]) {
                if let json = value["touch"] as? [String : Any?] {
                    onTouchResults?(Clover.ChargeView.TouchResults(json: json))
                } else if let json = value["result"] as? [String : Any?] {
                    submitInProgress = false
                    onTokenResults?(Clover.ChargeView.TokenizeResults(json: json))
                } else if let _ = value["error"] {
                    print("error")
                }

            }
            
            required init?(coder aDecoder: NSCoder) {
                super.init(coder: aDecoder)
                setupView(frame: self.frame)
            }
            
            private func setupView(frame:CGRect, divHeight:CGFloat?=nil) {
                self.webView = makeUIView(frame, divHeight: divHeight)
                if let webview = webView { self.addSubview(webview)}
            }
            
            
            
            internal func makeUIView(_ frame:CGRect, divHeight:CGFloat?=nil) -> WKWebView {
                // Enable javascript in WKWebView
                let preferences = WKPreferences()
                preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")  // This setting is the key to allowing the request go out to Clover's servers from the local html file.
                
                let coordinator = Coordinator(self)
                let configuration = WKWebViewConfiguration()
                configuration.userContentController.add(coordinator, name: Clover.ChargeView.UIKitView.DELEGATE_NAME)
                configuration.preferences = preferences

                let bundle = Bundle(for: Clover.ChargeView.TokenizeResults.self)
                if let url = bundle.url(forResource: "script", withExtension: "js"),
                   let scriptSource = try? String(contentsOf: url),
                   let pakmsToken = Clover.OAuthTokenManager.shared.pakmsToken {
                    let script = WKUserScript(
                        source: scriptSource.replacingOccurrences(of: "<PAKMS TOKEN>", with: pakmsToken).replacingOccurrences(of: "<DELEGATE_NAME>", with: Clover.ChargeView.UIKitView.DELEGATE_NAME),
                        injectionTime: .atDocumentEnd,
                        forMainFrameOnly: false)
                    print("injecting JS")
                    configuration.userContentController.addUserScript(script)
                }

                let webView = WKWebView(frame: frame, configuration: configuration)
                webView.navigationDelegate = coordinator
                webView.allowsBackForwardNavigationGestures = false
                webView.scrollView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
                webView.scrollView.isScrollEnabled = false
                webView.layer.borderWidth = 1
                webView.layer.cornerRadius = 16
                webView.layer.borderColor = UIColor(red:0.133,green:0.533,blue:0,alpha: 1.0).cgColor
                webView.clipsToBounds = true
                
                if let url = bundle.url(forResource: "CloveriFrame", withExtension: "html"),
                   let html = try? String(contentsOf: url) {
                    let rowHeight = "\(divHeight ?? (self.frame.height / 6))px"
                    webView.loadHTMLString(html
                                            .replacingOccurrences(of: "<ENVIRONMENT>", with: Clover.OAuthTokenManager.shared.environment.iFrame)
                                            .replacingOccurrences(of: "<row-height>", with: rowHeight), baseURL: url)
                }
                
               return webView
            }
            
            
            internal class Coordinator : NSObject, WKNavigationDelegate, WKScriptMessageHandler {
                var delegate: WebViewHandlerDelegate?
                var valueSubscriber: AnyCancellable? = nil
                var webViewNavigationSubscriber: AnyCancellable? = nil
                
                internal init(_ uiWebView: WebViewHandlerDelegate) {
                    self.delegate = uiWebView
                }
                
                deinit {
                    valueSubscriber?.cancel()
                    webViewNavigationSubscriber?.cancel()
                }
                
                // Decides if a navigation should be allowed and what to do with it
                // We'll inspect the request:
                //        - If it's our local file or requests from the proper environment, we'll allow it
                //        - If it's the privacy policy, we'll open that in a new window to allow proper navigation in the policy contract
                //        - Anything else, reject.  We shouldn't be going there.
                public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, preferences: WKWebpagePreferences, decisionHandler: @escaping (WKNavigationActionPolicy, WKWebpagePreferences) -> Void) {
                    if let url = navigationAction.request.url {
                        if let host = navigationAction.request.url?.host {
                            switch host {
                                case "www.clover.com": // This is the Privacy Policy link, open in the standard browser
                                    UIApplication.shared.open(url)
                                    decisionHandler(.cancel, preferences)
                                    return
                                case Clover.OAuthTokenManager.shared.environment.iFrame:  // This is the iFrame
                                    preferences.allowsContentJavaScript = true
                                    decisionHandler(.allow, preferences)
                                    return
                                default:  // Anything else, reject the navigation
                                    decisionHandler(.cancel, preferences)
                                    return
                            }
                        } else if url.isFileURL { // This should be loading the local file, double check to be sure
                            if url.lastPathComponent == "CloveriFrame.html" {
                                preferences.allowsContentJavaScript = true
                                decisionHandler(.allow, preferences)
                                return
                            }
                        }
                    }
                    decisionHandler(.cancel, preferences)
                }
                
                // Pass along messages addressed directly to us, if they're properly formatted dictionaries
                public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
                    if message.name == Clover.ChargeView.UIKitView.DELEGATE_NAME {
                        if let body = message.body as? [String: Any?] {
                            delegate?.receivedJson(value: body)
                        }
                    }
                }
            }
        }
    }
}
