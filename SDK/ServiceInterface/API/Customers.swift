//
//  Customers.swift
//  CloverREST
//
//  Created by Eric Rowe on 12/1/20.
//

import Foundation

extension Clover.Customers {
    public class Customer : CLVModels.Customers.Customer, Equatable, Identifiable {
        // MARK: - Equatable
        public static func == (lhs: Customer, rhs: Customer) -> Bool {
            return lhs.id == rhs.id
        }
        
        public func getFirstName() -> String? {
            return firstName?.object as? String
        }
        public func getLastName() -> String? {
            return lastName?.object as? String
        }
        // Adding some glue logic here to handle the difference between the result of v3.Get and ecomm.Update
        public func getName() -> String? {
            if let first = getFirstName(), first != "",
               let last = getLastName(), last != "" {
                return "\(first) \(last)"
            }
            if let first = getFirstName(), first != "" { return first }
            if let last = getLastName(), last != "" { return last }
            return nil
        }
        public func getPhone() -> String? {
            return phoneNumbers?.first(where: {$0.phoneNumber != nil})?.phoneNumber
        }
        public func getEmail() -> String? {
            return emailAddresses?.first(where: { $0.emailAddress != nil && $0.emailAddress != "" })?.emailAddress
        }
        
        

        
        
        
        // Get a single customer by ID
        static public func Get(
            customerId:String,
            success: @escaping (Clover.Customers.Customer) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            
            guard let token = Clover.OAuthTokenManager.shared.token?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
            guard let mid = Clover.OAuthTokenManager.shared.merchantId else { throw CLVModels.ValidationError(description: "Merchant ID is missing.")}
            
            guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.base)/v3/merchants/\(mid)/customers/\(customerId)?expand=addresses,emailAddresses,phoneNumbers,cards&access_token=\(token)") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            Clover.APIManager.shared.addTask(
                request: request,
                successHandler: { (data, response) in
                    #if DEBUG
                    if Clover.APIManager.shared.logLevel > 2, let string = String(data:data, encoding: .utf8) {
                        NSLog(string)
                    }
                    #endif
                    if let customer = try? JSONDecoder().decode(Clover.Customers.Customer.self, from: data) {
                        success(customer)
                    } else {
                        failure(data, response, nil)
                    }
                }, failureHandler: { (data, response, error) in
                    failure(data, response, error)
                })
        }
        // Get a list of all customers for this merchant
        static public func Get(
            filter:String?=nil,
            success: @escaping ([Clover.Customers.Customer]) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            
            guard let token = Clover.OAuthTokenManager.shared.token?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
            guard let mid = Clover.OAuthTokenManager.shared.merchantId else { throw CLVModels.ValidationError(description: "Merchant ID is missing.")}
            
            guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.base)/v3/merchants/\(mid)/customers?access_token=\(token)\(filter != nil ? "&\(filter!)" : "")") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            Clover.APIManager.shared.addTask(request: request, completionHandler: { (data, response, error) in
                struct CustomerWrapped : Codable {
                    var elements:[Clover.Customers.Customer]
                }
                if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data,
                   let customers = try? JSONDecoder().decode(CustomerWrapped.self, from: data) {
                    success(customers.elements)
                } else {
                    failure(data, response, error)
                }
            })
        }
        
        // Create a customer (V3 Endpoint)
        static public func Create(
            customer: Clover.Customers.Customer,
            success: @escaping (Clover.Customers.Customer) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            
            guard let token = Clover.OAuthTokenManager.shared.token?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
            guard let mid = Clover.OAuthTokenManager.shared.merchantId else { throw CLVModels.ValidationError(description: "Merchant ID is missing.")}
            
            guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.base)/v3/merchants/\(mid)/customers?access_token=\(token)") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "content-type")
            request.httpMethod = "POST"
            
            guard let data = try? JSONEncoder().encode(customer) else { throw CLVModels.ValidationError(description: "JSON Encoding Failure of the Customer object.") }
            request.httpBody = data
            
            Clover.APIManager.shared.addTask(request: request, priority: URLSessionTask.highPriority, completionHandler: { (data, response, error) in
                if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let object = try? JSONDecoder().decode(Clover.Customers.Customer.self, from: data) {
                    success(object)
                } else {
                    failure(data, response, error)
                }
            })
        }
        public func Update(
            success: @escaping (Clover.Customers.Customer) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            guard let token = Clover.OAuthTokenManager.shared.token?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
            guard let id = id else { throw CLVModels.ValidationError(description: "Customer's ID is nil.  Please call this function only on a properly initialized Customer Object")}
            guard let mid = Clover.OAuthTokenManager.shared.merchantId else { throw CLVModels.ValidationError(description: "Merchant ID is missing.")}
            
            guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.base)/v3/merchants/\(mid)/customers/\(id)") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "accept")
            request.setValue("application/json", forHTTPHeaderField: "content-type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
            
            guard let data = try? JSONEncoder().encode(self) else { throw CLVModels.ValidationError(description: "JSON Encoding Failure of the Customer object.") }
            request.httpBody = data
            
            Clover.APIManager.shared.addTask(request: request, priority: URLSessionTask.highPriority, completionHandler: { (data, response, error) in
                if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let customer = try? JSONDecoder().decode(Clover.Customers.Customer.self, from: data) {
                    success(customer)
                } else {
                    failure(data, response, error)
                }
            })
        }
        
        public func AddCard(
            card: CLVModels.Customers.Card,
            success: @escaping (CLVModels.Customers.Card) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            guard let token = Clover.OAuthTokenManager.shared.token?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
            guard let id = id else { throw CLVModels.ValidationError(description: "Customer's ID is nil.  Please call this function only on a properly initialized Customer Object")}
            guard let mid = Clover.OAuthTokenManager.shared.merchantId else { throw CLVModels.ValidationError(description: "Merchant ID is missing.")}
            
            guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.base)/v3/merchants/\(mid)/customers/\(id)/cards") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "accept")
            request.setValue("application/json", forHTTPHeaderField: "content-type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
            
            card.customer = CLVModels.Base.Reference()
            card.customer?.id = id
            guard let data = try? JSONEncoder().encode(card) else { throw CLVModels.ValidationError(description: "JSON Encoding Failure of the Card object.") }
            request.httpBody = data
            
            Clover.APIManager.shared.addTask(request: request, priority: URLSessionTask.highPriority, completionHandler: { (data, response, error) in
                if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let card = try? JSONDecoder().decode(CLVModels.Customers.Card.self, from: data) {
                    success(card)
                } else {
                    failure(data, response, error)
                }
            })
        }

        
        // https://sandbox.dev.clover.com/v3/merchants/mId/customers/customerId
        static public func Delete(
            customerId:String,
            completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            
            guard let token = Clover.OAuthTokenManager.shared.token?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
            guard let mid = Clover.OAuthTokenManager.shared.merchantId else { throw CLVModels.ValidationError(description: "Merchant ID is missing.")}
            
            guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.base)/v3/merchants/\(mid)/customers/\(customerId)?access_token=\(token)") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            
            Clover.APIManager.shared.addTask(request: request, priority: URLSessionTask.highPriority, completionHandler: { (data, response, error) in
                completionHandler(data, response, error)
            })
        }
    }
}
extension CLVModels.Customers.Card : Identifiable {}
extension CLVModels.Customers.TokenType : Equatable {
    public static func == (lhs: CLVModels.Customers.TokenType, rhs: CLVModels.Customers.TokenType) -> Bool {
        return lhs.toString == rhs.toString
    }
}

extension Clover.Ecomm {
    public class Customer : CLVModels.Ecomm.Customer, Equatable, Identifiable {
        // MARK: - Equatable
        public static func == (lhs: Customer, rhs: Customer) -> Bool {
            return lhs.id == rhs.id
        }
        
        // MARK: - Name glue logic
        // firstName/lastName and name are mutually exclusive.
        // Recommend using the firstName/lastName fields preferentially over the name field.
        public func setFirstName(name newVal:String?) {
            if let newVal = newVal {
                firstName = CLVModels.Variant(newVal)
                name = nil // if we set firstName or lastName, then name is out of sync so nil it out
            } else {
                firstName = nil
            }
        }
        public func setLastName(name newVal:String?) {
            if let newVal = newVal {
                lastName = CLVModels.Variant(newVal)
                name = nil // if we set firstName or lastName, then name is out of sync so nil it out
            } else {
                lastName = nil
            }
        }
        public func setName(name newVal:String?) {
            if let newVal = newVal {
                name = CLVModels.Variant(newVal)
                firstName = nil // if we set name, then firstName and lastName are out of sync, so nil them out
                lastName = nil
            } else {
                name = nil
            }
        }
        public func getFirstName() -> String? {
            return firstName?.object as? String
        }
        public func getLastName() -> String? {
            return lastName?.object as? String
        }
        // Adding some glue logic here to handle the difference between the result of v3.Get and ecomm.Update
        public func getName() -> String? {
            if let first = getFirstName(),
               let last = getLastName() {
                return "\(first) \(last)"
            }
            if let first = getFirstName() { return first }
            if let last = getLastName() { return last }
            return name?.object as? String
        }
        public func setEmail(email newVal:String?) {
            if let newVal = newVal {
                email = CLVModels.Variant(newVal)
            } else {
                email = nil
            }
        }
        public func setPhone(phone newVal:String?) {
            if let newVal = newVal {
                phone = CLVModels.Variant(newVal)
            } else {
                phone = nil
            }
        }
        public func getPhone() -> String? {
            return phone?.object as? String
        }
        public func setBusinessName(businessName newVal:String?) {
            if let newVal = newVal {
                businessName = CLVModels.Variant(newVal)
            } else {
                businessName = nil
            }
        }
        public func getBusinessName() -> String? {
            return businessName?.object as? String
        }
        public func getAddress() -> String? {
            guard let address = shipping?.address else { return nil }
            var returnVal = ""
            if let line1 = address.line1?.object as? String { returnVal += line1 }
            if let line2 = address.line2?.object as? String { returnVal += ("\n" + line2) }
            if let city = address.city?.object as? String { returnVal += ("\n" + city) }
            if let state = address.state?.object as? String { returnVal += (", " + state) }
            if let zip = address.postal_code?.object as? String { returnVal += (" " + zip) }
            return returnVal
        }
        
        
        

        

        
        // MARK: - Ecomm Endpoints
        static public func Create(
            /// first/given name of customer.
            firstName:String? = nil,
            /// last name/sur name of customer.
            lastName:String? = nil,
            /// Full name of customer.
            name:String? = nil,
            /// Email address.
            email:String? = nil,
            /// Billing phone number.
            phone:String? = nil,
            /// Shipping information such as customer name and address
            shipping:CLVModels.Ecomm.Shipping? = nil,
            /// A payment source to be associated with this customer. This can be a token
            source:String? = nil,
            /// Customer Business Name
            businessName: String? = nil,
            /// This is an optional value. This field indicates whether it's ECOMM, MOTO or RECURRING transaction
            ecomind: CLVModels.Ecomm.EcommerceIndicator? = .ecom,
            success: @escaping (CLVModels.Ecomm.Customer) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            if let source = source {
                let request = CLVModels.Ecomm.CreateCustomerRequest(firstName: firstName, lastName: lastName, name: name, email: email, phone: phone, shipping: shipping, source: source, businessName: businessName, ecomind: ecomind)
                try request.POST(success: success, failure: failure)
            } else {
                throw CLVModels.ValidationError(description: "Source must be populated.  Use CLVModels.Customers.Customer.Create to create a Customer record without a source.")
            }
        }
        public func Revoke(
            cardId:String,
            success: @escaping (CLVModels.Ecomm.Customer) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            guard let token = Clover.OAuthTokenManager.shared.token?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
            guard let id = id else { throw CLVModels.ValidationError(description: "Customer's ID is nil.  Please call this function only on a properly initialized Customer Object")}
            
            guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.scl)/v1/customers/\(id)/soures/\(cardId)") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            request.setValue("application/json", forHTTPHeaderField: "accept")
            request.setValue("application/json", forHTTPHeaderField: "content-type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
            
            Clover.APIManager.shared.addTask(request: request, priority: URLSessionTask.highPriority, completionHandler: { (data, response, error) in
                if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let customer = try? JSONDecoder().decode(CLVModels.Ecomm.Customer.self, from: data) {
                    success(customer)
                } else {
                    failure(data, response, error)
                }
            })

        }
        public func Update(
            success: @escaping (CLVModels.Ecomm.Customer) -> Void,
            failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
            guard let token = Clover.OAuthTokenManager.shared.token?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
            guard let id = id else { throw CLVModels.ValidationError(description: "Customer's ID is nil.  Please call this function only on a properly initialized Customer Object")}
            
            guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.scl)/v1/customers/\(id)") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "accept")
            request.setValue("application/json", forHTTPHeaderField: "content-type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
            
            guard let data = try? JSONEncoder().encode(self) else { throw CLVModels.ValidationError(description: "JSON Encoding Failure of the Customer object.") }
            request.httpBody = data
            
            Clover.APIManager.shared.addTask(request: request, priority: URLSessionTask.highPriority, completionHandler: { (data, response, error) in
                if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let customer = try? JSONDecoder().decode(CLVModels.Ecomm.Customer.self, from: data) {
                    success(customer)
                } else {
                    failure(data, response, error)
                }
            })
        }
    }
}



// MARK: -
extension CLVModels.Ecomm.CreateCustomerRequest {
    internal convenience init(
        firstName:String? = nil,
        lastName:String? = nil,
        name:String? = nil,
        email:String? = nil,
        phone:String? = nil,
        shipping:CLVModels.Ecomm.Shipping? = nil,
        source:String,
        businessName: String? = nil,
        ecomind: CLVModels.Ecomm.EcommerceIndicator? = .ecom) {
        
        self.init()
        if let firstName = firstName {
            self.firstName = CLVModels.Variant(firstName)
        }
        if let lastName = lastName {
            self.lastName = CLVModels.Variant(lastName)
        }
        if let name = name {
            self.name = CLVModels.Variant(name)
        }
        self.email = email
        if let phone = phone {
            self.phone = CLVModels.Variant(phone)
        }
        self.shipping = shipping
        self.source = source
        if let businessName = businessName {
            self.businessName = CLVModels.Variant(businessName)
        }
        self.ecomind = ecomind
    }
    internal func POST (
        success: @escaping (CLVModels.Ecomm.Customer) -> Void,
        failure: @escaping (Data?, URLResponse?, Error?) -> Void) throws {
        
        guard let token = Clover.OAuthTokenManager.shared.token else { throw CLVModels.ValidationError(description: "OAuth Token is missing.  Call checkTokenValidAndFetch() on your OAuthTokenRequester before trying to make a charge.") }
        
        guard let url = URL(string: "https://\(Clover.OAuthTokenManager.shared.environment.scl)/v1/customers") else { throw CLVModels.ValidationError(description: "URL Validation Failure.") }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
        
        guard let data = try? JSONEncoder().encode(self) else { throw CLVModels.ValidationError(description: "JSON Encoding Failure of the Customer object.") }
        request.httpBody = data
        
        Clover.APIManager.shared.addTask(request: request, priority: URLSessionTask.highPriority, completionHandler: { (data, response, error) in
            if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let customer = try? JSONDecoder().decode(CLVModels.Ecomm.Customer.self, from: data) {
                success(customer)
            } else {
                failure(data, response, error)
            }
        })
    }
}


extension CLVModels.Ecomm.CustomerRequest {
    public convenience init(firstName: String, lastName: String, email:String, phone:String, address: CLVModels.Ecomm.Address?) {
        self.init()
        self.first_name = CLVModels.Variant(firstName)
        self.last_name = CLVModels.Variant(lastName)
        self.email = CLVModels.Variant(email)
        self.phone = CLVModels.Variant(phone)
        self.address = address
    }
}


extension CLVModels.Customers.Address {
    public func stringVal() -> String? {
        var returnVal = ""
        if let line1 = self.address1 { returnVal += line1 }
        if let line2 = self.address2 { returnVal += ("\n" + line2) }
        if let city = self.city { returnVal += ("\n" + city) }
        if let state = self.state { returnVal += (", " + state) }
        if let zip = self.zip { returnVal += (" " + zip) }
        return returnVal
    }
}
