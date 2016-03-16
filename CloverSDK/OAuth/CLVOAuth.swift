//
//  CLVOAuth.swift
//  CloverSDK
//
//  Created by Yusuf on 12/17/15.
//  Copyright © 2016 Clover Network, Inc. All rights reserved.
//

extension CLVSession {
  
  private static var nav: UINavigationController!
  
  public class func authenticateUser(forClientId clientId: String, withAppName appName: String, domain: CLVServerEnvironment, activeView: UIViewController, success: (CLVSession) -> Void, failure: ErrorHandler) {
    self.nav = UINavigationController()
    let authVC = CLVAuthViewController()
    self.nav.addChildViewController(authVC)
    activeView.showViewController(self.nav, sender: self)
    authVC.setup(domain: domain, appName: appName, clientId: clientId, success: success, failure: failure)
  }
  
}


class CLVAuthViewController: UIViewController, UIWebViewDelegate, UIScrollViewDelegate {
  private var webView: UIWebView!
  private var url: NSURL!
  private var success: ((CLVSession) -> Void)!
  private var failure: ErrorHandler!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.webView = UIWebView(frame: self.view.frame) // UIScreen.mainScreen().applicationFrame
    self.webView.delegate = self;
    self.webView.scrollView.delegate = self;
    self.view.addSubview(webView)
    self.webView.loadRequest(NSURLRequest(URL: self.url))
  }
  
  func setup(domain domain: CLVServerEnvironment, appName: String, clientId: String, success: (CLVSession) -> Void, failure: ErrorHandler) {
    self.success = success
    self.failure = failure
    self.navigationItem.title = appName
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "close")
    
    let urlString = "\(domain.rawValue)/oauth/authorize?client_id=\(clientId)&response_type=token"
    self.url = NSURL(string: urlString)!
  }
  
  func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
    self.failure(.Error(error ?? CLVError.generateNSError()))
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
    if let url = request.URL,
      let urlComponents = NSURLComponents(URL: url, resolvingAgainstBaseURL: false),
      let fragment = urlComponents.fragment,
      let queryItems = urlComponents.queryItems,
      let merchantId = queryItems.filter({$0.name == "merchant_id"}).first?.value,
      let employeeId = queryItems.filter({$0.name == "employee_id"}).first?.value,
      let clientId = queryItems.filter({$0.name == "client_id"}).first?.value,
      let headers = request.allHTTPHeaderFields,
      let referer = headers["Referer"],
      let domain = referer.componentsSeparatedByString("/oauth/authorize?").first,
      let serverEnv = CLVServerEnvironment(rawValue: domain),
      let _ = fragment.rangeOfString("^access_token=(.+)$", options: NSStringCompareOptions.RegularExpressionSearch),
      let token = fragment.componentsSeparatedByString("=").last {
        
        let session = CLVSession(accessToken: token, domain: serverEnv, merchantId: merchantId, employeeId: employeeId, clientId: clientId)
        
        self.success(session)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    return true
  }
  
  func close() {
    self.failure(.Error(CLVError.generateNSError()))
    self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
  }
  
  func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
    return nil
  }
  
}
