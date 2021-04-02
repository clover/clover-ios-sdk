//
//  Keys.swift
//  Ecomm Merchant Example
//
//  Created by Eric Rowe on 10/21/20.
//

import Foundation

extension Clover {
    public struct Keys:Codable {

        public func request (
            success: @escaping (String) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {

            guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.api)/pakms/apikey") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "accept")
            request.setValue("application/json", forHTTPHeaderField: "content-type")

            guard let token = Clover.OAuthTokenManager.shared.token else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
            request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")

            Clover.APIManager.shared.addTask(request: request, priority: URLSessionTask.highPriority, completionHandler: { (data, response, error) in
                guard let validData = data,
                      let json = (try? JSONSerialization.jsonObject(with: validData, options: [])) as? [String:Any],
                      let key = json["apiAccessKey"] as? String else { failure(data, response, error); return }
                success(key)
            })
        }
    }
}
