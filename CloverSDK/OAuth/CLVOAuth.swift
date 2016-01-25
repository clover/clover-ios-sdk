//
//import UIKit
//import WebKit
//
//extension CLVSession {
//  public class func authenticateUser(forClientIds clientIds: [String], withAppName appName: String, domain: CLVServerEnvironment, activeView: UIViewController, completion: (CLVSession?) -> Void) {
//    guard clientIds.count > 0 else { completion(nil); return }
//    nav = UINavigationController()
//    let authVC = CLVAuthViewController()
//    nav.addChildViewController(authVC)
//    activeView.showViewController(nav, sender: self)
//    authVC.setup(domain: domain, appName: appName, clientIds: clientIds, completion: completion)
//  }
//  private static var nav: UINavigationController!
//  
//}
//
//class CLVAuthViewController: UIViewController, UIWebViewDelegate, UIScrollViewDelegate {
//  private var webView: UIWebView!
//  private var url: NSURL!
//  private var completion: ((CLVSession?) -> Void)!
//  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    
//    self.webView = UIWebView(frame: self.view.frame) // UIScreen.mainScreen().applicationFrame
//    self.webView.delegate = self;
//    self.webView.scrollView.delegate = self;
//    self.view.addSubview(webView)
//    self.webView.loadRequest(NSURLRequest(URL: self.url))
//  }
//  
//  func setup(domain domain: CLVServerEnvironment, appName: String, clientIds: [String], completion: (CLVSession?) -> Void) {
//    self.completion = completion
//    self.navigationItem.title = appName
//    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "close")
//    
//    let clientIdParam: String = clientIds.count > 1 ? "client_ids=" + clientIds.joinWithSeparator(",") : "client_id=" + clientIds.first!
//    
//    let urlString = "\(domain.rawValue)/oauth/authorize?\(clientIdParam)&response_type=token"
//    self.url = NSURL(string: urlString)!
//  }
//  
//  //    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
//  //      print(error)
//  //      self.completion(nil)
//  //      self.dismissViewControllerAnimated(true, completion: nil)
//  //    }
//  
//  func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
//    if let url = request.URL,
//      let urlComponents = NSURLComponents(URL: url, resolvingAgainstBaseURL: false),
//      let fragment = urlComponents.fragment,
//      let queryItems = urlComponents.queryItems,
//      let merchantId = queryItems.filter({$0.name == "merchant_id"}).first?.value,
//      let employeeId = queryItems.filter({$0.name == "employee_id"}).first?.value,
//      let clientId = queryItems.filter({$0.name == "client_id"}).first?.value,
//      let headers = request.allHTTPHeaderFields,
//      let referer = headers["Referer"],
//      let domain = referer.componentsSeparatedByString("/oauth/authorize?").first,
//      let serverEnv = CLVServerEnvironment(rawValue: domain),
//      let _ = fragment.rangeOfString("^access_token=(.+)$", options: NSStringCompareOptions.RegularExpressionSearch),
//      let token = fragment.componentsSeparatedByString("=").last {
//        
//        let session = CLVSession(merchantToken: token, merchantId: merchantId, employeeId: employeeId, clientId: clientId, domain: serverEnv)
//        
//        self.completion(session)
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
//    return true
//  }
//  
//  func close() {
//    completion!(nil)
//    self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
//  }
//  
//  func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
//    return nil
//  }
//  
//}
