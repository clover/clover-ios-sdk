//
//  APIManager.swift
//  CloverREST
//
//  Created by Eric Rowe on 12/1/20.
//


import Foundation
import Combine

extension Clover {
    
    ///  The APIManager handles throttling your calls to a level supported by the API.  If a call gets returned with a 429 error, it will automatically be added back into the call queue for retry.  When 429 errors are encountered, the throttle will back off until those errors resolve.  The throttle is configured using the rateLimit settings, which are in calls/second.
    ///
    ///  Configure the throttle using the following public vars:
    ///    rateLimitMax:Double              <= the maximum the throttle can reach, in calls/second
    ///    rateLimit:Double     <= the current limit.  this value will automatically move up and down depending on conditions.
    public class APIManager {
        /// Singleton instance of the APIManager
        public static let shared = APIManager()
        private init() {}
                


        
        // MARK: -
        
        public var logLevel:Int = 0 {
            didSet {
                workerQueue.logLevel = logLevel
            }
        }
        
        /// Any access to inProgressTask should be done in this DispatchQueue
        fileprivate var workerQueue = DispatchQueue.Clover.RateLimited()

        
        /// Adds a URLRequest to the processing queue.  The request will be executed and the results returned according to the rules of the rate limiter.  Rate limited tasks will be retried automatically.  Other failures will not result in an automatic retry.
        /// - Parameters:
        ///   - request: The URLRequest to be processed
        ///   - priority: The priority of the request.  Higher priority tasks will be executed before lower priority tasks.  In general, it is recommended to use the values provided by URLSessionTask (.lowPriority, .mediumPriority, .highPriority).
        ///   - completionHandler: The closure to call upon the return of the request.  completionHandler will be called on completion always
        ///   - successHandler: The closure to call upon a receipt of a 200-299 response from the server.
        ///   - failureHandler: The closure to call for all other responses from the server.
        public func addTask(
            request:URLRequest,
            priority:Float = URLSessionTask.lowPriority,
            completionHandler: ((Data?, URLResponse?, Error?) -> Void)? = nil,
            successHandler: ((Data, URLResponse) -> Void)? = nil,
            failureHandler: ((Data?, URLResponse?, Error?) -> Void)? = nil) {
            
            workerQueue.async(
                priority: priority,
                request: request,
                then: { data, response, error in
                    completionHandler?(data, response, error)
                    if error == nil, let data = data, let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
                        successHandler?(data, response)
                    } else {
                        failureHandler?(data, response, error)
                    }
            })
        }
    }
}






