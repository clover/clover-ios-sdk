//
//  OAuthTokenManager.swift
//
//  Created by Eric Rowe on 9/30/20.
//

import UIKit
import Combine

extension Clover {
    /// Handles requesting a Token from Clover Servers.  Once a token is received, it is stored in the keychain and managed by this class.
    /// To use this class, first call checkTokenValidAndFetch().  This will inspect the token variable, and if it is invalid or missing, initiate the OAuth Flow to request a new token.  Tokens will be stored securely in the Keychain for later use.
    /// Token updates are advertised via the ObservableObject protocol.  For example, under SwiftUI you can make a local reference to the singleton via @ObservedObject, and then switch based on the isLoggedIn variable.
    /// Note: Token expiration is not currently handled.  We currently do not get a token expiration back from the server.  Use the deleteToken call if the token returns a fail, and then OAuth will kick off again on the next use.
    public class OAuthTokenManager: ObservableObject {
        /// Singleton instance of the OAuthTokenManager
        public static let shared = OAuthTokenManager()
        private init() {}
        
        /// The environment to use, ex .Sandbox or .ProductionUSCanada
        public private(set) var environment = CLVModels.EnvironmentManager(environment: .Sandbox)

        /// Called whenever the token changes
        public var onTokenChange:(()->())?
        /// Called whenever the PAKMS token changes
        public var onPAKMSTokenChange:(()->())?
        /// Employee ID used to authorize the token
        public private(set) var employeeId:String? {
            set { _variableQueue.sync(flags:.barrier) { _employeeId = newValue } }
            get { return _variableQueue.sync { return _employeeId } }
        }
        /// Client ID used to authorize the token
        public private(set) var clientId:String? {
            set { _variableQueue.sync(flags:.barrier) { _clientId = newValue } }
            get { return _variableQueue.sync { return _clientId } }
        }
        /// Merchant ID used to authorize the token
        public private(set) var merchantId:String? {
            set { _variableQueue.sync(flags:.barrier) { _merchantId = newValue } }
            get { return _variableQueue.sync { return _merchantId } }
        }
        /// Token used for tokenizing card data
        public private(set) var pakmsToken:String? {
            get { return _pakmsToken }
            set {
                _pakmsToken = newValue
                DispatchQueue.main.async {
                    self.onPAKMSTokenChange?()
                }
            }
        }
        
        /// True if we have a valid OAuth Token
        public var isLoggedIn:Bool {
            return token != nil
        }

        /// The token to be used when making calls to the API
        /// This will pull the token from local memory or keychain if available, and return nil if not
        /// Two support functions of note:
        ///    checkTokenValidAndFetch() - starts the OAuth flow, but only if we don't already have a valid token
        ///    startOAuth() - starts the OAuth flow regardless of token status
        public private(set) var token:String?  {
            get {
                if !isConfigured { return nil }
                // If we already have the token in local memory, then return it
                if let token = _token { return token }
                // Try to read from Keychain, and return it
                readTokenFromSecureStore()
                return _token
            }
            set {
                _token = newValue
                DispatchQueue.main.async {
                    self.onTokenChange?()
                    self.objectWillChange.send()
                }
                if newValue != nil {
                    updatePAKMSToken()
                }
            }
        }
        
        /// Configures the OAuthTokenManager with your Clover and App Credentials
        /// - Parameters:
        ///   - redirectUri: the URI that will be called when OAuth is complete.  This should be a URI on a domain that you control, and for which you have Universal Links set up to forward back to this app.  In your handler for the Universal Link, call receivedAppCode(:URL), passing the full URL that you received from the Universal Link to complete the token registration.  Note: You must also set the Site URL in your developer dashboard to the location set here.
        ///   - appId: The APP ID from your Clover Developer Dashboard
        ///   - appSecret: The App Secret from your Clover Developer Dashboard.  It is recommended that you obfsucate this value in your app.
        ///   - environment: The environment to validate against.  Example: "sandbox.dev.clover.com" for the sandbox environment.
        /// - Returns: False if the redirectUri fails validation, True otherwise
        public func configure(redirectUri:String, appId:String, appSecret:String, environment:CLVModels.EnvironmentManager.Environment = .Sandbox) -> Bool {
            guard let redirectUri = redirectUri.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else {
                return false
            }
            if self.isConfigured { return false }
            self.redirectUri = redirectUri
            self.appId = appId
            self.appSecret = appSecret
            self.environment.environment = environment
            self.isConfigured = true
            return true
        }
        
        /// Checks the token is valid, and initiates OAuth if is not valid.
        public func checkTokenValidAndFetch() {
            if token == nil {
                startOAuth()
            } else {
                #if DEBUG
                print("-------------------------------------------")
                print("Token: \(token ?? "")")
                print("MID:   \(merchantId ?? "")")
                print("PAKMS: \(pakmsToken ?? "")")
                print("-------------------------------------------")
                #endif
            }
        }
        /// Call this function in your Universal Links handler with the full URL passed in, to complete the token registration.
        /// - Parameter url: The URL received from iOS which contains the App Code
        public func receivedAppCode(url:URL) {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                guard let params = self.parseURLParams(url: url) else { return }
                
                guard let employeeId = params["employee_id"] else { return }
                guard let clientId = params["client_id"] else { return }
                guard let merchantId = params["merchant_id"] else { return }
                self.employeeId = employeeId
                self.clientId = clientId
                self.merchantId = merchantId


                if let code = params["code"] {
                    guard let tokenUrl = URL(string: "https://\(self.environment.base)/oauth/token?client_id=\(self.appId)&client_secret=\(self.appSecret)&code=\(code)") else { return }
                    var request = URLRequest(url: tokenUrl)
                    request.httpMethod = "GET"
                    
                    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                        guard let data = data,
                              let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String:String],
                              let token = json["access_token"] else { return }
                        DispatchQueue.main.async { [weak self] in
                            guard let self = self else { return }
                            self.token = token
                            self.saveOrUpdateTokenToSecureStore(token: OAuthTokenData(token: token, pakmsToken: nil, employeeId: employeeId, clientId: clientId, merchantId: merchantId))
                        }
                    }
                    task.resume()
                } else {
                    var splits = url.absoluteString.components(separatedBy: "#")
                    guard splits.count > 1 else { return }
                    splits = splits[1].components(separatedBy: "=")
                    guard splits.count > 1 else { return }
                    guard splits[0] == "access_token" else { return }
                    let token = splits[1]
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else { return }
                        self.token = token
                        self.saveOrUpdateTokenToSecureStore(token: OAuthTokenData(token: token, pakmsToken: nil, employeeId: employeeId, clientId: clientId, merchantId: merchantId))
                    }
                }
            }
        }
        /// Deletes the token from local store.
        /// In this version of the SDK, token expiration is not explicitly handled.  When your code receives a call failure due to token expiration, call this function followed by checkTokenValidAndFetch() to restart the OAuth process.
        @discardableResult public func deleteToken() -> Bool {
            let success = deleteTokenFromSecureStore()
            if success {
                employeeId = nil
                clientId = nil
                merchantId = nil
                pakmsToken = nil
                token = nil
            }
            return success
        }
        

        
        /// Calls the endpoints to update the PAKMS Token and store securely locally.
        /// The PAKMS token is used to provide Credit Card tokenization services and is used by the iFrame.  This will be called automatically every time the OAuth token is updated.
        public func updatePAKMSToken() {
            do {
                try Clover.Keys().request(
                    success: { [weak self] key in
                        guard let self = self else { return }
                        self.pakmsToken = key
                        self.addPAKMSTokenToSecureStore(pakmsToken: key)
                    }, failure: { data, response, error in })
            } catch {
                print(error)
            }
        }
        
        
        
        // MARK: - Private calls
        
        
        
        
        
        
        
        /// Codable Type for storing tokens in Keychain
        private struct OAuthTokenData: Codable {
            let token: String
            let pakmsToken: String?
            let employeeId: String
            let clientId: String
            let merchantId: String
        }
        
        /// Private vars set during initialization
        private var redirectUri:String = ""
        private var appId:String = ""
        private var appSecret:String = ""
        private var isConfigured:Bool = false
        /// Stores the tokens safely in the iOS Keychain
        private var keychain = CLVModels.KeychainWrapper(account: "CloverEcommAPI")

        

        
        /// Kicks off the OAuth process by requesting a client authorization
        private func startOAuth() {
            guard let url = URL(string: "https://\(environment.base)/oauth/authorize?client_id=\(appId)&redirect_uri=\(redirectUri)") else { fatalError() }
            UIApplication.shared.open(url)
        }
        
        /// Parses the URL parameters into a [String: String dictionary
        private func parseURLParams(url:URL) -> [String: String]? {
            if let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) {
                if let queryItems = urlComponents.queryItems {
                    var params = [String: String]()
                    queryItems.forEach{
                        params[$0.name] = $0.value
                    }
                    return params
                }
            }
            return nil
        }
        
        
        
        
        // MARK: - Private storage for thread safety
        /// Private DispatchQueue to use when accessing _token to maintain thread safety
        fileprivate var _variableQueue = DispatchQueue(label: "com.clover.OAuthTokenManager.\(UUID().uuidString)", attributes: .concurrent)
        /// Stores the token.  Please don't ever use this outside of _token's set and get handlers.
        fileprivate var __token:String?
        /// Thread protected wrapper around __token.  Please don't ever use this outside of token's set and get handlers
        fileprivate var _token:String? {
            set { _variableQueue.sync(flags:.barrier) { __token = newValue } }
            get { return _variableQueue.sync { return __token } }
        }
        fileprivate var _employeeId:String?
        fileprivate var _clientId:String?
        fileprivate var _merchantId:String?
        fileprivate var __pakmsToken:String?
        fileprivate var _pakmsToken:String? {
            set { _variableQueue.sync(flags:.barrier) { __pakmsToken = newValue } }
            get { return _variableQueue.sync { return __pakmsToken } }
        }
        
        
        
        
        // MARK: - Keychain Management
        
        /// The key that we'll save the token in keychain under
        private var tokenKey:String {
            return "\(appId)_\(environment.base)_token"
        }
        /// Saves a token to the Keychain.  This call fails if a token already exists for the appId and environment pair.
        @discardableResult private func saveTokenToSecureStore(token:OAuthTokenData) -> Bool {
            guard let data = try? JSONEncoder().encode(token) else { return false }
            return keychain.save(data: data, forKey: tokenKey)
        }
        /// Saves or Updates a token to the Keychain.
        @discardableResult private func saveOrUpdateTokenToSecureStore(token:OAuthTokenData) -> Bool {
            guard let data = try? JSONEncoder().encode(token) else { return false }
            return keychain.saveOrUpdate(data: data, forKey: tokenKey)
        }
        /// Adds a PAKMS Token to the keychain store
        @discardableResult private func addPAKMSTokenToSecureStore(pakmsToken:String) -> Bool {
            guard let token = token else { return false }
            guard let employeeId = employeeId else { return false }
            guard let clientId = clientId else { return false }
            guard let merchantId = merchantId else { return false }
            return saveOrUpdateTokenToSecureStore(token: OAuthTokenData(token: token, pakmsToken: pakmsToken, employeeId: employeeId, clientId: clientId, merchantId: merchantId))
        }
        /// Reads a token from the Keychain
        private func readTokenFromSecureStore() {
            guard let data = keychain.read(key: tokenKey),
                  let token = try? JSONDecoder().decode(OAuthTokenData.self, from: data) else { return }
            self.pakmsToken = token.pakmsToken
            self.employeeId = token.employeeId
            self.clientId = token.clientId
            self.merchantId = token.merchantId
            self.token = token.token // ensure this gets set last, as the didSet callbacks on it likely have dependencies on the other values
        }
        /// Deletes a token from the Keychain
        @discardableResult private func deleteTokenFromSecureStore() -> Bool {
            return keychain.delete(key: tokenKey)
        }
        
    }
}
