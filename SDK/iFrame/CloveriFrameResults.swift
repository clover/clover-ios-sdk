//
//  CloveriFrameResults.swift
//  Ecomm iOS SDK
//
//  Created by Eric Rowe on 11/17/20.
//
//  Clover.ChargeView.TouchResults provides feedback from the iFrame components regarding field contents and validation.
//  Clover.ChargeView.TokenizeResults provides feedback on the tokenization process after it has been completed
//

import SwiftUI
import Combine

extension Clover.ChargeView {
    // provides feedback from the iFrame components regarding field contents and validation.
    public class TouchResults : ObservableObject {
        public private(set) var cvv : CloverField?
        public private(set) var date : CloverField?
        public private(set) var number : CloverField?
        public private(set) var postalCode : CloverField?
                
        init() { }

        init(json: [String: Any?]) {
            parse(json:json)
        }
        
        func parse(json: [String: Any?]) {
            for value in json {
                switch value.key {
                case "CARD_CVV":
                    cvv = parseAny(value: value.value)
                case "CARD_DATE":
                    date = parseAny(value: value.value)
                case "CARD_NUMBER":
                    number = parseAny(value: value.value)
                case "CARD_POSTAL_CODE":
                    postalCode = parseAny(value: value.value)
                default: break
                }
            }
            objectWillChange.send()
        }
        
        private func parseAny(value:Any?) -> CloverField? {
            guard let value = value else { return nil }
            guard let data = try? JSONSerialization.data(withJSONObject: value, options: .fragmentsAllowed) else { return nil }
            return try? JSONDecoder().decode(CloverField.self, from: data)
        }

        public var isValid : Bool {
            guard let cvv = cvv else { return false }
            guard let date = date else { return false }
            guard let number = number else { return false }
            guard let postalCode = postalCode else { return false }
            return cvv.isValid && date.isValid && number.isValid && postalCode.isValid
        }
    }



    // provides feedback on the tokenization process after it has been completed
    public class TokenizeResults : ObservableObject {
        public private(set) var results: DataTypes.Tokenize?
        
        public init() { }

        public init(json: [String: Any?]) {
            parse(json:json)
        }
        
        func parse(json: [String: Any?]) {
            results = parseAny(value: json)
            objectWillChange.send()
        }
        
        private func parseAny(value:Any?) -> DataTypes.Tokenize? {
            guard let value = value else { return nil }
            guard let data = try? JSONSerialization.data(withJSONObject: value, options: .fragmentsAllowed) else { return nil }
            return try? JSONDecoder().decode(DataTypes.Tokenize.self, from: data)
        }
    }
    
    
    
    
    
    
    
    
    
    // MARK: -
    
    
    
    public struct CloverField : Codable {
        public var touched : Bool?
        public var error : String?
        
        var isValid : Bool {
            return touched != nil && touched == true && error == nil
        }
        

        enum CodingKeys: String, CodingKey {
            case touched
            case error
        }

        init() { }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            touched = try? values.decode(Bool.self, forKey: .touched)
            error = try? values.decode(String.self, forKey: .error)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(touched, forKey: .touched)
            try container.encode(error, forKey: .error)
        }
    }
    public class DataTypes {
        public struct Tokenize : Codable {
            public var card : Card?
            public var token : String?
        }
        public struct Card : Codable, Equatable {
            public var address_zip : String?
            public var brand : String?
            public var exp_month : String?
            public var exp_year : String?
            public var first6 : String?
            public var last4 : String?
            public static func == (lhs:Card, rhs:Card) -> Bool {
                return lhs.first6 == rhs.first6 && lhs.last4 == rhs.last4
            }
        }
    }
}
