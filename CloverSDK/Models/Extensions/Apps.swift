 
 import ObjectMapper
 
 extension CLVModels {
  public class Apps {
    
    
    public class AndroidPermission: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      public var permission: String?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(permission, forKey: "permission")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        permission = aDecoder.decodeObjectForKey("permission") as? String
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        permission <- map["permission"]
      }
    }
    
    
    
    public class AndroidVersion: NSObject, NSCoding, Mappable {
      public var id: String?
      /// Creation timestamp
      public var createdAt: Int?
      /// Unique identifier
      public var version_: Int?
      public var versionName: String?
      public var approved: Bool?
      public var hash_: String?
      public var deviceInstallCount: Int?
      public var hashOriginal: String?
      public var approvalStatus: CLVModels.Base.ApprovalStatus?
      /// VirusTotal scan status
      public var scanStatus: CLVModels.Apps.ScanStatus?
      /// VirusTotal scan_id field, which is the sha256 hash joined with the timestamp by a hyphen
      public var scanId: String?
      /// The minSdkVersion attribute parsed from the AndroidManifest.xml
      public var minSdkVersion: Int?
      /// The message digest algorithm used to digest the entries of the APK
      public var digestAlg: String?
      /// Url to download the APK
      public var apkUrl: String?
      /// List of android permissions
      public var permissions: [String]?
      /// Reference to the app this Android version belongs to
      public var app: CLVModels.Apps.App?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(createdAt, forKey: "createdAt")
        aCoder.encodeObject(version_, forKey: "version_")
        aCoder.encodeObject(versionName, forKey: "versionName")
        aCoder.encodeObject(approved, forKey: "approved")
        aCoder.encodeObject(hash_, forKey: "hash_")
        aCoder.encodeObject(deviceInstallCount, forKey: "deviceInstallCount")
        aCoder.encodeObject(hashOriginal, forKey: "hashOriginal")
        aCoder.encodeObject(approvalStatus?.rawValue, forKey: "approvalStatus")
        aCoder.encodeObject(scanStatus?.rawValue, forKey: "scanStatus")
        aCoder.encodeObject(scanId, forKey: "scanId")
        aCoder.encodeObject(minSdkVersion, forKey: "minSdkVersion")
        aCoder.encodeObject(digestAlg, forKey: "digestAlg")
        aCoder.encodeObject(apkUrl, forKey: "apkUrl")
        aCoder.encodeObject(permissions, forKey: "permissions")
        aCoder.encodeObject(app, forKey: "app")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        createdAt = aDecoder.decodeObjectForKey("createdAt") as? Int
        version_ = aDecoder.decodeObjectForKey("version_") as? Int
        versionName = aDecoder.decodeObjectForKey("versionName") as? String
        approved = aDecoder.decodeObjectForKey("approved") as? Bool
        hash_ = aDecoder.decodeObjectForKey("hash_") as? String
        deviceInstallCount = aDecoder.decodeObjectForKey("deviceInstallCount") as? Int
        hashOriginal = aDecoder.decodeObjectForKey("hashOriginal") as? String
        approvalStatus = (aDecoder.decodeObjectForKey("approvalStatus") as? String) != nil ?
          CLVModels.Base.ApprovalStatus(rawValue: (aDecoder.decodeObjectForKey("approvalStatus") as! String)) : nil
        scanStatus = (aDecoder.decodeObjectForKey("scanStatus") as? String) != nil ?
          CLVModels.Apps.ScanStatus(rawValue: (aDecoder.decodeObjectForKey("scanStatus") as! String)) : nil
        scanId = aDecoder.decodeObjectForKey("scanId") as? String
        minSdkVersion = aDecoder.decodeObjectForKey("minSdkVersion") as? Int
        digestAlg = aDecoder.decodeObjectForKey("digestAlg") as? String
        apkUrl = aDecoder.decodeObjectForKey("apkUrl") as? String
        permissions = aDecoder.decodeObjectForKey("permissions") as? [String]
        app = aDecoder.decodeObjectForKey("app") as? CLVModels.Apps.App
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        createdAt <- map["createdAt"]
        version_ <- map["version_"]
        versionName <- map["versionName"]
        approved <- map["approved"]
        hash_ <- map["hash_"]
        deviceInstallCount <- map["deviceInstallCount"]
        hashOriginal <- map["hashOriginal"]
        approvalStatus <- map["approvalStatus"]
        scanStatus <- map["scanStatus"]
        scanId <- map["scanId"]
        minSdkVersion <- map["minSdkVersion"]
        digestAlg <- map["digestAlg"]
        apkUrl <- map["apkUrl"]
        permissions <- map["permissions"]
        app <- map["app"]
      }
    }
    
    
    
    public class App: NSObject, NSCoding, Mappable {
      public var id: String?
      /// Name of the app
      public var name: String?
      public var published: Bool?
      public var developer: CLVModels.Developer.Developer?
      /// Only available when app is installed to a merchant
      public var merchant: CLVModels.Merchant.Merchant?
      /// App Description
      public var description_: String?
      /// Short tagline for the app
      public var tagline: String?
      /// URL for embedded video
      public var videoUrl: String?
      /// Activation url for redirecting users after app installation.
      public var activationUrl: String?
      /// Site url for oauth redirect and web app launch from appmarket.
      public var siteUrl: String?
      /// Default oauth response type.
      public var defaultResponseType: CLVModels.Apps.OAuthResponseType?
      public var appDomain: String?
      public var androidVersion: CLVModels.Apps.AndroidVersion?
      public var packageName: String?
      public var approved: Bool?
      public var systemApp: Bool?
      public var hidden: Bool?
      public var filenameIcon: String?
      /// URL to the icon of the app. Generated from filenameIcon.
      public var filenameIconSmall: String?
      /// URL to the icon of the app. Generated from filenameIcon.
      public var filenameIconLarge: String?
      public var installCount: Int?
      public var sortOrder: Int?
      public var permissionMerchantRead: Bool?
      public var permissionMerchantWrite: Bool?
      public var permissionCustomersRead: Bool?
      public var permissionCustomersWrite: Bool?
      public var permissionInventoryRead: Bool?
      public var permissionInventoryWrite: Bool?
      public var permissionOrdersRead: Bool?
      public var permissionOrdersWrite: Bool?
      public var permissionPaymentsRead: Bool?
      public var permissionPaymentsWrite: Bool?
      public var permissionEmployeesRead: Bool?
      public var permissionEmployeesWrite: Bool?
      public var permissionProcessCards: Bool?
      public var permissionMidRead: Bool?
      public var privacyPolicy: String?
      public var eula: String?
      public var supportPhone: String?
      public var supportPhoneHours: String?
      public var supportEmail: String?
      public var supportUrl: String?
      public var productType: CLVModels.Apps.ProductType?
      public var approvalStatus: CLVModels.Base.ApprovalStatus?
      /// The app's android permissions
      public var androidPermissions: [CLVModels.Apps.AndroidPermission]?
      /// The app's screenshots
      public var screenshots: [CLVModels.Apps.Screenshot]?
      /// Available subscription options for this app
      public var availableSubscriptions: [CLVModels.Apps.AppSubscription]?
      /// Subscription options for this app
      public var subscriptions: [CLVModels.Apps.AppSubscription]?
      /// Available metered options for this app
      public var availableMetereds: [CLVModels.Apps.AppMetered]?
      /// Metered options for this app
      public var metereds: [CLVModels.Apps.AppMetered]?
      /// USB devices with which this app will communicate
      public var usbDevices: [CLVModels.Apps.AppUsbDevice]?
      /// DEPRECATED: This is now derived directly from billingStartTime (if future -> in trial; if past -> not in trial).  So it is now unnecessary.  Please update client code to not use it.
      public var isMerchantInTrial: Bool?
      /// The merchant's current subscription for this app
      public var currentSubscription: CLVModels.Apps.AppSubscription?
      /// The app's web hook
      public var webhook: CLVModels.Apps.WebHook?
      /// The app's uploaded apks
      public var androidVersions: [CLVModels.Apps.AndroidVersion]?
      ///  Whether the app is installed 
      public var installed: Bool?
      /// If the merchant has the app installed, this is the timestamp of when they installed the app.
      public var installedTime: NSDate?
      /// If the app is a paid app, this tells whether it currently offers a 30 day free trial or not.  Developer can toggle at will.
      public var paidAppHasTrial: Bool?
      /// Records the time that the approval status last changed
      public var approvalStatusModifiedTime: NSDate?
      /// Text will print on printed receipts for this app
      public var smartReceiptText: String?
      /// URL we will expose on printed and web receipts for this app
      public var smartReceiptUrl: String?
      /// If the merchant has the app installed, this is the timestamp of when they start/started paying.  If the merchant doesn't have the app installed, this is the timestamp of when they would start paying.  In UTC.  Applies to paid apps only.
      public var billingStartTime: NSDate?
      /// App's client secret for use with oauth
      public var appSecret: String?
      /// App's associated business types
      public var businessTypes: [CLVModels.Apps.BusinessType]?
      /// App's supported device types
      public var deviceTypes: [CLVModels.Apps.DeviceType]?
      public var modules: [CLVModels.Merchant.Module]?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(published, forKey: "published")
        aCoder.encodeObject(developer, forKey: "developer")
        aCoder.encodeObject(merchant, forKey: "merchant")
        aCoder.encodeObject(description_, forKey: "description_")
        aCoder.encodeObject(tagline, forKey: "tagline")
        aCoder.encodeObject(videoUrl, forKey: "videoUrl")
        aCoder.encodeObject(activationUrl, forKey: "activationUrl")
        aCoder.encodeObject(siteUrl, forKey: "siteUrl")
        aCoder.encodeObject(defaultResponseType?.rawValue, forKey: "defaultResponseType")
        aCoder.encodeObject(appDomain, forKey: "appDomain")
        aCoder.encodeObject(androidVersion, forKey: "androidVersion")
        aCoder.encodeObject(packageName, forKey: "packageName")
        aCoder.encodeObject(approved, forKey: "approved")
        aCoder.encodeObject(systemApp, forKey: "systemApp")
        aCoder.encodeObject(hidden, forKey: "hidden")
        aCoder.encodeObject(filenameIcon, forKey: "filenameIcon")
        aCoder.encodeObject(filenameIconSmall, forKey: "filenameIconSmall")
        aCoder.encodeObject(filenameIconLarge, forKey: "filenameIconLarge")
        aCoder.encodeObject(installCount, forKey: "installCount")
        aCoder.encodeObject(sortOrder, forKey: "sortOrder")
        aCoder.encodeObject(permissionMerchantRead, forKey: "permissionMerchantRead")
        aCoder.encodeObject(permissionMerchantWrite, forKey: "permissionMerchantWrite")
        aCoder.encodeObject(permissionCustomersRead, forKey: "permissionCustomersRead")
        aCoder.encodeObject(permissionCustomersWrite, forKey: "permissionCustomersWrite")
        aCoder.encodeObject(permissionInventoryRead, forKey: "permissionInventoryRead")
        aCoder.encodeObject(permissionInventoryWrite, forKey: "permissionInventoryWrite")
        aCoder.encodeObject(permissionOrdersRead, forKey: "permissionOrdersRead")
        aCoder.encodeObject(permissionOrdersWrite, forKey: "permissionOrdersWrite")
        aCoder.encodeObject(permissionPaymentsRead, forKey: "permissionPaymentsRead")
        aCoder.encodeObject(permissionPaymentsWrite, forKey: "permissionPaymentsWrite")
        aCoder.encodeObject(permissionEmployeesRead, forKey: "permissionEmployeesRead")
        aCoder.encodeObject(permissionEmployeesWrite, forKey: "permissionEmployeesWrite")
        aCoder.encodeObject(permissionProcessCards, forKey: "permissionProcessCards")
        aCoder.encodeObject(permissionMidRead, forKey: "permissionMidRead")
        aCoder.encodeObject(privacyPolicy, forKey: "privacyPolicy")
        aCoder.encodeObject(eula, forKey: "eula")
        aCoder.encodeObject(supportPhone, forKey: "supportPhone")
        aCoder.encodeObject(supportPhoneHours, forKey: "supportPhoneHours")
        aCoder.encodeObject(supportEmail, forKey: "supportEmail")
        aCoder.encodeObject(supportUrl, forKey: "supportUrl")
        aCoder.encodeObject(productType?.rawValue, forKey: "productType")
        aCoder.encodeObject(approvalStatus?.rawValue, forKey: "approvalStatus")
        aCoder.encodeObject(androidPermissions, forKey: "androidPermissions")
        aCoder.encodeObject(screenshots, forKey: "screenshots")
        aCoder.encodeObject(availableSubscriptions, forKey: "availableSubscriptions")
        aCoder.encodeObject(subscriptions, forKey: "subscriptions")
        aCoder.encodeObject(availableMetereds, forKey: "availableMetereds")
        aCoder.encodeObject(metereds, forKey: "metereds")
        aCoder.encodeObject(usbDevices, forKey: "usbDevices")
        aCoder.encodeObject(isMerchantInTrial, forKey: "isMerchantInTrial")
        aCoder.encodeObject(currentSubscription, forKey: "currentSubscription")
        aCoder.encodeObject(webhook, forKey: "webhook")
        aCoder.encodeObject(androidVersions, forKey: "androidVersions")
        aCoder.encodeObject(installed, forKey: "installed")
        aCoder.encodeObject(installedTime, forKey: "installedTime")
        aCoder.encodeObject(paidAppHasTrial, forKey: "paidAppHasTrial")
        aCoder.encodeObject(approvalStatusModifiedTime, forKey: "approvalStatusModifiedTime")
        aCoder.encodeObject(smartReceiptText, forKey: "smartReceiptText")
        aCoder.encodeObject(smartReceiptUrl, forKey: "smartReceiptUrl")
        aCoder.encodeObject(billingStartTime, forKey: "billingStartTime")
        aCoder.encodeObject(appSecret, forKey: "appSecret")
        aCoder.encodeObject(businessTypes, forKey: "businessTypes")
        aCoder.encodeObject(deviceTypes, forKey: "deviceTypes")
        aCoder.encodeObject(modules, forKey: "modules")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        published = aDecoder.decodeObjectForKey("published") as? Bool
        developer = aDecoder.decodeObjectForKey("developer") as? CLVModels.Developer.Developer
        merchant = aDecoder.decodeObjectForKey("merchant") as? CLVModels.Merchant.Merchant
        description_ = aDecoder.decodeObjectForKey("description_") as? String
        tagline = aDecoder.decodeObjectForKey("tagline") as? String
        videoUrl = aDecoder.decodeObjectForKey("videoUrl") as? String
        activationUrl = aDecoder.decodeObjectForKey("activationUrl") as? String
        siteUrl = aDecoder.decodeObjectForKey("siteUrl") as? String
        defaultResponseType = (aDecoder.decodeObjectForKey("defaultResponseType") as? String) != nil ?
          CLVModels.Apps.OAuthResponseType(rawValue: (aDecoder.decodeObjectForKey("defaultResponseType") as! String)) : nil
        appDomain = aDecoder.decodeObjectForKey("appDomain") as? String
        androidVersion = aDecoder.decodeObjectForKey("androidVersion") as? CLVModels.Apps.AndroidVersion
        packageName = aDecoder.decodeObjectForKey("packageName") as? String
        approved = aDecoder.decodeObjectForKey("approved") as? Bool
        systemApp = aDecoder.decodeObjectForKey("systemApp") as? Bool
        hidden = aDecoder.decodeObjectForKey("hidden") as? Bool
        filenameIcon = aDecoder.decodeObjectForKey("filenameIcon") as? String
        filenameIconSmall = aDecoder.decodeObjectForKey("filenameIconSmall") as? String
        filenameIconLarge = aDecoder.decodeObjectForKey("filenameIconLarge") as? String
        installCount = aDecoder.decodeObjectForKey("installCount") as? Int
        sortOrder = aDecoder.decodeObjectForKey("sortOrder") as? Int
        permissionMerchantRead = aDecoder.decodeObjectForKey("permissionMerchantRead") as? Bool
        permissionMerchantWrite = aDecoder.decodeObjectForKey("permissionMerchantWrite") as? Bool
        permissionCustomersRead = aDecoder.decodeObjectForKey("permissionCustomersRead") as? Bool
        permissionCustomersWrite = aDecoder.decodeObjectForKey("permissionCustomersWrite") as? Bool
        permissionInventoryRead = aDecoder.decodeObjectForKey("permissionInventoryRead") as? Bool
        permissionInventoryWrite = aDecoder.decodeObjectForKey("permissionInventoryWrite") as? Bool
        permissionOrdersRead = aDecoder.decodeObjectForKey("permissionOrdersRead") as? Bool
        permissionOrdersWrite = aDecoder.decodeObjectForKey("permissionOrdersWrite") as? Bool
        permissionPaymentsRead = aDecoder.decodeObjectForKey("permissionPaymentsRead") as? Bool
        permissionPaymentsWrite = aDecoder.decodeObjectForKey("permissionPaymentsWrite") as? Bool
        permissionEmployeesRead = aDecoder.decodeObjectForKey("permissionEmployeesRead") as? Bool
        permissionEmployeesWrite = aDecoder.decodeObjectForKey("permissionEmployeesWrite") as? Bool
        permissionProcessCards = aDecoder.decodeObjectForKey("permissionProcessCards") as? Bool
        permissionMidRead = aDecoder.decodeObjectForKey("permissionMidRead") as? Bool
        privacyPolicy = aDecoder.decodeObjectForKey("privacyPolicy") as? String
        eula = aDecoder.decodeObjectForKey("eula") as? String
        supportPhone = aDecoder.decodeObjectForKey("supportPhone") as? String
        supportPhoneHours = aDecoder.decodeObjectForKey("supportPhoneHours") as? String
        supportEmail = aDecoder.decodeObjectForKey("supportEmail") as? String
        supportUrl = aDecoder.decodeObjectForKey("supportUrl") as? String
        productType = (aDecoder.decodeObjectForKey("productType") as? String) != nil ?
          CLVModels.Apps.ProductType(rawValue: (aDecoder.decodeObjectForKey("productType") as! String)) : nil
        approvalStatus = (aDecoder.decodeObjectForKey("approvalStatus") as? String) != nil ?
          CLVModels.Base.ApprovalStatus(rawValue: (aDecoder.decodeObjectForKey("approvalStatus") as! String)) : nil
        androidPermissions = aDecoder.decodeObjectForKey("androidPermissions") as? [CLVModels.Apps.AndroidPermission]
        screenshots = aDecoder.decodeObjectForKey("screenshots") as? [CLVModels.Apps.Screenshot]
        availableSubscriptions = aDecoder.decodeObjectForKey("availableSubscriptions") as? [CLVModels.Apps.AppSubscription]
        subscriptions = aDecoder.decodeObjectForKey("subscriptions") as? [CLVModels.Apps.AppSubscription]
        availableMetereds = aDecoder.decodeObjectForKey("availableMetereds") as? [CLVModels.Apps.AppMetered]
        metereds = aDecoder.decodeObjectForKey("metereds") as? [CLVModels.Apps.AppMetered]
        usbDevices = aDecoder.decodeObjectForKey("usbDevices") as? [CLVModels.Apps.AppUsbDevice]
        isMerchantInTrial = aDecoder.decodeObjectForKey("isMerchantInTrial") as? Bool
        currentSubscription = aDecoder.decodeObjectForKey("currentSubscription") as? CLVModels.Apps.AppSubscription
        webhook = aDecoder.decodeObjectForKey("webhook") as? CLVModels.Apps.WebHook
        androidVersions = aDecoder.decodeObjectForKey("androidVersions") as? [CLVModels.Apps.AndroidVersion]
        installed = aDecoder.decodeObjectForKey("installed") as? Bool
        installedTime = aDecoder.decodeObjectForKey("installedTime") as? NSDate
        paidAppHasTrial = aDecoder.decodeObjectForKey("paidAppHasTrial") as? Bool
        approvalStatusModifiedTime = aDecoder.decodeObjectForKey("approvalStatusModifiedTime") as? NSDate
        smartReceiptText = aDecoder.decodeObjectForKey("smartReceiptText") as? String
        smartReceiptUrl = aDecoder.decodeObjectForKey("smartReceiptUrl") as? String
        billingStartTime = aDecoder.decodeObjectForKey("billingStartTime") as? NSDate
        appSecret = aDecoder.decodeObjectForKey("appSecret") as? String
        businessTypes = aDecoder.decodeObjectForKey("businessTypes") as? [CLVModels.Apps.BusinessType]
        deviceTypes = aDecoder.decodeObjectForKey("deviceTypes") as? [CLVModels.Apps.DeviceType]
        modules = aDecoder.decodeObjectForKey("modules") as? [CLVModels.Merchant.Module]
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        published <- map["published"]
        developer <- map["developer"]
        merchant <- map["merchant"]
        description_ <- map["description_"]
        tagline <- map["tagline"]
        videoUrl <- map["videoUrl"]
        activationUrl <- map["activationUrl"]
        siteUrl <- map["siteUrl"]
        defaultResponseType <- map["defaultResponseType"]
        appDomain <- map["appDomain"]
        androidVersion <- map["androidVersion"]
        packageName <- map["packageName"]
        approved <- map["approved"]
        systemApp <- map["systemApp"]
        hidden <- map["hidden"]
        filenameIcon <- map["filenameIcon"]
        filenameIconSmall <- map["filenameIconSmall"]
        filenameIconLarge <- map["filenameIconLarge"]
        installCount <- map["installCount"]
        sortOrder <- map["sortOrder"]
        permissionMerchantRead <- map["permissionMerchantRead"]
        permissionMerchantWrite <- map["permissionMerchantWrite"]
        permissionCustomersRead <- map["permissionCustomersRead"]
        permissionCustomersWrite <- map["permissionCustomersWrite"]
        permissionInventoryRead <- map["permissionInventoryRead"]
        permissionInventoryWrite <- map["permissionInventoryWrite"]
        permissionOrdersRead <- map["permissionOrdersRead"]
        permissionOrdersWrite <- map["permissionOrdersWrite"]
        permissionPaymentsRead <- map["permissionPaymentsRead"]
        permissionPaymentsWrite <- map["permissionPaymentsWrite"]
        permissionEmployeesRead <- map["permissionEmployeesRead"]
        permissionEmployeesWrite <- map["permissionEmployeesWrite"]
        permissionProcessCards <- map["permissionProcessCards"]
        permissionMidRead <- map["permissionMidRead"]
        privacyPolicy <- map["privacyPolicy"]
        eula <- map["eula"]
        supportPhone <- map["supportPhone"]
        supportPhoneHours <- map["supportPhoneHours"]
        supportEmail <- map["supportEmail"]
        supportUrl <- map["supportUrl"]
        productType <- map["productType"]
        approvalStatus <- map["approvalStatus"]
        androidPermissions <- (map["androidPermissions"], CLVArrayTransform<CLVModels.Apps.AndroidPermission>())
        screenshots <- (map["screenshots"], CLVArrayTransform<CLVModels.Apps.Screenshot>())
        availableSubscriptions <- (map["availableSubscriptions"], CLVArrayTransform<CLVModels.Apps.AppSubscription>())
        subscriptions <- (map["subscriptions"], CLVArrayTransform<CLVModels.Apps.AppSubscription>())
        availableMetereds <- (map["availableMetereds"], CLVArrayTransform<CLVModels.Apps.AppMetered>())
        metereds <- (map["metereds"], CLVArrayTransform<CLVModels.Apps.AppMetered>())
        usbDevices <- (map["usbDevices"], CLVArrayTransform<CLVModels.Apps.AppUsbDevice>())
        isMerchantInTrial <- map["isMerchantInTrial"]
        currentSubscription <- map["currentSubscription"]
        webhook <- map["webhook"]
        androidVersions <- (map["androidVersions"], CLVArrayTransform<CLVModels.Apps.AndroidVersion>())
        installed <- map["installed"]
        installedTime <- (map["installedTime"], CLVDateTransform())
        paidAppHasTrial <- map["paidAppHasTrial"]
        approvalStatusModifiedTime <- (map["approvalStatusModifiedTime"], CLVDateTransform())
        smartReceiptText <- map["smartReceiptText"]
        smartReceiptUrl <- map["smartReceiptUrl"]
        billingStartTime <- (map["billingStartTime"], CLVDateTransform())
        appSecret <- map["appSecret"]
        businessTypes <- (map["businessTypes"], CLVArrayTransform<CLVModels.Apps.BusinessType>())
        deviceTypes <- (map["deviceTypes"], CLVArrayTransform<CLVModels.Apps.DeviceType>())
        modules <- (map["modules"], CLVArrayTransform<CLVModels.Merchant.Module>())
      }
    }
    
    
    
    public class AppBillingInfo: NSObject, NSCoding, Mappable {
      /// Current subscription level of the merchant for this app
      public var appSubscription: CLVModels.Apps.AppSubscription?
      /// Returns true if the merchant is in trial for this app.  Only valid for paid apps that offer trials.  Trials apply to app metereds and app subscriptions
      public var isInTrial: Bool?
      /// When the merchant's trial ends.  Only valid for paid apps that offer trials
      public var billingStartTime: NSDate?
      /// Returns active if a merchant has a credit card on file, and if it's currently authorizing properly.  Returns lapsed if their card is absent or most recently declined
      public var status: CLVModels.Apps.MerchantBillingStatus?
      /// If the merchant's account is lapsed (i.e. merchant is behind on paying), the number of days since it lapsed
      public var daysLapsed: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(appSubscription, forKey: "appSubscription")
        aCoder.encodeObject(isInTrial, forKey: "isInTrial")
        aCoder.encodeObject(billingStartTime, forKey: "billingStartTime")
        aCoder.encodeObject(status?.rawValue, forKey: "status")
        aCoder.encodeObject(daysLapsed, forKey: "daysLapsed")
      }
      
      required public init(coder aDecoder: NSCoder) {
        appSubscription = aDecoder.decodeObjectForKey("appSubscription") as? CLVModels.Apps.AppSubscription
        isInTrial = aDecoder.decodeObjectForKey("isInTrial") as? Bool
        billingStartTime = aDecoder.decodeObjectForKey("billingStartTime") as? NSDate
        status = (aDecoder.decodeObjectForKey("status") as? String) != nil ?
          CLVModels.Apps.MerchantBillingStatus(rawValue: (aDecoder.decodeObjectForKey("status") as! String)) : nil
        daysLapsed = aDecoder.decodeObjectForKey("daysLapsed") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        appSubscription <- map["appSubscription"]
        isInTrial <- map["isInTrial"]
        billingStartTime <- (map["billingStartTime"], CLVDateTransform())
        status <- map["status"]
        daysLapsed <- map["daysLapsed"]
      }
    }
    
    
    
    public class AppBundle: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      /// The name of the bundle
      public var name: String?
      /// DEPRECATED: Instead use per country pricing in bundleCountries
      public var price: Int?
      /// DEPRECATED: Instead use per country pricing in bundleCountries
      public var pricePerDevice: Int?
      public var includedApps: [CLVModels.Apps.App]?
      /// Bundle country options for this app bundle
      public var bundleCountries: [CLVModels.Apps.AppBundleCountry]?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(price, forKey: "price")
        aCoder.encodeObject(pricePerDevice, forKey: "pricePerDevice")
        aCoder.encodeObject(includedApps, forKey: "includedApps")
        aCoder.encodeObject(bundleCountries, forKey: "bundleCountries")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        price = aDecoder.decodeObjectForKey("price") as? Int
        pricePerDevice = aDecoder.decodeObjectForKey("pricePerDevice") as? Int
        includedApps = aDecoder.decodeObjectForKey("includedApps") as? [CLVModels.Apps.App]
        bundleCountries = aDecoder.decodeObjectForKey("bundleCountries") as? [CLVModels.Apps.AppBundleCountry]
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        price <- map["price"]
        pricePerDevice <- map["pricePerDevice"]
        includedApps <- (map["includedApps"], CLVArrayTransform<CLVModels.Apps.App>())
        bundleCountries <- (map["bundleCountries"], CLVArrayTransform<CLVModels.Apps.AppBundleCountry>())
      }
    }
    
    
    
    public class AppBundleCountry: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      public var price: Int?
      public var pricePerDevice: Int?
      /// The country of the app bundle country
      public var country: String?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(price, forKey: "price")
        aCoder.encodeObject(pricePerDevice, forKey: "pricePerDevice")
        aCoder.encodeObject(country, forKey: "country")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        price = aDecoder.decodeObjectForKey("price") as? Int
        pricePerDevice = aDecoder.decodeObjectForKey("pricePerDevice") as? Int
        country = aDecoder.decodeObjectForKey("country") as? String
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        price <- map["price"]
        pricePerDevice <- map["pricePerDevice"]
        country <- map["country"]
      }
    }
    
    
    
    public class AppCarousel: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      public var name: String?
      public var countryCode: String?
      public var maxSize: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(countryCode, forKey: "countryCode")
        aCoder.encodeObject(maxSize, forKey: "maxSize")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        countryCode = aDecoder.decodeObjectForKey("countryCode") as? String
        maxSize = aDecoder.decodeObjectForKey("maxSize") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        countryCode <- map["countryCode"]
        maxSize <- map["maxSize"]
      }
    }
    
    
    
    public class AppMetered: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      /// DEPRECATED: App metered amount. Instead use per country pricing in meteredCountries
      public var amount: Int?
      /// DEPRECATED: App metered action. Instead use per country pricing in meteredCountries
      public var action: String?
      /// DEPRECATED: App metered active status. Instead use per country pricing in meteredCountries
      public var active: Bool?
      /// Metered country options for this app metered
      public var meteredCountries: [CLVModels.Apps.AppMeteredCountry]?
      /// Reference to the app this metered belongs to
      public var app: CLVModels.Apps.App?
      /// A label used to identify this metered action
      public var label: String?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(amount, forKey: "amount")
        aCoder.encodeObject(action, forKey: "action")
        aCoder.encodeObject(active, forKey: "active")
        aCoder.encodeObject(meteredCountries, forKey: "meteredCountries")
        aCoder.encodeObject(app, forKey: "app")
        aCoder.encodeObject(label, forKey: "label")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        action = aDecoder.decodeObjectForKey("action") as? String
        active = aDecoder.decodeObjectForKey("active") as? Bool
        meteredCountries = aDecoder.decodeObjectForKey("meteredCountries") as? [CLVModels.Apps.AppMeteredCountry]
        app = aDecoder.decodeObjectForKey("app") as? CLVModels.Apps.App
        label = aDecoder.decodeObjectForKey("label") as? String
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        amount <- map["amount"]
        action <- map["action"]
        active <- map["active"]
        meteredCountries <- (map["meteredCountries"], CLVArrayTransform<CLVModels.Apps.AppMeteredCountry>())
        app <- map["app"]
        label <- map["label"]
      }
    }
    
    
    
    public class AppMeteredCountry: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      /// App metered action
      public var action: String?
      /// The cost of the metered country
      public var amount: Int?
      /// The country of the metered country
      public var country: String?
      /// App metered country active status
      public var active: Bool?
      /// Reference to metered this metered country belongs to
      public var appMetered: CLVModels.Apps.AppMetered?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(action, forKey: "action")
        aCoder.encodeObject(amount, forKey: "amount")
        aCoder.encodeObject(country, forKey: "country")
        aCoder.encodeObject(active, forKey: "active")
        aCoder.encodeObject(appMetered, forKey: "appMetered")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        action = aDecoder.decodeObjectForKey("action") as? String
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        country = aDecoder.decodeObjectForKey("country") as? String
        active = aDecoder.decodeObjectForKey("active") as? Bool
        appMetered = aDecoder.decodeObjectForKey("appMetered") as? CLVModels.Apps.AppMetered
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        action <- map["action"]
        amount <- map["amount"]
        country <- map["country"]
        active <- map["active"]
        appMetered <- map["appMetered"]
      }
    }
    
    
    
    public class AppNotification: NSObject, NSCoding, Mappable {
      /// The app the notification will be sent to. This will be autopopulated by the server.
      public var app: CLVModels.Apps.App?
      /// 
      public var event: String?
      /// The time to live of the notification in seconds. By default this is 5 days.
      public var timeToLive: Int?
      /// Payload of the notification. This is at most 4000 characters.
      public var data: String?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(app, forKey: "app")
        aCoder.encodeObject(event, forKey: "event")
        aCoder.encodeObject(timeToLive, forKey: "timeToLive")
        aCoder.encodeObject(data, forKey: "data")
      }
      
      required public init(coder aDecoder: NSCoder) {
        app = aDecoder.decodeObjectForKey("app") as? CLVModels.Apps.App
        event = aDecoder.decodeObjectForKey("event") as? String
        timeToLive = aDecoder.decodeObjectForKey("timeToLive") as? Int
        data = aDecoder.decodeObjectForKey("data") as? String
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        app <- map["app"]
        event <- map["event"]
        timeToLive <- map["timeToLive"]
        data <- map["data"]
      }
    }
    
    
    
    public class AppSubscription: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      /// DEPRECATED: App subscription name.  Per country pricing in subscriptionCountries.
      public var name: String?
      /// DEPRECATED: The cost of the subscription.  Per country pricing in subscriptionCountries.
      public var amount: Int?
      /// DEPRECATED: App subscription name.  Per country pricing in subscriptionCountries.
      public var description_: String?
      /// DEPRECATED: App subscription active status.  Per country pricing in subscriptionCountries.
      public var active: Bool?
      /// Subscription country options for this app subscription
      public var subscriptionCountries: [CLVModels.Apps.AppSubscriptionCountry]?
      /// Reference to app this subscription belongs to
      public var app: CLVModels.Apps.App?
      /// App subscription label
      public var label: String?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(amount, forKey: "amount")
        aCoder.encodeObject(description_, forKey: "description_")
        aCoder.encodeObject(active, forKey: "active")
        aCoder.encodeObject(subscriptionCountries, forKey: "subscriptionCountries")
        aCoder.encodeObject(app, forKey: "app")
        aCoder.encodeObject(label, forKey: "label")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        description_ = aDecoder.decodeObjectForKey("description_") as? String
        active = aDecoder.decodeObjectForKey("active") as? Bool
        subscriptionCountries = aDecoder.decodeObjectForKey("subscriptionCountries") as? [CLVModels.Apps.AppSubscriptionCountry]
        app = aDecoder.decodeObjectForKey("app") as? CLVModels.Apps.App
        label = aDecoder.decodeObjectForKey("label") as? String
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        amount <- map["amount"]
        description_ <- map["description_"]
        active <- map["active"]
        subscriptionCountries <- (map["subscriptionCountries"], CLVArrayTransform<CLVModels.Apps.AppSubscriptionCountry>())
        app <- map["app"]
        label <- map["label"]
      }
    }
    
    
    
    public class AppSubscriptionCountry: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      /// App subscription country name
      public var name: String?
      /// The cost of the subscription country
      public var amount: Int?
      /// The country of the subscription country
      public var country: String?
      /// App subscription country name
      public var description_: String?
      /// App subscription country active status
      public var active: Bool?
      /// Reference to subscription this subscription country belongs to
      public var appSubscription: CLVModels.Apps.AppSubscription?
      /// The number of merchants that have this app subscription country installed
      public var installCount: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(amount, forKey: "amount")
        aCoder.encodeObject(country, forKey: "country")
        aCoder.encodeObject(description_, forKey: "description_")
        aCoder.encodeObject(active, forKey: "active")
        aCoder.encodeObject(appSubscription, forKey: "appSubscription")
        aCoder.encodeObject(installCount, forKey: "installCount")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        country = aDecoder.decodeObjectForKey("country") as? String
        description_ = aDecoder.decodeObjectForKey("description_") as? String
        active = aDecoder.decodeObjectForKey("active") as? Bool
        appSubscription = aDecoder.decodeObjectForKey("appSubscription") as? CLVModels.Apps.AppSubscription
        installCount = aDecoder.decodeObjectForKey("installCount") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        amount <- map["amount"]
        country <- map["country"]
        description_ <- map["description_"]
        active <- map["active"]
        appSubscription <- map["appSubscription"]
        installCount <- map["installCount"]
      }
    }
    
    
    
    public class AppUsbDevice: NSObject, NSCoding, Mappable {
      public var packageName: String?
      public var vendorId: Int?
      public var productId: Int?
      public var app: CLVModels.Apps.App?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(packageName, forKey: "packageName")
        aCoder.encodeObject(vendorId, forKey: "vendorId")
        aCoder.encodeObject(productId, forKey: "productId")
        aCoder.encodeObject(app, forKey: "app")
      }
      
      required public init(coder aDecoder: NSCoder) {
        packageName = aDecoder.decodeObjectForKey("packageName") as? String
        vendorId = aDecoder.decodeObjectForKey("vendorId") as? Int
        productId = aDecoder.decodeObjectForKey("productId") as? Int
        app = aDecoder.decodeObjectForKey("app") as? CLVModels.Apps.App
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        packageName <- map["packageName"]
        vendorId <- map["vendorId"]
        productId <- map["productId"]
        app <- map["app"]
      }
    }
    
    
    
    public class BusinessType: NSObject, NSCoding, Mappable {
      public var businessTypeGroupCode: CLVModels.Apps.BusinessTypeGroupCode?
      /// localized business type group
      public var businessTypeGroupName: String?
      public var code: CLVModels.Base.BusinessTypeCode?
      /// Localized business type
      public var name: String?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(businessTypeGroupCode?.rawValue, forKey: "businessTypeGroupCode")
        aCoder.encodeObject(businessTypeGroupName, forKey: "businessTypeGroupName")
        aCoder.encodeObject(code?.rawValue, forKey: "code")
        aCoder.encodeObject(name, forKey: "name")
      }
      
      required public init(coder aDecoder: NSCoder) {
        businessTypeGroupCode = (aDecoder.decodeObjectForKey("businessTypeGroupCode") as? String) != nil ?
          CLVModels.Apps.BusinessTypeGroupCode(rawValue: (aDecoder.decodeObjectForKey("businessTypeGroupCode") as! String)) : nil
        businessTypeGroupName = aDecoder.decodeObjectForKey("businessTypeGroupName") as? String
        code = (aDecoder.decodeObjectForKey("code") as? String) != nil ?
          CLVModels.Base.BusinessTypeCode(rawValue: (aDecoder.decodeObjectForKey("code") as! String)) : nil
        name = aDecoder.decodeObjectForKey("name") as? String
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        businessTypeGroupCode <- map["businessTypeGroupCode"]
        businessTypeGroupName <- map["businessTypeGroupName"]
        code <- map["code"]
        name <- map["name"]
      }
    }
    
    
    
    public enum BusinessTypeGroupCode: String {
      case FOOD
      case RETAIL
      case SERVICES
    }
    
    
    
    public class DeviceType: NSObject, NSCoding, Mappable {
      public var name: String?
      public var displayName: String?
      public var models: String?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(displayName, forKey: "displayName")
        aCoder.encodeObject(models, forKey: "models")
      }
      
      required public init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as? String
        displayName = aDecoder.decodeObjectForKey("displayName") as? String
        models = aDecoder.decodeObjectForKey("models") as? String
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        name <- map["name"]
        displayName <- map["displayName"]
        models <- map["models"]
      }
    }
    
    
    
    public enum MerchantBillingStatus: String {
      case ACTIVE
      case LAPSED
    }
    
    
    
    public enum OAuthResponseType: String {
      case TOKEN
      case CODE
    }
    
    
    
    public enum ProductType: String {
      case ANDROID
      case WEB
      case BOTH
    }
    
    
    
    public enum ScanStatus: String {
      case NOT_SCANNED
      case IN_PROGRESS
      case PASSED
      case FAILED
    }
    
    
    
    public class Screenshot: NSObject, NSCoding, Mappable {
      /// URL for the app screenshot
      public var name: String?
      /// URL for the small version (80 x 80) of the app screenshot
      public var small: String?
      /// URL for the medium version (200 x 200) of the app screenshot
      public var medium: String?
      /// URL for the large version (800 x 800) of the app screenshot
      public var large: String?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(small, forKey: "small")
        aCoder.encodeObject(medium, forKey: "medium")
        aCoder.encodeObject(large, forKey: "large")
      }
      
      required public init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as? String
        small = aDecoder.decodeObjectForKey("small") as? String
        medium = aDecoder.decodeObjectForKey("medium") as? String
        large = aDecoder.decodeObjectForKey("large") as? String
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        name <- map["name"]
        small <- map["small"]
        medium <- map["medium"]
        large <- map["large"]
      }
    }
    
    
    
    public class WebHook: NSObject, NSCoding, Mappable {
      public var url: String?
      /// A secret string included as a header in the HTTP request from Clover to the developer's web hook callback URL.
      public var secret: String?
      public var valid: Bool?
      /// The verification code that was sent to the developer's web hook callback URL.
      public var verification: String?
      public var orders: Bool?
      public var app: Bool?
      public var payments: Bool?
      public var inventory: Bool?
      public var customers: Bool?
      public var merchants: Bool?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(url, forKey: "url")
        aCoder.encodeObject(secret, forKey: "secret")
        aCoder.encodeObject(valid, forKey: "valid")
        aCoder.encodeObject(verification, forKey: "verification")
        aCoder.encodeObject(orders, forKey: "orders")
        aCoder.encodeObject(app, forKey: "app")
        aCoder.encodeObject(payments, forKey: "payments")
        aCoder.encodeObject(inventory, forKey: "inventory")
        aCoder.encodeObject(customers, forKey: "customers")
        aCoder.encodeObject(merchants, forKey: "merchants")
      }
      
      required public init(coder aDecoder: NSCoder) {
        url = aDecoder.decodeObjectForKey("url") as? String
        secret = aDecoder.decodeObjectForKey("secret") as? String
        valid = aDecoder.decodeObjectForKey("valid") as? Bool
        verification = aDecoder.decodeObjectForKey("verification") as? String
        orders = aDecoder.decodeObjectForKey("orders") as? Bool
        app = aDecoder.decodeObjectForKey("app") as? Bool
        payments = aDecoder.decodeObjectForKey("payments") as? Bool
        inventory = aDecoder.decodeObjectForKey("inventory") as? Bool
        customers = aDecoder.decodeObjectForKey("customers") as? Bool
        merchants = aDecoder.decodeObjectForKey("merchants") as? Bool
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map: Map) {}
      
      public func mapping(map: Map) {
        url <- map["url"]
        secret <- map["secret"]
        valid <- map["valid"]
        verification <- map["verification"]
        orders <- map["orders"]
        app <- map["app"]
        payments <- map["payments"]
        inventory <- map["inventory"]
        customers <- map["customers"]
        merchants <- map["merchants"]
      }
    }
    
  }
 }
