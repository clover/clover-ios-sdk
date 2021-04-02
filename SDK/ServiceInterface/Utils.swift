//
//  Utils.swift
//  Ecomm API Experiment
//
//  Created by Eric Rowe on 10/6/20.
//

import Foundation

extension CLVModels {
    
    /// Encapsulates an error in the validation of a data request
    public struct ValidationError:Error {
        var description:String
    }
    
    /// Search paramter for Get calls
    public enum Status:String {
        case created
        case paid
        case fulfilled
        case refunded
    }
    /// Search paramter for Get calls
    public class SearchString : Codable {
        public private(set) var str : String = ""
        init(str:String) {
            self.str = str
        }
        init?(searchObject:SearchObject) {
            guard let data = try? JSONEncoder().encode(searchObject),
                  let str = String(data: data, encoding: .utf8) else { return nil }
            self.str = str
        }
        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.singleValueContainer()
            str = try rootContainer.decode(String.self)
        }
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(str)
        }
    }
    /// Search paramter for Get calls
    public struct SearchObject : Codable {
        var gt:Int64
        var gte:Int64
        var lt:Int64
        var lte:Int64
    }
    
    
    
    
    // MARK: - Keychain Management
    /// A wrapper around keychain providing read/write access.
    public class KeychainWrapper {
        
        /// Initializer for the KeychainWrapper
        /// - Parameter account: Values are stored in keychain using a combination of two values: the account and the key.  Specify a single account for each instance of KeychainWrapper you use, and then a specific key for each value you want to save.
        public init(account:String) {
            // if a third party uses something in the ReservedAccounts list, then prefix it with external_ to prevent collisions
            if ReservedAccounts(rawValue: account) != nil {
                self.account = "external_" + account
            } else {
                self.account = account
            }
        }
        internal init(account:ReservedAccounts) {
            self.account = account.rawValue
        }
        /// Values are stored in keychain using a combination of two values: the account and the key.  Specify a single account for each instance of KeychainWrapper you use, and then a specific key for each value you want to save.
        public private(set) var account:String
        
        
        /// Saves a value into keychain.
        /// - Parameters:
        ///   - data: The Data object to store
        ///   - key: The Key used to lookup the value later
        /// - Returns: True if the write to keychain was successful.  This function will fail if the key already exists in keychain for this account.
        @discardableResult public func save(data:Data, forKey key:String) -> Bool {
            let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                        kSecAttrAccount as String: account,
                                        kSecAttrServer as String: key,
                                        kSecValueData as String: data]
            let status = SecItemAdd(query as CFDictionary, nil)
            return status == errSecSuccess
        }
        
        /// Saves a value into keychain.
        /// - Parameters:
        ///   - data: The Data object to store
        ///   - key: The Key used to lookup the value later
        /// - Returns: True if the write to keychain was successful.  If a value already exists for that key account pair in keychain, then it will overwrite the value in keychain.
        @discardableResult public func saveOrUpdate(data:Data, forKey key:String) -> Bool {
            if save(data: data, forKey: key) { return true }
            let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                        kSecAttrAccount as String: account,
                                        kSecAttrServer as String: key]
            let attributes: [String: Any] = [kSecValueData as String: data]
            let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
            return status == errSecSuccess
        }
        /// Reads a value from keychain.
        /// - Parameter key: The Key the value was saved under.
        /// - Returns: The Data object if the key/account pair is found, or null.
        public func read(key:String) -> Data? {
            let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                        kSecAttrAccount as String: account,
                                        kSecAttrServer as String: key,
                                        kSecMatchLimit as String: kSecMatchLimitOne,
                                        kSecReturnAttributes as String: true,
                                        kSecReturnData as String: true]
            var item: CFTypeRef?
            let status = SecItemCopyMatching(query as CFDictionary, &item)
            if status == errSecItemNotFound { print("ITEM NOT FOUND") }
            guard status == errSecSuccess else { return nil }
            guard let existingItem = item as? [String : Any] else { return nil }
            return existingItem[kSecValueData as String] as? Data
        }
        @discardableResult public func delete(key:String) -> Bool {
            let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                        kSecAttrAccount as String: account,
                                        kSecAttrServer as String: key]
            return SecItemDelete(query as CFDictionary) == errSecSuccess
        }
    }
    internal enum ReservedAccounts:String {
        case CloverEcommAPI
        case CloverEcommCardTokens
    }
    
    // MARK: - Environment Manager
    public class EnvironmentManager {
        public var environment:Environment = .Sandbox
        
        public init(environment:Environment) {
            self.environment = environment
        }
        
        public enum Environment {
            // Test Environments
            case Sandbox
            case Stg1
            case Dev1
            // Live Production Environment
            case ProductionUSCanada
        }
        
        public var base:String {
            switch self.environment {
                case .Sandbox: return SANDBOX_BASE
                case .Stg1: return STG1_BASE
                case .Dev1: return DEV1_BASE
                case .ProductionUSCanada: return PRODUCTION_US_CANADA_BASE
            }
        }
        public var token:String {
            switch self.environment {
                case .Sandbox: return SANDBOX_TOKEN
                case .Stg1: return STG1_TOKEN
                case .Dev1: return DEV1_TOKEN
                case .ProductionUSCanada: return PRODUCTION_US_CANADA_TOKEN
            }
        }
        public var iFrame:String {
            switch self.environment {
                case .Sandbox: return SANDBOX_IFRAME
                case .Stg1: return STG1_IFRAME
                case .Dev1: return DEV1_IFRAME
                case .ProductionUSCanada: return PRODUCTION_US_CANADA_IFRAME
            }
        }
        public var api:String {
            switch self.environment {
                case .Sandbox: return SANDBOX_API
                case .Stg1: return STG1_API
                case .Dev1: return DEV1_API
                case .ProductionUSCanada: return PRODUCTION_US_CANADA_API
            }
        }
        public var scl:String {
            switch self.environment {
                case .Sandbox: return SANDBOX_SCL
                case .Stg1: return STG1_SCL
                case .Dev1: return DEV1_SCL
                case .ProductionUSCanada: return PRODUCTION_US_CANADA_SCL
            }
        }
        
        private let SANDBOX_BASE = "sandbox.dev.clover.com"
        private let STG1_BASE = "stg1.dev.clover.com"
        private let DEV1_BASE = "dev1.dev.clover.com"
        private let PRODUCTION_US_CANADA_BASE = "www.clover.com"

        private let SANDBOX_TOKEN = "token-sandbox.dev.clover.com"
        private let STG1_TOKEN = "token-stg1.dev.clover.com"
        private let DEV1_TOKEN = "token-dev1.dev.clover.com"
        private let PRODUCTION_US_CANADA_TOKEN = "token.clover.com"

        private let SANDBOX_IFRAME = "checkout.sandbox.dev.clover.com"
        private let STG1_IFRAME = "checkout.stg1.dev.clover.com"
        private let DEV1_IFRAME = "checkout.dev1.dev.clover.com"
        private let PRODUCTION_US_CANADA_IFRAME = "checkout.clover.com"

        private let SANDBOX_API = "apisandbox.dev.clover.com"
        private let STG1_API = "apistg1.dev.clover.com"
        private let DEV1_API = "apidev1.dev.clover.com"
        private let PRODUCTION_US_CANADA_API = "api.clover.com"

        private let SANDBOX_SCL = "scl-sandbox.dev.clover.com"
        private let STG1_SCL = "scl-stg1.dev.clover.com"
        private let DEV1_SCL = "scl-dev1.dev.clover.com"
        private let PRODUCTION_US_CANADA_SCL = "scl.clover.com"
    }
}



extension DispatchQueue {
    internal class Clover {
        // Generic DispatchQueue that provides Synchronous and Asynchronous Operations.
        //      .sync runs the passed block on this queue, but without locking if called on the same queue
        //      .async is a direct pass through to the DispatchQueue.async and is here for convenience
        class ThreadProtected {
            init(label:String) {
                self.label = label
            }
            
            private static let key = DispatchSpecificKey<Int>()
            private lazy var context = UUID().uuidString.hashValue
            private let label:String
            private lazy var dispatchQueue: DispatchQueue = {
                let value = DispatchQueue(label: label)
                value.setSpecific(key: DispatchQueue.Clover.ThreadProtected.key, value: context)
                return value
            }()

            public func sync<T>(execute work: () throws -> T) rethrows -> T {
                if DispatchQueue.getSpecific(key: DispatchQueue.Clover.ThreadProtected.key) != context {
                    return try dispatchQueue.sync(execute: work)
                }
                return try work()
            }
            public func async(group: DispatchGroup? = nil, qos: DispatchQoS = .unspecified, flags: DispatchWorkItemFlags = [], execute work: @escaping () -> Void) {
                dispatchQueue.async(group: group, qos: qos, flags: flags, execute: work)
            }
        }
        // A Rate Limited wrapper around DispatchQueue.Clover
        // Provides rate limited asynchronous operations, useful for making network calls which may have a rate limit at the server.
        class RateLimited {
            public var rateLimit : Double = 16
            public var minRateLimit : Double = 1
            public var maxRateLimit : Double = 16
            public var autoFire = true
            private var pause : Double = 0
            public var logLevel:Int
            
            // Access to taskInProgress, lastTaskStartedTime
            // Work is performed on this queue, and it may be locked at any point in time to perform the rate limiting
            private let workerQueue:DispatchQueue.Clover.ThreadProtected
            
            // Access to taskList, rateLimit, pause, minRateLimit, maxRateLimit
            // Maintenance of the task list is performed on this queue.  Separated from the worker queue to allow the worker queue to lock at any time without impacting the owning queues
            private let planningQueue:DispatchQueue.Clover.ThreadProtected
            
            // A task object encapsulates a unit of work to be performed
            private struct Task {
                public var request : URLRequest
                public var completion : (Data?, URLResponse?, Error?) -> Void
                public var priority : Float
            }
            
            // The list of tasks that needs to be performed
            private var taskList = [Task]()
            
            /// Initializer
            /// - Parameters:
            ///   - label: label used to maintain thread independance across your application.  default: random assigned UUID
            public init(label:String = UUID().uuidString, autoFire:Bool = true, logLevel:Int = 0) {
                planningQueue = DispatchQueue.Clover.ThreadProtected(label: "com.clover.\(label).planningQueue")
                workerQueue = DispatchQueue.Clover.ThreadProtected(label: "com.clover.\(label).workerQueue")
                self.autoFire = autoFire
                self.logLevel = logLevel
            }
            /// Performs a speed limiting function on the worker queue.  Recommended to call this function whenever you receive a 429 error on a series of network calls.
            /// Net result is a 4 second pause on the worker queue + the rate limit is cut in half down to the minRateLimit
            public func speedLimit() {
                #if DEBUG
                print("SPEED DOWN")
                #endif
                planningQueue.sync {
                    rateLimit /= 2
                    if rateLimit < minRateLimit { rateLimit = minRateLimit }
                    pause = 4
                }
            }
            /// Performs a speed boost function.  Together with speedLimit() this provides a rate limiting function.  Recommended to call this function every time you do not receive a 429 error on a network call.
            /// Net restult is a doubling of the rateLimit, up to the maxRateLimit
            public func speedBump() {
                planningQueue.sync {
                    if rateLimit == maxRateLimit { return }
                    #if DEBUG
                    print("SPEED UP")
                    #endif
                    rateLimit *= 2
                    if rateLimit > maxRateLimit { rateLimit = maxRateLimit }
                }
            }
            public func jobsRemaining() -> Int {
                planningQueue.sync {
                    return taskList.count
                }
            }
            private var percentRemainingBaseline:Double = 0
            public func percentRemaining() -> Double {
                planningQueue.sync{
                    return Double(jobsRemaining()) / percentRemainingBaseline
                }
            }
            /// Adds an asynchronous block of work to the task queue, to be run at this object's discretion.  Tasks will be run asynchronously by priority (highest first) by order received.
            /// - Parameters:
            ///   - priority: the priority of this task.  higher values will be run before lower values.
            ///   - execute: the work to be performed.
            ///   - then: a secondary block of work to be performed after the execute block.  Note that rate limiting will be calculated based on the completion of both tasks.
            public func async(
                priority : Float = 0,
                request: URLRequest,
                then completion: @escaping (Data?, URLResponse?, Error?) -> Void ) {
                planningQueue.async { [weak self] in
                    guard let self = self else { return }
                    self.taskList.append(Task(request: request, completion: completion, priority: priority))
                    self.percentRemainingBaseline += 1
                    #if DEBUG
                    if self.logLevel > 0, self.percentRemainingBaseline == 1 {
                        NSLog("Queue Filling")
                    }
                    #endif
                    self.runNext()
                }
            }
            

            private var dataTask:URLSessionDataTask?
            /// Runs the next task in the queue, if there is one available.
            public func runNext() {
                workerQueue.async { [weak self] in
                    guard let self = self else { return }
                    guard self.dataTask == nil else { return }

                    // ask the planningQueue for a task to run
                    guard let task = self.getNextTask() else { return }
                    
                    self.dataTask = URLSession.shared.dataTask(with: task.request) { [weak self] (data, response, error) in
                        guard let self = self else { return }
                        self.dataTask = nil
                        if let response = response as? HTTPURLResponse {
                            #if DEBUG
                            if self.logLevel > 8 {
                                NSLog("RESPONSE \(response.statusCode)")
                                if response.statusCode != 200 {
                                    if let data = data, let string = String(data: data, encoding: .utf8) {
                                        NSLog(string)
                                    }
                                }
                            }
                            #endif
                            if response.statusCode == 429 {
                                self.speedLimit()
                                self.async(priority: task.priority + 0.1, request: task.request, then: task.completion)
                                if self.autoFire {
                                    self.runNext()
                                }
                            } else {
                                self.speedBump()
                                task.completion(data, response, error)
                                if self.autoFire {
                                    self.runNext()
                                }
                            }
                        }
                    }
                    
                    // Sleep the worker queue for the appropriate time before we execute
                    let sleepTime = self.calculateTimes(lastTaskStartedTime: self.lastTaskStartedTime)
                    usleep(UInt32(sleepTime * 1000000)) // usleep is in microseconds, while sleep is in seconds
                    
                    // Record the start time
                    self.lastTaskStartedTime = Date()
                    // Run the task
                    #if DEBUG
                    if self.logLevel > 8 {
                        if let string = task.request.url?.absoluteString {
                            NSLog("%02.4f  %02.8f   Resuming: \(string)", self.rateLimit, sleepTime )
                        } else {
                            NSLog("%02.4f  %02.8f   Resuming", self.rateLimit, sleepTime )
                        }
                    }
                    #endif
                    self.dataTask?.resume()
                }
            }
            
            
            /// Gets the next task in the list to run.  Note that this is a destructive task, the task returned has been removed from the task list.
            private func getNextTask() -> Task? {
                planningQueue.sync {
                    guard taskList.count > 0 else {
                        percentRemainingBaseline = 0 // reset the percentRemainingBaseline every time we hit 0
                        #if DEBUG
                        if self.logLevel > 0 {
                            NSLog("Queue Empty")
                        }
                        #endif
                        return nil
                    }
                    return taskList.removeFirst()
                }
            }
            
            /// The timestamp that the last task started, started at.
            private var lastTaskStartedTime = Date()
            
            /// Calculates the time to the next task as per the rate limiting, in seconds.
            private func calculateTimes(lastTaskStartedTime:Date) -> Double {
                planningQueue.sync {
                    let elapsed = Date().timeIntervalSince(lastTaskStartedTime)
                    let timeToNext = (1.0/self.rateLimit) - elapsed + self.pause
                    self.pause = 0
                    return timeToNext > 0 ? timeToNext : 0
                }
            }
        }
    }
}









