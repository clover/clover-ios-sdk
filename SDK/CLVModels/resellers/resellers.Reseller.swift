/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Resellers {

    public class Reseller: Codable {

        /// Unique identifier
        public var id: String?
        /// First Data Client ID
        public var fdClientId: String?
        /// Name of the reseller
        public var name: String?
        /// Alternate FD name of the reseller
        public var alternateName: String?
        public var code: String?
        /// The owner of the reseller
        public var owner: CLVModels.Account.Account?
        public var defaultPaymentProcessor: CLVModels.Pay.PaymentProcessor?
        public var defaultProcessorKey: CLVModels.Pay.ProcessorKey?
        public var defaultCountryCode: String?
        /// Indicates if reseller supports naked credit
        public var supportsNakedCredit: Bool?
        /// Indicates if the reseller supports outbound boarding, this is true only for demo resellers
        public var supportsOutboundBoarding: Bool?
        /// Reseller's merchants cannot change their merchant plan as long as this flag is set for the reseller
        public var enforceMerchantPlan: Bool?
        public var supportPhone: String?
        public var supportEmail: String?
        /// Indicates whether the reseller has capability to filter Apps
        public var filterApps: Bool?
        /// Indicates whether the the support phone for all merchants for the reseller should be forced to reseller's support phone
        public var forcePhone: Bool?
        /// Indicates whether the station devices for the reseller are on Classic
        public var stationsOnClassic: Bool?
        /// Indicates whether blackhole processing is allowed for the reseller
        public var allowBlackhole: Bool?
        public var createdTime: Date?
        /// The parent reseller
        public var parentReseller: CLVModels.Resellers.Reseller?
        public var brandAssets: [CLVModels.Base.Reference]?
        public var broadcastMessage: CLVModels.Base.Reference?
        public var featuredApps: [CLVModels.Base.Reference]?
        public var tasqCustomerNumber: String?
        /// Indicates whether the reseller is a bulk purchaser
        public var isBulkPurchaser: Bool?
        public var partnerSupportEmail: String?
        /// Indicates if the reseller is a 'generic' reseller whose name will be used during RKI requests for resellers devices under it in hierarchy
        public var isRkiIdentifier: Bool?
        public var isNewBilling: Bool?
        public var merchantPlanGroup: CLVModels.Base.Reference?
        /// Indicates if it is a self-boarding reseller
        public var isSelfBoarding: Bool?
        /// Indicates if intercom is enabled for reseller
        public var isIntercomEnabled: Bool?
        /// Language/country of the reseller in locale format
        public var locale: String?
        /// Reseller Privacy Policy URL
        public var resellerPrivacyPolicyUrl: String?
        /// Indicates if rapid deposit is enabled for the reseller
        public var isRapidDepositEnabled: Bool?
        public var rapidDepositServiceEntitlementNumber: String?
        /// Indicates whether the reseller is setup with codeless activation
        public var isCodelessActivation: Bool?
        /// Designates the type of contract between merchant and Clover
        public var type_: CLVModels.Resellers.ResellerType?
        /// Indicates generated source of reseller
        public var source: CLVModels.Resellers.ResellerSourceType?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case id
            case fdClientId
            case name
            case alternateName
            case code
            case owner
            case defaultPaymentProcessor
            case defaultProcessorKey
            case defaultCountryCode
            case supportsNakedCredit
            case supportsOutboundBoarding
            case enforceMerchantPlan
            case supportPhone
            case supportEmail
            case filterApps
            case forcePhone
            case stationsOnClassic
            case allowBlackhole
            case createdTime
            case parentReseller
            case brandAssets
            case broadcastMessage
            case featuredApps
            case tasqCustomerNumber
            case isBulkPurchaser
            case partnerSupportEmail
            case isRkiIdentifier
            case isNewBilling
            case merchantPlanGroup
            case isSelfBoarding
            case isIntercomEnabled
            case locale
            case resellerPrivacyPolicyUrl
            case isRapidDepositEnabled
            case rapidDepositServiceEntitlementNumber
            case isCodelessActivation
            case type
            case source
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.id = try rootContainer.decodeIfPresent(String.self, forKey: .id)
            } catch {
                decodeError.append(error)
            }
            do {
                self.fdClientId = try rootContainer.decodeIfPresent(String.self, forKey: .fdClientId)
            } catch {
                decodeError.append(error)
            }
            do {
                self.name = try rootContainer.decodeIfPresent(String.self, forKey: .name)
            } catch {
                decodeError.append(error)
            }
            do {
                self.alternateName = try rootContainer.decodeIfPresent(String.self, forKey: .alternateName)
            } catch {
                decodeError.append(error)
            }
            do {
                self.code = try rootContainer.decodeIfPresent(String.self, forKey: .code)
            } catch {
                decodeError.append(error)
            }
            do {
                self.owner = try rootContainer.decodeIfPresent(CLVModels.Account.Account.self, forKey: .owner)
            } catch {
                decodeError.append(error)
            }
            do {
                self.defaultPaymentProcessor = try rootContainer.decodeIfPresent(CLVModels.Pay.PaymentProcessor.self, forKey: .defaultPaymentProcessor)
            } catch {
                decodeError.append(error)
            }
            do {
                self.defaultProcessorKey = try rootContainer.decodeIfPresent(CLVModels.Pay.ProcessorKey.self, forKey: .defaultProcessorKey)
            } catch {
                decodeError.append(error)
            }
            do {
                self.defaultCountryCode = try rootContainer.decodeIfPresent(String.self, forKey: .defaultCountryCode)
            } catch {
                decodeError.append(error)
            }
            do {
                self.supportsNakedCredit = try rootContainer.decodeIfPresent(Bool.self, forKey: .supportsNakedCredit)
            } catch {
                decodeError.append(error)
            }
            do {
                self.supportsOutboundBoarding = try rootContainer.decodeIfPresent(Bool.self, forKey: .supportsOutboundBoarding)
            } catch {
                decodeError.append(error)
            }
            do {
                self.enforceMerchantPlan = try rootContainer.decodeIfPresent(Bool.self, forKey: .enforceMerchantPlan)
            } catch {
                decodeError.append(error)
            }
            do {
                self.supportPhone = try rootContainer.decodeIfPresent(String.self, forKey: .supportPhone)
            } catch {
                decodeError.append(error)
            }
            do {
                self.supportEmail = try rootContainer.decodeIfPresent(String.self, forKey: .supportEmail)
            } catch {
                decodeError.append(error)
            }
            do {
                self.filterApps = try rootContainer.decodeIfPresent(Bool.self, forKey: .filterApps)
            } catch {
                decodeError.append(error)
            }
            do {
                self.forcePhone = try rootContainer.decodeIfPresent(Bool.self, forKey: .forcePhone)
            } catch {
                decodeError.append(error)
            }
            do {
                self.stationsOnClassic = try rootContainer.decodeIfPresent(Bool.self, forKey: .stationsOnClassic)
            } catch {
                decodeError.append(error)
            }
            do {
                self.allowBlackhole = try rootContainer.decodeIfPresent(Bool.self, forKey: .allowBlackhole)
            } catch {
                decodeError.append(error)
            }
            do {
                self.createdTime = try rootContainer.decodeIfPresent(Date.self, forKey: .createdTime)
            } catch {
                decodeError.append(error)
            }
            do {
                self.parentReseller = try rootContainer.decodeIfPresent(CLVModels.Resellers.Reseller.self, forKey: .parentReseller)
            } catch {
                decodeError.append(error)
            }
            if (rootContainer.contains(.brandAssets)) {
                do {
                    let brandAssetsContainer = try rootContainer.nestedContainer(keyedBy: CLVModels.ElementsKey.self, forKey: .brandAssets)
                    self.brandAssets = try brandAssetsContainer.decodeIfPresent([CLVModels.Base.Reference].self, forKey: .elements)
                } catch {
                    decodeError.append(error)
                }
            }
            do {
                self.broadcastMessage = try rootContainer.decodeIfPresent(CLVModels.Base.Reference.self, forKey: .broadcastMessage)
            } catch {
                decodeError.append(error)
            }
            if (rootContainer.contains(.featuredApps)) {
                do {
                    let featuredAppsContainer = try rootContainer.nestedContainer(keyedBy: CLVModels.ElementsKey.self, forKey: .featuredApps)
                    self.featuredApps = try featuredAppsContainer.decodeIfPresent([CLVModels.Base.Reference].self, forKey: .elements)
                } catch {
                    decodeError.append(error)
                }
            }
            do {
                self.tasqCustomerNumber = try rootContainer.decodeIfPresent(String.self, forKey: .tasqCustomerNumber)
            } catch {
                decodeError.append(error)
            }
            do {
                self.isBulkPurchaser = try rootContainer.decodeIfPresent(Bool.self, forKey: .isBulkPurchaser)
            } catch {
                decodeError.append(error)
            }
            do {
                self.partnerSupportEmail = try rootContainer.decodeIfPresent(String.self, forKey: .partnerSupportEmail)
            } catch {
                decodeError.append(error)
            }
            do {
                self.isRkiIdentifier = try rootContainer.decodeIfPresent(Bool.self, forKey: .isRkiIdentifier)
            } catch {
                decodeError.append(error)
            }
            do {
                self.isNewBilling = try rootContainer.decodeIfPresent(Bool.self, forKey: .isNewBilling)
            } catch {
                decodeError.append(error)
            }
            do {
                self.merchantPlanGroup = try rootContainer.decodeIfPresent(CLVModels.Base.Reference.self, forKey: .merchantPlanGroup)
            } catch {
                decodeError.append(error)
            }
            do {
                self.isSelfBoarding = try rootContainer.decodeIfPresent(Bool.self, forKey: .isSelfBoarding)
            } catch {
                decodeError.append(error)
            }
            do {
                self.isIntercomEnabled = try rootContainer.decodeIfPresent(Bool.self, forKey: .isIntercomEnabled)
            } catch {
                decodeError.append(error)
            }
            do {
                self.locale = try rootContainer.decodeIfPresent(String.self, forKey: .locale)
            } catch {
                decodeError.append(error)
            }
            do {
                self.resellerPrivacyPolicyUrl = try rootContainer.decodeIfPresent(String.self, forKey: .resellerPrivacyPolicyUrl)
            } catch {
                decodeError.append(error)
            }
            do {
                self.isRapidDepositEnabled = try rootContainer.decodeIfPresent(Bool.self, forKey: .isRapidDepositEnabled)
            } catch {
                decodeError.append(error)
            }
            do {
                self.rapidDepositServiceEntitlementNumber = try rootContainer.decodeIfPresent(String.self, forKey: .rapidDepositServiceEntitlementNumber)
            } catch {
                decodeError.append(error)
            }
            do {
                self.isCodelessActivation = try rootContainer.decodeIfPresent(Bool.self, forKey: .isCodelessActivation)
            } catch {
                decodeError.append(error)
            }
            do {
                self.type_ = try rootContainer.decodeIfPresent(CLVModels.Resellers.ResellerType.self, forKey: .type)
            } catch {
                decodeError.append(error)
            }
            do {
                self.source = try rootContainer.decodeIfPresent(CLVModels.Resellers.ResellerSourceType.self, forKey: .source)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (id != nil) { try container.encode(id, forKey: .id) }
            if (fdClientId != nil) { try container.encode(fdClientId, forKey: .fdClientId) }
            if (name != nil) { try container.encode(name, forKey: .name) }
            if (alternateName != nil) { try container.encode(alternateName, forKey: .alternateName) }
            if (code != nil) { try container.encode(code, forKey: .code) }
            if (owner != nil) { try container.encode(owner, forKey: .owner) }
            if (defaultPaymentProcessor != nil) { try container.encode(defaultPaymentProcessor, forKey: .defaultPaymentProcessor) }
            if (defaultProcessorKey != nil) { try container.encode(defaultProcessorKey, forKey: .defaultProcessorKey) }
            if (defaultCountryCode != nil) { try container.encode(defaultCountryCode, forKey: .defaultCountryCode) }
            if (supportsNakedCredit != nil) { try container.encode(supportsNakedCredit, forKey: .supportsNakedCredit) }
            if (supportsOutboundBoarding != nil) { try container.encode(supportsOutboundBoarding, forKey: .supportsOutboundBoarding) }
            if (enforceMerchantPlan != nil) { try container.encode(enforceMerchantPlan, forKey: .enforceMerchantPlan) }
            if (supportPhone != nil) { try container.encode(supportPhone, forKey: .supportPhone) }
            if (supportEmail != nil) { try container.encode(supportEmail, forKey: .supportEmail) }
            if (filterApps != nil) { try container.encode(filterApps, forKey: .filterApps) }
            if (forcePhone != nil) { try container.encode(forcePhone, forKey: .forcePhone) }
            if (stationsOnClassic != nil) { try container.encode(stationsOnClassic, forKey: .stationsOnClassic) }
            if (allowBlackhole != nil) { try container.encode(allowBlackhole, forKey: .allowBlackhole) }
            if (createdTime != nil) { try container.encode(createdTime, forKey: .createdTime) }
            if (parentReseller != nil) { try container.encode(parentReseller, forKey: .parentReseller) }
            if (brandAssets != nil) { try container.encode(brandAssets, forKey: .brandAssets) }
            if (broadcastMessage != nil) { try container.encode(broadcastMessage, forKey: .broadcastMessage) }
            if (featuredApps != nil) { try container.encode(featuredApps, forKey: .featuredApps) }
            if (tasqCustomerNumber != nil) { try container.encode(tasqCustomerNumber, forKey: .tasqCustomerNumber) }
            if (isBulkPurchaser != nil) { try container.encode(isBulkPurchaser, forKey: .isBulkPurchaser) }
            if (partnerSupportEmail != nil) { try container.encode(partnerSupportEmail, forKey: .partnerSupportEmail) }
            if (isRkiIdentifier != nil) { try container.encode(isRkiIdentifier, forKey: .isRkiIdentifier) }
            if (isNewBilling != nil) { try container.encode(isNewBilling, forKey: .isNewBilling) }
            if (merchantPlanGroup != nil) { try container.encode(merchantPlanGroup, forKey: .merchantPlanGroup) }
            if (isSelfBoarding != nil) { try container.encode(isSelfBoarding, forKey: .isSelfBoarding) }
            if (isIntercomEnabled != nil) { try container.encode(isIntercomEnabled, forKey: .isIntercomEnabled) }
            if (locale != nil) { try container.encode(locale, forKey: .locale) }
            if (resellerPrivacyPolicyUrl != nil) { try container.encode(resellerPrivacyPolicyUrl, forKey: .resellerPrivacyPolicyUrl) }
            if (isRapidDepositEnabled != nil) { try container.encode(isRapidDepositEnabled, forKey: .isRapidDepositEnabled) }
            if (rapidDepositServiceEntitlementNumber != nil) { try container.encode(rapidDepositServiceEntitlementNumber, forKey: .rapidDepositServiceEntitlementNumber) }
            if (isCodelessActivation != nil) { try container.encode(isCodelessActivation, forKey: .isCodelessActivation) }
            if (type_ != nil) { try container.encode(type_, forKey: .type) }
            if (source != nil) { try container.encode(source, forKey: .source) }
        }
    }

}