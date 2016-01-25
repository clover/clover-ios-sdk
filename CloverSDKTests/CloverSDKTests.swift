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
  let testMerchants = [
    TestMerchant(id: "K86H48SRX7MAY", name: "Clover Cafe", accessToken: "2a8d9a80-41a0-3689-05bf-c4da7f802c37"),
    TestMerchant(id: "MHXJ9W22QH00R", name: "Yusuf Erisen", accessToken: "d9e0a203-3bcc-5bb0-9b7d-ed44f91cbd96")
  ]

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testExample() {
    let testMerchant = testMerchants[0]
    let expectations = expectationWithDescription("very important!")

    CLVHTTPUtils.getMerchant2(testMerchant.id, merchantToken: testMerchant.accessToken,
      success: {
//        let url = ""
//        CLVHTTPUtils.getPayments() {}

        //      guard let merchant = merchant else { XCTFail(); return }
        let merchant = ($0)!
        XCTAssert(merchant.name == testMerchant.name)
//        print(merchant)
        expectations.fulfill()
      }, failure: {
//        print($0)
        XCTFail($0.description)
    })
    waitForExpectationsWithTimeout(5.0) { error in
      if (error == nil) {
        print(error)
      }
    }
    //    CLVHTTPUtils.getMerchant(merchant.id, merchantToken: merchant.accessToken, success: { m in
    ////      guard let m2 = m else { XCTFail(); return }
    //      XCTAssert(merchant.name == "")
    ////        XCTAssertEqual(m?.name as String, merchant.name)
    //      }) { error in
    //        XCTFail(error)
    //    }


    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }

  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measureBlock {
      self.testExample()
      // Put the code you want to measure the time of here.
    }
  }
  
}
