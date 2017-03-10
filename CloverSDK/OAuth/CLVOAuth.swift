//
//  CLVOAuth.swift
//  CloverSDK
//
//  Created by Yusuf on 12/17/15.
//  Copyright © 2016 Clover Network, Inc. All rights reserved.
//

extension CLVSession {
  
  fileprivate static var nav: UINavigationController!
  
  public class func authenticateUser(forClientId clientId: String, domain: CLVServerEnvironment, activeView: UIViewController, success: @escaping (CLVSession) -> Void, failure: @escaping ErrorHandler) {
    self.nav = UINavigationController()
    let authVC = CLVAuthViewController()
    self.nav.addChildViewController(authVC)
    activeView.show(self.nav, sender: self)
    authVC.setup(domain: domain, clientId: clientId, success: success, failure: failure)
  }
  
}


class CLVAuthViewController: UIViewController, UIWebViewDelegate, UIScrollViewDelegate {
  fileprivate var webView: UIWebView!
  fileprivate var url: URL!
  fileprivate var success: ((CLVSession) -> Void)!
  fileprivate var failure: ErrorHandler!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.webView = UIWebView(frame: self.view.frame)
    self.webView.delegate = self;
    self.webView.scrollView.delegate = self;
    self.view.addSubview(webView)
    self.webView.loadRequest(URLRequest(url: self.url))
  }
  
  func setup(domain: CLVServerEnvironment, clientId: String, success: @escaping (CLVSession) -> Void, failure: @escaping ErrorHandler) {
    self.success = success
    self.failure = failure
    self.navigationItem.title = NSLocalizedString("Authenticate with Clover", comment: "Page title for web login and authenticating an app.")
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(CLVAuthViewController.close))
    
    let urlString = "\(domain.rawValue)/oauth/authorize?client_id=\(clientId)&response_type=token"
    self.url = URL(string: urlString)!
  }
  
  func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
    if let failure = self.failure {
        failure(.Error(error as NSError? ?? CLVError.generateNSError()))
    }
    self.dismiss(animated: true, completion: nil)
  }
  
  func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
    if let requestURL = request.url,
      let urlComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: false),
      let fragment = urlComponents.fragment,
      let queryItems = urlComponents.queryItems,
      let merchantId = queryItems.filter({$0.name == "merchant_id"}).first?.value,
      let employeeId = queryItems.filter({$0.name == "employee_id"}).first?.value,
      let clientId = queryItems.filter({$0.name == "client_id"}).first?.value,
      let headers = request.allHTTPHeaderFields,
      let referer = headers["Referer"],
      let domain = referer.components(separatedBy: "/appmarket").first,
      let serverEnv = CLVServerEnvironment(rawValue: domain),
      let _ = fragment.range(of: "^access_token=(.+)$", options: NSString.CompareOptions.regularExpression),
      let token = fragment.components(separatedBy: "=").last {
        
        let session = CLVSession(accessToken: token, domain: serverEnv, merchantId: merchantId, employeeId: employeeId, clientId: clientId)
        
        self.success(session)
        self.dismiss(animated: true, completion: nil)
    }
    return true
  }
  
  func close() {
    self.failure(.Error(CLVError.generateNSError()))
    self.navigationController?.dismiss(animated: true, completion: nil)
  }
  
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return nil
  }
  
}
