//
//  Refunds.swift
//  CloverREST
//
//  Created by Eric Rowe on 12/1/20.
//

import Foundation

extension Clover.Ecomm {
    public class Refund : CLVModels.Ecomm.Refund {
        // Creates a Refund for a Charge
        static public func Create (
            /// Unique ID of the charge to refund
            charge:String,
            /// A positive integer in cents representing how much of this charge to refund. Can refund only up to the remaining, unrefunded amount of the charge. If no amount is provided in request default is total amount of charge
            amount:Int64? = nil,
            /// String indicating the reason for the refund. If set, possible values are duplicate, fraudulent, and requested_by_customer. If you believe the charge to be fraudulent, specifying fraudulent as the reason will add the associated card and email to your blocklists, and will also help us improve our fraud detection algorithms.
            reason:CLVModels.Ecomm.RefundReason?,
            /// An ID, such as an invoice or PO number, that is passed to the merchant's gateway and ultimately appears in settlement records. Format supported for US, spaces in between are allowed and including spaces length max to be 12 including alphanumeric characters.
            externalReferenceId:String? = nil,
            /// A positive integer in cents representing how much of tip amount to refund. Can refund only up to the remaining, unrefunded tip amount of the charge.
            tipAmount:Int64? = nil,
            /// A positive integer in cents representing how much of tax amount to refund. Can refund only up to the remaining, unrefunded tax amount of the charge.
            taxAmount:Int64? = nil,
            /// A positive integer in cents representing how much of convenience fee to refund. Can refund only up to the remaining, unrefunded convenience fee amount of the charge.
            convenienceFee:Int64? = nil,
            success: @escaping (Clover.Ecomm.Refund) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            let refundRequest = CLVModels.Ecomm.CreateRefundRequest(charge: charge, amount: amount, reason: reason, externalReferenceId: externalReferenceId, tipAmount: tipAmount, taxAmount: taxAmount, convenienceFee: convenienceFee)
            try refundRequest.POST(success: success, failure: failure)
        }
        
        // Returns a single Refund, by ID
        static public func Get (
            /// ID of a specific refund
            id:String,
            success: @escaping (Clover.Ecomm.Refund) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            
            guard let token = Clover.OAuthTokenManager.shared.token?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
            
            guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.scl)/v1/refunds/\(id)") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "accept")
            request.setValue("application/json", forHTTPHeaderField: "content-type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
            
            if let url = request.url {
                print(url)
            }
            
            Clover.APIManager.shared.addTask(request: request, completionHandler: { (data, response, error) in
                if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let object = try? JSONDecoder().decode(Clover.Ecomm.Refund.self, from: data) {
                    success(object)
                } else {
                    failure(data, response, error)
                }
            })
        }
        
        // Retrieves a list of Refunds, by query parameters
        static public func Get (
            /// Retrieve refunds applied to a specific charge
            charge:String? = nil,
            /// List filter based on the object's created field. The value can be a string with an integer Unix timestamp or a dictionary of multiple options describing a time range.
            created:CLVModels.SearchString? = nil,
            /// Cursor used in pagination. The ending_before object ID sets your place in the list. For example, if you receive 100 objects in a list starting with obj_bar, add ending_before=obj_bar in your subsequent request to retrieve the previous page of the list.
            endingBefore:String? = nil,
            /// The number of objects returned by the request, ranging between 1 and 100. The default value is 10.
            limit:Int32? = nil,
            /// Cursor used in pagination. The ending_before object ID sets your place in the list. For example, if you receive 100 objects in a list starting with obj_foo, add starting_after=obj_foo in your subsequent request to retrieve the next page of the list.
            startingAfter:String? = nil,
            success: @escaping ([Clover.Ecomm.Refund]) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            
            guard let token = Clover.OAuthTokenManager.shared.token?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
            
            var options = ""
            if let charge = charge {
                options = options + "&charge=\(charge)"
            }
            if let created = created {
                options = options + "&created=\(created.str)"
            }
            if let endingBefore = endingBefore {
                options = options + "&ending_before=\(endingBefore)"
            }
            if let limit = limit {
                options = options + "&limit=\(limit)"
            }
            if let startingAfter = startingAfter {
                options = options + "&starting_after=\(startingAfter)"
            }

            
            guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.scl)/v1/refunds/\(options)") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "accept")
            request.setValue("application/json", forHTTPHeaderField: "content-type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
            
            if let url = request.url {
                print(url)
            }
            
            Clover.APIManager.shared.addTask(request: request, completionHandler: { (data, response, error) in
                if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let object = try? JSONDecoder().decode([Clover.Ecomm.Refund].self, from: data) {
                    success(object)
                } else {
                    failure(data, response, error)
                }
            })
        }
    }
}




extension CLVModels.Ecomm.CreateRefundRequest {
    internal convenience init(
        /// Unique ID of the charge to refund
        charge:String,
        /// A positive integer in cents representing how much of this charge to refund. Can refund only up to the remaining, unrefunded amount of the charge. If no amount is provided in request default is total amount of charge
        amount:Int64? = nil,
        /// String indicating the reason for the refund. If set, possible values are duplicate, fraudulent, and requested_by_customer. If you believe the charge to be fraudulent, specifying fraudulent as the reason will add the associated card and email to your blocklists, and will also help us improve our fraud detection algorithms.
        reason:CLVModels.Ecomm.RefundReason?,
        /// An ID, such as an invoice or PO number, that is passed to the merchant's gateway and ultimately appears in settlement records. Format supported for US, spaces in between are allowed and including spaces length max to be 12 including alphanumeric characters.
        externalReferenceId:String? = nil,
        /// A positive integer in cents representing how much of tip amount to refund. Can refund only up to the remaining, unrefunded tip amount of the charge.
        tipAmount:Int64? = nil,
        /// A positive integer in cents representing how much of tax amount to refund. Can refund only up to the remaining, unrefunded tax amount of the charge.
        taxAmount:Int64? = nil,
        /// A positive integer in cents representing how much of convenience fee to refund. Can refund only up to the remaining, unrefunded convenience fee amount of the charge.
        convenienceFee:Int64? = nil) {
        
        self.init()
        self.charge = charge
        if let amount = amount { self.amount = CLVModels.Variant(amount) }
        self.reason = reason
        self.external_reference_id = externalReferenceId
        if let tipAmount = tipAmount { self.tip_amount = CLVModels.Variant(tipAmount) }
        if let taxAmount = taxAmount { self.tax_amount = CLVModels.Variant(taxAmount) }
        if let convenienceFee = convenienceFee { self.convenience_fee = CLVModels.Variant(convenienceFee) }
    }

    internal func POST (success: @escaping (Clover.Ecomm.Refund) -> Void, failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
        
        guard let token = Clover.OAuthTokenManager.shared.token else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
        
        guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.scl)/v1/refunds") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
        
        guard let data = try? JSONEncoder().encode(self) else { throw CLVModels.ValidationError(description: "JSON Encoding Failure of the Refund object.") }
        request.httpBody = data
        
        if let url = request.url {
            print(url)
        }
        
        Clover.APIManager.shared.addTask(request: request, priority: URLSessionTask.highPriority, completionHandler: { (data, response, error) in
            if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let object = try? JSONDecoder().decode(Clover.Ecomm.Refund.self, from: data) {
                success(object)
            } else {
                failure( data, response, error)
            }
        })
    }
}
