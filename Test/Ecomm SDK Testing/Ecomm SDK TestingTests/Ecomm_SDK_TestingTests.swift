//
//  Ecomm_SDK_TestingTests.swift
//  Ecomm SDK TestingTests
//
//  Created by Eric Rowe on 2/22/21.
//

import XCTest
@testable import Ecomm_SDK_Testing
@testable import CloverREST

class Ecomm_SDK_TestingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let expectation = XCTestExpectation()
        try? Clover.Customers.Customer.Get(
            success: { customers in
                for customer in customers {
                    print(customer.getName() ?? customer.id ?? "UNK")
                }
                XCTAssert(true)
                expectation.fulfill()
            },
            failure: { data, response, error in
                XCTFail()
            })
        wait(for: [expectation], timeout: 10)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
