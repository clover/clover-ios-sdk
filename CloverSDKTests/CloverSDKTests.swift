//
//  CloverSDKTests.swift
//  CloverSDKTests
//
//  Created by Yusuf on 11/24/15.
//  Copyright © 2015 Clover Network, Inc. All rights reserved.
//

import XCTest
@testable import CloverSDK

class CloverSDKTests: XCTestCase {
  struct TestMerchant {
    let id: String
    let name: String
    let accessToken: String
  }
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
}
