//
//  Orders.swift
//  CloverREST
//
//  Created by Eric Rowe on 12/1/20.
//

import Foundation

extension Clover.Ecomm {
    public class Order: CLVModels.Ecomm.Order {
        
        static public func Create(
            currency:String,
            customer:String,
            email: String?,
            items: [CLVModels.Ecomm.OrderItem]?,
            shipping: CLVModels.Ecomm.Shipping?,
            success: @escaping (Clover.Ecomm.Order) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            let request = CLVModels.Ecomm.CreateOrderRequest(
                currency: currency,
                customer: customer,
                email: email,
                items: items?.filter({$0.quantity?.object as? Int64 ?? 0 > 0}),
                shipping: shipping)
            try request.POST(success: success, failure: failure)
        }
        static public func Get(
            id:String,
            success: @escaping (Clover.Ecomm.Order) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            
            guard let token = Clover.OAuthTokenManager.shared.token?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
            
            guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.scl)/v1/orders/\(id)?expand=created") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "accept")
            request.setValue("application/json", forHTTPHeaderField: "content-type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
            
            Clover.APIManager.shared.addTask(request: request, completionHandler: { (data, response, error) in
                if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let object = try? JSONDecoder().decode(Clover.Ecomm.Order.self, from: data) {
                    success(object)
                } else {
                    failure(data, response, error)
                }
            })
        }
        static public func Get(
            created:CLVModels.SearchString? = nil,
            customer:String? = nil,
            ending_before:String? = nil,
            expand:[String]? = nil,
            ids:[String]? = nil,
            limit:Int32? = nil,
            starting_after:String? = nil,
            status:CLVModels.Status? = nil,
            status_transitioned:StatusTransition? = nil,
            sortAscending:Bool = true,
            success: @escaping ([Clover.Ecomm.Order], Bool?) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            
            guard let token = Clover.OAuthTokenManager.shared.token?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
            
            var optionsArray = [String]()
            if sortAscending {
                optionsArray.append("sort=ASC")
            } else {
                optionsArray.append("sort=DESC")
            }
            if let created = created {
                optionsArray.append("created=\(created.str)")
            }
            if let customer = customer {
                optionsArray.append("customer=\(customer)")
            }
            if let ending_before = ending_before {
                optionsArray.append("ending_before=\(ending_before)")
            }
            if let limit = limit {
                optionsArray.append("limit=\(limit)")
            }
            if let starting_after = starting_after {
                optionsArray.append("starting_after=\(starting_after)")
            }
            if let status = status {
                optionsArray.append("status=\(status)")
            }
            if let expand = expand,
               let data = try? JSONEncoder().encode(expand),
               let str = String(data: data, encoding: .utf8) {
                optionsArray.append("expand=\(str)")
            }
            if let ids = ids,
               let data = try? JSONEncoder().encode(ids),
               let str = String(data: data, encoding: .utf8) {
                optionsArray.append("ids=\(str)")
            }
            if let status_transitioned = status_transitioned,
               let data = try? JSONEncoder().encode(status_transitioned),
               let str = String(data: data, encoding: .utf8) {
                optionsArray.append("status_transitioned=\(str)")
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
            
            guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.scl)/v1/orders\(options)") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "accept")
            request.setValue("application/json", forHTTPHeaderField: "content-type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
            
            Clover.APIManager.shared.addTask(request: request, priority: URLSessionTask.defaultPriority, completionHandler: { (data, response, error) in
                struct OrderWrapped : Codable {
                    var object:String?
                    var url:String?
                    var has_more:Bool?
                    var data:[Clover.Ecomm.Order]?
                }

                if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let object = try? JSONDecoder().decode(OrderWrapped.self, from: data), let orders = object.data {
                    success(orders, object.has_more)
                } else {
                    failure(data, response, error)
                }
            })
        }
        public func Pay(
            /// ID of the customer this order is for if one exists.
            customer: String?,
            /// A payment source to be charged. This can be a token
            source: String?,
            /// Amount paid in tips
            tip_amount: Int64?,
            /// Amount paid in convenience fees
            convenience_fee: Int64?,
            /// Customer email address.
            email: String?,
            /// An id such as an Invoice PO number that can be passed to the merchant's gateway, and ultimately appear in settlement records.
            external_reference_id: String?,
            /// Details about the stored credentials.
            stored_credentials: CLVModels.Ecomm.StoredCredentials?,
            /// This is an optional value. This field indicates whether it's ECOMM, MOTO or RECURRING transaction
            ecomind: CLVModels.Ecomm.EcommerceIndicator?,
            /// Purchase card L2 data
            level2: CLVModels.Ecomm.PurchaseCardLevel2?,
            success: @escaping (Clover.Ecomm.Order) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            guard let id = id else { throw CLVModels.ValidationError(description: "ID is invalid.  Please ensure the Order object is properly initialized.")}
            try Clover.Ecomm.Order.Pay(id: id, customer: customer, source: source, tip_amount: tip_amount, convenience_fee: convenience_fee, email: email, external_reference_id: external_reference_id, stored_credentials: stored_credentials, ecomind: ecomind, level2: level2, success: success, failure: failure)
        }
        public static func Pay(
            id:String,
            /// ID of the customer this order is for if one exists.
            customer: String?,
            /// A payment source to be charged. This can be a token
            source: String?,
            /// Amount paid in tips
            tip_amount: Int64?,
            /// Amount paid in convenience fees
            convenience_fee: Int64?,
            /// Customer email address.
            email: String?,
            /// An id such as an Invoice PO number that can be passed to the merchant's gateway, and ultimately appear in settlement records.
            external_reference_id: String?,
            /// Details about the stored credentials.
            stored_credentials: CLVModels.Ecomm.StoredCredentials?,
            /// This is an optional value. This field indicates whether it's ECOMM, MOTO or RECURRING transaction
            ecomind: CLVModels.Ecomm.EcommerceIndicator?,
            /// Purchase card L2 data
            level2: CLVModels.Ecomm.PurchaseCardLevel2?,
            success: @escaping (Clover.Ecomm.Order) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            let request = CLVModels.Ecomm.PayForOrderRequest(customer: customer, source: source, tip_amount: tip_amount, convenience_fee: convenience_fee, email: email, external_reference_id: external_reference_id, stored_credentials: stored_credentials, ecomind: ecomind, level2: level2)
            try request.POST(id: id, success: success, failure: failure)
        }
        public func Return(
            /// List of items to be returned for the order
            items: [CLVModels.Ecomm.OrderItem]?,
            /// An id such as an Invoice PO number that can be passed to the merchant's gateway, and ultimately appear in settlement records.
            external_reference_id: String? = nil,
            /// Full or partial amount paid in tips
            tip_amount: Int64? = nil,
            success: @escaping (CLVModels.Ecomm.OrderReturn) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            guard let id = id else { throw CLVModels.ValidationError(description: "ID is invalid.  Please ensure the Order object is properly initialized.")}
            try Clover.Ecomm.Order.Return(id: id, items: items, external_reference_id: external_reference_id, tip_amount: tip_amount, success: success, failure: failure)
        }
        public static func Return(
            id:String,
            /// List of items to be returned for the order
            items: [CLVModels.Ecomm.OrderItem]?,
            /// An id such as an Invoice PO number that can be passed to the merchant's gateway, and ultimately appear in settlement records.
            external_reference_id: String? = nil,
            /// Full or partial amount paid in tips
            tip_amount: Int64? = nil,
            success: @escaping (CLVModels.Ecomm.OrderReturn) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            let request = CLVModels.Ecomm.ReturnOrderRequest(items: items, external_reference_id: external_reference_id, tip_amount: tip_amount)
            try request.POST(id: id, success: success, failure: failure)
        }
        
        
        
        public struct StatusTransition : Codable {
            var canceled: CLVModels.SearchString?
            var fulfilled: CLVModels.SearchString?
            var cancelled: CLVModels.SearchString?
            var returned: CLVModels.SearchString?
        }
        
        public var amountString:String {
            guard let amount = amount else { return "$0.00" }
            let dollars:Double = Double(amount) / 100.0
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            return formatter.string(from: NSNumber(value: dollars)) ?? "$0.00"
        }
        public var calculatedAmountString:String {
            guard let items = items else { return "$0.00"}
            var returnVal:Int64 = 0
            for item in items {
                if let amount = item.amount?.object as? Int64,
                   let quantity = item.quantity?.object as? Int64 {
                    returnVal += amount * quantity
                }
            }
            let dollars:Double = Double(returnVal) / 100.0
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            return formatter.string(from: NSNumber(value: dollars)) ?? "$0.00"
        }
    }
}

extension CLVModels.Ecomm.ReturnOrderRequest {
    internal convenience init(
        /// List of items to be returned for the order
        items: [CLVModels.Ecomm.OrderItem]?,
        /// An id such as an Invoice PO number that can be passed to the merchant's gateway, and ultimately appear in settlement records.
        external_reference_id: String?,
        /// Full or partial amount paid in tips
        tip_amount: Int64?) {
        
        self.init()
        self.items = items
        self.external_reference_id = external_reference_id
        if let tip_amount = tip_amount {
            self.tip_amount = CLVModels.Variant(tip_amount)
        }
    }
    internal func POST (id:String,
                        success: @escaping (CLVModels.Ecomm.OrderReturn) -> Void,
                        failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
        
        guard let token = Clover.OAuthTokenManager.shared.token else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
        
        guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.scl)/v1/orders/\(id)/returns") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
        
        guard let data = try? JSONEncoder().encode(self) else { throw CLVModels.ValidationError(description: "JSON Encoding Failure of the Charges object.") }
        request.httpBody = data
        
        Clover.APIManager.shared.addTask(request: request, priority: URLSessionTask.highPriority, completionHandler: { (data, response, error) in
            if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let object = try? JSONDecoder().decode(CLVModels.Ecomm.OrderReturn.self, from: data) {
                success(object)
            } else {
                failure(data, response, error)
            }
        })
    }
}

extension CLVModels.Ecomm.PayForOrderRequest {
    internal convenience init(
        /// ID of the customer this order is for if one exists.
        customer: String?,
        /// A payment source to be charged. This can be a token
        source: String?,
        /// Amount paid in tips
        tip_amount: Int64?,
        /// Amount paid in convenience fees
        convenience_fee: Int64?,
        /// Customer email address.
        email: String?,
        /// An id such as an Invoice PO number that can be passed to the merchant's gateway, and ultimately appear in settlement records.
        external_reference_id: String?,
        /// Details about the stored credentials.
        stored_credentials: CLVModels.Ecomm.StoredCredentials?,
        /// This is an optional value. This field indicates whether it's ECOMM, MOTO or RECURRING transaction
        ecomind: CLVModels.Ecomm.EcommerceIndicator?,
        /// Purchase card L2 data
        level2: CLVModels.Ecomm.PurchaseCardLevel2?) {
        
        self.init()
        if let customer = customer {
            self.customer = CLVModels.Variant(customer)
        }
        self.source = source
        if let tip_amount = tip_amount {
            self.tip_amount = CLVModels.Variant(tip_amount)
        }
        if let convenience_fee = convenience_fee {
            self.convenience_fee = CLVModels.Variant(convenience_fee)
        }
        if let email = email {
            self.email = CLVModels.Variant(email)
        }
        self.external_reference_id = external_reference_id
        self.stored_credentials = stored_credentials
        self.ecomind = ecomind
        self.level2 = level2
    }
    internal func POST (id:String,
                        success: @escaping (Clover.Ecomm.Order) -> Void,
                        failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
        
        guard let token = Clover.OAuthTokenManager.shared.token else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
        
        guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.scl)/v1/orders/\(id)/pay") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
        
        guard let data = try? JSONEncoder().encode(self) else { throw CLVModels.ValidationError(description: "JSON Encoding Failure of the Charges object.") }
        request.httpBody = data
        
        Clover.APIManager.shared.addTask(request: request, priority: URLSessionTask.highPriority, completionHandler: { (data, response, error) in
            if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let object = try? JSONDecoder().decode(Clover.Ecomm.Order.self, from: data) {
                success(object)
            } else {
                failure(data, response, error)
            }
        })
    }
}

extension CLVModels.Ecomm.CreateOrderRequest {
    internal convenience init(
        currency:String,
        customer:String,
        email: String?,
        items: [CLVModels.Ecomm.OrderItem]?,
        shipping: CLVModels.Ecomm.Shipping?) {
        
        self.init()
        self.currency = currency
        self.customer = CLVModels.Variant(customer)
        if let email = email {
            self.email =  CLVModels.Variant(email)
        }
        self.items = items
        self.shipping = shipping
    }
    internal func POST (success: @escaping (Clover.Ecomm.Order) -> Void,
                        failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
        
        guard let token = Clover.OAuthTokenManager.shared.token else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
        
        guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.scl)/v1/orders") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
        
        guard let data = try? JSONEncoder().encode(self) else { throw CLVModels.ValidationError(description: "JSON Encoding Failure of the Charges object.") }
        request.httpBody = data
        
        Clover.APIManager.shared.addTask(request: request, priority: URLSessionTask.highPriority, completionHandler: { (data, response, error) in
            if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let object = try? JSONDecoder().decode(Clover.Ecomm.Order.self, from: data) {
                success(object)
            } else {
                failure(data, response, error)
            }
        })
    }
}
