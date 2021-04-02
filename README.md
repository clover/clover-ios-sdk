# Ecomm REST SDK for iOS

This SDK provides a native wrapper for the Ecomm REST APIs.  It provides native component wrappers for card tokenization and prebuilt models for the objects used to communicate with Clover services.

## Quick Start - Examples ##
The fastest way to see what this SDK has to offer is to load up the Example App and explore.  In this version there is a single example, based around a fictional merchant "Mike's Movers", that showcases how to use the Ecomm SDK to build an app that provides payments and logistical services for crewmembers of a moving company.

1) Set up the local environment
  - Install CocoaPods on your development machine.
  - Clone this repo to a working directory.
  - In a terminal window, navigate to the /Examples/Merchant/Merchant Example directory.  Execute the command `pod install`.  This will generate an Xcode workspace containing the example app and the Pod containing the SDK and all models.
  - Open the new workspace `Merchant Example.xcworkspace`.  Note: do not open the .xcodeproj file directly, as it does not contain the SDK.
2) Set up a Merchant
  - Navigate to [http://sandbox.dev.clover.com/developer-home]
  - Create an account or log in, then create a merchant.  Ensure the merchant has Read/Write access for all permissions, and Enable online payments
  - Change the site URL to your server's base address
3) Setup your Server and OAuth Callbacks
  - Follow the instructions on [OAuth and Apple App Site Association](https://github.com/clover/clover-ios-sdk/wiki/OAuth-and-Apple-App-Site-Association)
4) Ensure the following elements in the example code have been updated with your settings
  - In the Target Configuration: set the Team, Bundle Identifier, Signing Certificate to your configuration
  - In the Target Configuration: ensure the Associated Domain was configured from the previous step
  - In Merchant_ExampleApp.swift: Replace the placeholders with your associated domain and app configuration information
5) Build and Run


## SwiftUI and UI Kit ##
This SDK supports both SwiftUI and UI Kit based development.  The examples provided are designed to give you an overview of how to implement each.

  - Everywhere possible, which is most of the time, the SDK is independant of the UI platform used.  The REST calls for example are not dependant on Swift UI or UI Kit.
  - The one area where this is not possible is with the iFrame, since it contains UI Components.  The iFrame is designed using a UI Kit component, wrapping a Web View.  Also provided are wrappers that allow that UI Kit component to be used in a SwiftUI build.
  - Merchant Example - This example project is SwiftUI based, and provides a complete example of how to use the entire SDK.  It shows how to utilize the REST calls as well as shows how to use the SwiftUI Wrapper for the iFrame component.
  - Merchant Example UIKit - This example project is UI Kit based, and provides an example only of how to use the UI Kit iFrame component directly.  For how to use the REST calls, please see the other example project.

## New in V1.0 ##
You may have noticed that V1.0 looks a little different from V0.31 released back in 2016.  V1.0 represents a rewrite and update supporting the latest iOS and Swift versions.  The model files have been updated from the backing data, and a new set of wrappers are now provided to speed up your development.  Look for more updates in the future as we continue to develop and improve this SDK moving forward.
