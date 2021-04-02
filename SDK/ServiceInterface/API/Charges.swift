//
//  CreateChargeRequest.swift
//  CloverREST
//
//  Created by Eric Rowe on 11/23/20.
//

import Foundation

extension Clover.Ecomm {
    public class Charge : CLVModels.Ecomm.Charge {
        // Creates a Charge
        static public func Create (
            token:String,
            amount:Int64,
            currency: String,
            capture: Bool,
            ecomind:CLVModels.Ecomm.EcommerceIndicator = .moto,
            receiptEmail:String? = nil,
            externalReferenceId:String? = nil,
            customer:CLVModels.Ecomm.CustomerRequest? = nil,
            success: @escaping (Clover.Ecomm.Charge) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            let request = CLVModels.Ecomm.CreateChargeRequest(token: token, amount: amount, currency: currency, capture: capture, ecomind: ecomind, receiptEmail: receiptEmail, customer: customer, externalReferenceId: externalReferenceId)
            try request.POST(success: success, failure: failure)
        }
        
        // As step two of the two-part payment flow, captures the payment of an existing but uncaptured charge. An uncaptured charge is first created by setting the capture value to false.
        static public func Capture (
            id:String,
            amount:Int64,
            receiptEmail:String? = nil,
            level2:CLVModels.Ecomm.PurchaseCardLevel2? = nil,
            success: @escaping (CLVModels.Ecomm.Charge) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            let request = CLVModels.Ecomm.CaptureCharge(chargeId: id, amount: amount, receiptEmail: receiptEmail, level2: level2)
            try request.POST(success: success, failure: failure)
        }
        
        // Returns a single Charge, by ID
        static public func Get (
            /// ID of a specific charge
            id:String,
            success: @escaping (Clover.Ecomm.Charge) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            
            guard let token = Clover.OAuthTokenManager.shared.token?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
            
            guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.scl)/v1/charges/\(id)") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "accept")
            request.setValue("application/json", forHTTPHeaderField: "content-type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
            
            Clover.APIManager.shared.addTask(request: request, priority: URLSessionTask.highPriority, completionHandler: { (data, response, error) in
                if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let object = try? JSONDecoder().decode(Clover.Ecomm.Charge.self, from: data) {
                    success(object)
                } else {
                    failure(data, response, error)
                }
            })
        }
        
        // Retrieves a list of Charges, by query parameters
        static public func Get (
            ///Returns charges associated with the provided customer ID.
            customer:String? = nil,
            /// List filter based on the object's created field. The value can be a string with an integer Unix timestamp or a dictionary of multiple options describing a time range.
            created:CLVModels.SearchString? = nil,
            /// Cursor used in pagination. The ending_before object ID sets your place in the list. For example, if you receive 100 objects in a list starting with obj_bar, add ending_before=obj_bar in your subsequent request to retrieve the previous page of the list.
            endingBefore:String? = nil,
            /// The number of objects returned by the request, ranging between 1 and 100. The default value is 10.
            limit:Int32? = nil,
            /// Cursor used in pagination. The ending_before object ID sets your place in the list. For example, if you receive 100 objects in a list starting with obj_foo, add starting_after=obj_foo in your subsequent request to retrieve the next page of the list.
            startingAfter:String? = nil,
            success: @escaping ([Clover.Ecomm.Charge], Bool?) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            
            guard let token = Clover.OAuthTokenManager.shared.token?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
            
            var optionsArray = [String]()
            if let created = created {
                optionsArray.append("created=\(created.str)")
            }
            if let customer = customer {
                optionsArray.append("customer=\(customer)")
            }
            if let endingBefore = endingBefore {
                optionsArray.append("ending_before=\(endingBefore)")
            }
            if let limit = limit {
                optionsArray.append("limit=\(limit)")
            }
            if let startingAfter = startingAfter {
                optionsArray.append("starting_after=\(startingAfter)")
            }

            var options = ""
            while optionsArray.count > 0 {
                if options.count == 0 {
                    options += "?"
                } else {
                    options += "&"
                }
                options += optionsArray.removeFirst()
            }
            
            guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.scl)/v1/charges/\(options)") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "accept")
            request.setValue("application/json", forHTTPHeaderField: "content-type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
            
            Clover.APIManager.shared.addTask(request: request, priority: URLSessionTask.defaultPriority, completionHandler: { (data, response, error) in
                struct ChargesWrapped : Codable {
                    var object:String?
                    var url:String?
                    var has_more:Bool?
                    var data:[Clover.Ecomm.Charge]?
                }
                if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let object = try? JSONDecoder().decode(ChargesWrapped.self, from: data), let charges = object.data {
                    success(charges, object.has_more)
                } else {
                    failure(data, response, error)
                }
            })
        }
        
        public var amountString:String {
            guard let amount = amount else { return "$0.00" }
            let dollars:Double = Double(amount) / 100.0
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            return formatter.string(from: NSNumber(value: dollars)) ?? "$0.00"
        }
    }
}










extension CLVModels.Ecomm.CreateChargeRequest {
    public convenience init(
        token:String,
        amount:Int64,
        currency: String,
        capture: Bool,
        ecomind:CLVModels.Ecomm.EcommerceIndicator = .moto,
        receiptEmail:String? = nil,
        customer: CLVModels.Ecomm.CustomerRequest?,
        externalReferenceId:String? = nil) {
        
        self.init()
        self.source = token
        self.amount = amount
        self.currency =  CLVModels.Variant(currency)
        self.capture = capture
        self.ecomind = ecomind
        self.customer = customer
        
        if let receiptEmail = receiptEmail {
            self.receipt_email = CLVModels.Variant(receiptEmail)
        }
        self.external_reference_id = externalReferenceId
    }
    internal func POST (success: @escaping (Clover.Ecomm.Charge) -> Void, failure: @escaping ( Data?, URLResponse?, Error?) -> Void) throws {
        
        guard let token = Clover.OAuthTokenManager.shared.token else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
        
        guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.scl)/v1/charges") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
        
        guard let data = try? JSONEncoder().encode(self) else { throw CLVModels.ValidationError(description: "JSON Encoding Failure of the Charges object.") }
        request.httpBody = data
        
        Clover.APIManager.shared.addTask(request: request, priority: URLSessionTask.highPriority, completionHandler: { (data, response, error) in
            if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data,
               let charge = try? JSONDecoder().decode(Clover.Ecomm.Charge.self, from: data) {
                success(charge)
            } else {
                failure(data, response, error)
            }
        })
    }
}

extension CLVModels.Ecomm.CaptureCharge {
    internal convenience init(
        chargeId:String,
        amount:Int64,
        receiptEmail: String? = nil,
        level2: CLVModels.Ecomm.PurchaseCardLevel2? = nil) {
        
        self.init()
        self.chargeId = chargeId
        self.amount = CLVModels.Variant(amount)
        if let receiptEmail = receiptEmail {
            self.receipt_email =  CLVModels.Variant(receiptEmail)
        }
        self.level2 = level2
    }
    internal func POST (success: @escaping (CLVModels.Ecomm.Charge) -> Void, failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
        
        guard let token = Clover.OAuthTokenManager.shared.token else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
        guard let chargeId = chargeId else { throw CLVModels.ValidationError(description: "Charge ID is missing.")}
        
        guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.scl)/v1/charges\(chargeId)/capture") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
        
        guard let data = try? JSONEncoder().encode(self) else { throw CLVModels.ValidationError(description: "JSON Encoding Failure of the CaptureCharge object.") }
        request.httpBody = data
        
        Clover.APIManager.shared.addTask(request: request, priority: URLSessionTask.highPriority, completionHandler: { (data, response, error) in
            if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let charge = try? JSONDecoder().decode(CLVModels.Ecomm.Charge.self, from: data) {
                success(charge)
            } else {
                failure(data, response, error)
            }
        })
    }
}
