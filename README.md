
# Notes:

- This is an http wrapper for [Clover V3 REST API](https://www.clover.com/api_docs), it makes developing iOS apps with these endpoints much easier, however, this shouldn't be confused with our [Android](https://docs.clover.com/build/android-apps/) [SDK](https://github.com/clover/clover-android-sdk), which lets you develop apps that would work on Clover devices, and is much more powerful.

- This is an alpha version of the Clover iOS SDK, and is subject to change depending on the feedback.

- Currently, all V3 GET endpoints are supported, support for the other HTTP methods is in progress.

- Feedback and pull requests are greatly welcome and appreciated!



# Sample Usage:

- To install:

Using [cocoapods](https://guides.cocoapods.org/using/getting-started.html), add to your Podfile:

```
pod 'CloverSDK'
```

Import CloverSDK in each file you're using the SDK:


```
import CloverSDK
```

- To get an access token:

```
CLVSession.authenticateUser(forClientId: "####", withAppName: "", domain: .US, activeView: self,
  success: { session in
    // Persist the values in Keychain to use later
  }, failure: { err in
})
```

- Short example:

```
CLVSession(accessToken: "####", domain: .US, merchantId: "####")
  .getMerchantOrder(withId: "####", expands: ["lineItems"],
    success: { order in },
    failure: { error in })
```

- Full example:

```
let session = CLVSession(accessToken: "####", domain: .US, merchantId: "####")
session.getMerchantEmployees(
  	filters: ["role": "ADMIN"],
  	expands: ["shifts"],
  	  sorts: ["name": .ASC],
     params: [:],
      limit: 50,
     offset: 0,
    success: { employees in
    for employee in employees {
      print(employee.name!)
    }
  },
    failure: { error in
    switch error {
    case .UnacceptableStatusCode(let statusCode, let serverMessage):
      print("\(statusCode) - \(serverMessage)")
    case .Error(let error): print(error)
    case .UnknownError: print("Unknown error!")
    }
})
```

- CloverSDK handles 429 (too many requests) error cases by retrying the same request with exponentially increasing time delays.

# Components of the Clover iOS SDK:

## Models: Swift models of the json responses listed [api_docs](https://www.clover.com/api_docs) page

- All models conform to `NSObject` and `NSCoding` for iOS persistence.

- All models conform to `Mappable`  (open source library: ObjectMapper) for serialization/deserialization of json.

- The alpha version includes some models which are not on the public api, but expanded on some api calls, so some of the models will be removed in the following versions.

- All models inherit from main `CLVModel`  class, and then grouped into logical group classes; as an example, the customer address model would be: `CLVModels.Customers.Address`.

- Most fields on the models have documentation, which will show with auto-completion in Xcode.

- Some field name which conflict with Swift keywords are changed to have an underscore at the end, as: `description_`.

## Utils: Helper classes for api calls

- Two main classes are: `CLVSession` and `CLVRequest`.

- `CLVSession`

  - Once you already have the merchant’s id, merchant token, and the domain (currently US or EU and Sandbox for development), you can initiate a session object and then start calling Clover endpoints on that object which stores those information.

  - Session has two static vars which define debugging options. `debugMode` is a boolean which determines if any output will be made with requests, and `debugPrintOptions` is a list of enum values which you individually opt in to get output of.

```
let session = CLVSession(accessToken: "####", domain: .US, merchantId: "####")
session.getMerchantOrder(withId: "####", expands: ["lineItems"])
```

- `CLVRequest`

  - This is mainly used internally by the methods calling our v3 endpoints, but it can also be used by itself for further customization or for using v1/v2 endpoints.

  - It has a builder for passing all options, and an initializer with absolute minimum options: http method, domain, and the endpoint. Once you pass in all the options, you   can call `build()` to get a `CLVRequest` object. The builder also takes a `CLVRequest` parameter when modifying a request is needed.

  - Once you have a `CLVRequest` object, there are `makeRequest…()` methods that can be called on that object, which the endpoint methods use internally, but they’re also public methods. These methods take care of all the pre and post request validations, handle resubmitting a request if a 429 - too many requests error was received, and calls the appropriate `success` or `failure` block passed in. There are three kinds to get a single object, an array of an object, or to get an `AnyObject` for models that are not included in `CLVModels` (for v1/v2 endpoints).

  - `CLVMethods` file is an extension on `CLVSession`, is an auto-generated file, and includes calls to all GET endpoints on our api_docs page, such as: `getMerchantOrderDiscounts:withId:`. Making POST and DELETE requests is not supported with these methods at this point, but will be included in the beta version, however, you can use the `CLVRequest.Builder` class and `makeRequest` methods for now.

  - Some of the endpoint methods return a single object (such as `getMerchantOrder:withId:`) and some of them return an array of that object (such as `getMerchantOrders:`). The returned objects are optional, whereas arrays are not, but they can just be empty.

  - `CLVEndpoint` is an enum with two cases: `V3` and `Custom`. `V3` takes a parameter of `CLVV3Endpoint` which is another enum with all our v3 endpoint urls defined. If you need to call a different endpoint (v1/v2), you can use `Custom` with a String as url.

  - `CLVError` is an enum which inherits from standard `ErrorType` . For now, it only has options for non-200 status code, NSError, and unknown error, but more granular options may be added in the future versions. It also has a calculated var `error` for when an NSError object is needed.

## PromiseKit Extension

- In our experience of using the SDK for the Clover Dashboard app, when using multiple consecutive api calls, using success and failure methods made the code harder to read and debug; as an alternative, we support the open source port of the `Promise` concept, where you can act on promised object when they become available. All the CLVRequest.makeRequest methods and endpoint methods are also redefined for the PromiseKit. Usage example:

```
let session = CLVSession(accessToken: "####", domain: .US, merchantId: "####")
session.getMerchantOrders(filters: ["employee.id": "####"], expands: ["lineItems", "customers"])
  .then() { (orders) -> String? in
    for order in orders {
      print(order.lineItems!)
    }
    return orders.first?.employee?.id
  }
  .then() { (employeeId) -> Void in
    guard let employeeId = employeeId else { return }
    session.getMerchantEmployee(withId: employeeId)
    ...
  }
  .always() {
    // cleanup code, such as: hide spinners
  }
  .error() { error in
    print(error)
}
```

- Use of PromiseKit is still experimental, so use at your own risk.

## OAuth

- This is a helper class that uses a web page that pops up inside the app, asks the user to sign in and install your app, and if they do, returns you a CLVSession object with all the values filled in.

- `clientId` is the id of your app. For now, you need to infer/ask the user their region before referring to the webpage popup since they cannot just change the url on the login page and you need to pass in the appropriate app id for the region in case your app exists in multiple regions. We may put an option on the login page for the user to switch to a different region, and if so, we’ll update this method so that you won’t need to know their region beforehand.

- `appName` is only used as title of the browser window.

- `domain` is the region your app is in.

- `activeView` is the ViewController you’re calling this from.

- It’s important only to use Keychain to save these information as the token can be used by anyone to make api requests on behalf of the merchant!

```
CLVSession.authenticateUser(forClientId: "####", withAppName: "App", domain: .US, activeView: self,
  success: { (session) -> Void in
    // Persist the values in Keychain to use later
  }) { (error) -> Void in
    // ...
}
```
